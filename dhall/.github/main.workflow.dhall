let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:b46997744ffdbab478ea0285cbfa6b28e5995a631e17fade6ed9401c2f537e7f
  with on = On.match On.Event.ReleasesBranches "dhall"
  with name = "dhall (main)"
