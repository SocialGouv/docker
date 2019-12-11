#!/bin/node
const execSync = require("child_process").execSync;

const args = process.argv.slice(2);
const dryRun = args.includes("--dry-run");
const k8sNamespace = process.env.K8S_NAMESPACE;

const objectTypes = [
  "pod",
  "service",
  "ingress",
  "configmap",
  "statefulset",
  "deployment",
  "job"
];

const listK8sCmd = `kubectl get ${objectTypes.join(
  ","
)}  -n ${k8sNamespace} -o custom-columns=":metadata.name,:metadata.labels['git/branch']",:kind`;

const listGithubBranchCmd = "git ls-remote --quiet --heads | cut -f2";

function getDeleteObjectCmd(id, type) {
  if (!id || id.length === 0) {
    throw new Error("getDeleteObjectCmd needs id parameter");
  }
  if (!type || type.length === 0) {
    throw new Error("getDeleteObjectCmd needs type parameter");
  }
  return `kubectl delete ${type} ${id} -n ${k8sNamespace}`;
}

function getk8sObject() {
  const k8ObjectList = execSync(listK8sCmd).toString();
  return k8ObjectList
    .split("\n")
    .map(line => {
      const [id, branchRaw, kind = ""] = line.split(/\s+/g);
      return {
        id,
        branch: branchRaw === "<none>" ? undefined : branchRaw,
        kind: kind.toLowerCase()
      };
    })
    .filter(({ id }) => Boolean(id));
}

function getGithubBranches() {
  const remoteBranches = execSync(listGithubBranchCmd).toString();
  return remoteBranches
    .split("\n")
    .filter(branch => branch !== "master")
    .map(branch => ciCommitRefSlug(branch.replace("refs/heads/", "")))
    .filter(Boolean);
}

function ciCommitRefSlug(str) {
  return str
    .toLowerCase()
    .slice(0 - 63)
    .replace(/[^0-9a-z]/g, "-");
}

function hashBranchName(branchName) {
  return execSync(`printf "${branchName}" | sha1sum | cut -c1-7`)
    .toString()
    .trim();
}

function main() {
  if (!k8sNamespace) {
    console.error("please provide a K8S_NAMESPACE env variable");
    process.exit(-1);
  }

  const k8sObjectList = getk8sObject();
  const hashedBranchName = getGithubBranches().map(hashBranchName);

  const objectsToDelete = k8sObjectList.filter(({ id, branch }) => {
    if (/^master$/.test(branch) || /-master(-|$)?/.test(id)) {
      return false;
    }
    if (/^v\d+-\d+-\d+$/.test(branch) || /-v\d+-\d+-\d+(-|$)/.test(id)) {
      return false;
    }
    return !hashedBranchName.some(hash => new RegExp(`-${hash}(-|$)`).test(id));
  });

  /**
   * Delete k8s object
   */
  objectsToDelete.forEach(({ id, kind }) => {
    console.log(getDeleteObjectCmd(id, kind));
    if (!dryRun) {
      execSync(getDeleteObjectCmd(id, kind));
    }
  });
}

// clean, clean, clean
main();
