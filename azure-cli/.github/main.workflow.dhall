let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:f2ff26b2539752952fdf46db52fcf486a676bf0d63a6e27ead437646024040b6
  with on = On.match On.Event.ReleasesBranches "azure-cli"
  with name = "azure-cli (main)"
