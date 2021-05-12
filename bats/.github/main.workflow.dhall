let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:abeaa1f771f993f6503677c6e9b40e3f38b2c5d3ce571ab3c518f4c0e35711c2
  with on = On.match On.Event.ReleasesBranches "bats"
  with name = "bats (main)"
