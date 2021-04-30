let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:f1117013e1a9b4da332e74d59e85271205e784f54a76cba94f66d0c47e62650b
  with on = On.match On.Event.ReleasesBranches "curl"
  with name = "curl (main)"
