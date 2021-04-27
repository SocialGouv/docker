let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:b63a50fb53aaccf30ea001e6541e3e88c43dbe2667bb5540a4d9036be8ce0792
  with on = On.match On.Event.ReleasesBranches "kosko"
  with name = "kosko (main)"
