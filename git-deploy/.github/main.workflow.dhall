let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:1a923ae3aeb1a1f9d606d7b737030efeaf80062b7bb0861f1959c0ab95801104
  with on = On.match On.Event.ReleasesBranches "git-deploy"
  with name = "git-deploy (main)"
