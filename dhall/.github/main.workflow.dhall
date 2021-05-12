let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:23e67ec0aaf11779c94b1d11d5d8552b564bcd60632e4fd86c06e6db63268ea8
  with on = On.match On.Event.ReleasesBranches "dhall"
  with name = "dhall (main)"
