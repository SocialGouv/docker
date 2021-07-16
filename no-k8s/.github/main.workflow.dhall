let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:ff0ce09d5f642e58510d8cc737efecda58f061df53e3feb9d3490bc3529ed190
  with on = On.match On.Event.ReleasesBranches "no-k8s"
  with name = "no-k8s (main)"
