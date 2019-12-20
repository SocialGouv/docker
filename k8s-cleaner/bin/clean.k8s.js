#!/bin/node
const execSync = require("child_process").execSync;

const args = process.argv.slice(2);
const dryRun = args.includes("--dry-run");
const k8sNamespace = process.env.K8S_NAMESPACE || "";
const gitRepository = process.env.GITHUB_REPOSITORY || "";
const hashSize = process.env.HASH_SIZE || 7;

if (!k8sNamespace) {
  console.error("please provide a K8S_NAMESPACE env variable");
  process.exit(-1);
}
if (!gitRepository || !gitRepository.startsWith("https")) {
  console.error("please provide a GITHUB_REPOSITORY env variable");
  process.exit(-1);
}

const objectTypes = [
  "pod",
  "service",
  "ingress",
  "configmap",
  "statefulset",
  "deployment",
  "job",
  "cronjob"
];

const listK8sCmd = `kubectl get ${objectTypes.join(
  ","
)}  -n ${k8sNamespace} -o custom-columns=":metadata.name,:metadata.labels['git/branch']",:kind`;

const listGithubBranchCmd = `git ls-remote --quiet --heads ${gitRepository} | cut -f2`;

function getHashBranchCmd(branchName) {
  return `printf "${branchName}" | shasum | cut -c1-${hashSize}`;
}

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
  return execSync(getHashBranchCmd(branchName))
    .toString()
    .trim();
}

function main() {
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
