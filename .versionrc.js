/* eslint-disable node/no-unpublished-require */
const path = require("path")
const fs = require("fs-extra")

// package.json
const getDirectoriesSync = (source) =>
  fs
    .readdirSync(source, { withFileTypes: true })
    .filter((dirent) => dirent.isDirectory() || dirent.isSymbolicLink())
    .map((dirent) => dirent.name)
    .filter((name) =>fs.pathExistsSync(path.join(source,name,"Dockerfile")))

const bumpFiles = []


// const packageDirs = getDirectoriesSync(".")
// for (const dir of packageDirs) {
//   const filename = `./${dir}/package.json`
//   if (fs.pathExistsSync(filename)) {
//     bumpFiles.push({
//       filename,
//       type: "json",
//       // updater: "",
//     })
//   }
// }

module.exports = {
  bumpFiles,
}
