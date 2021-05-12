let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:c4d284df0d43ff744c2f1bcb2fe076353b4178eb8a1f068ead727eee5efa3c90
  with on = On.match On.Event.ReleasesBranches "wait-for-http"
  with name = "wait-for-http (main)"
