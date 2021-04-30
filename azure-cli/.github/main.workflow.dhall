let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:868152eabedb900f33e0415223a622d10fe6a973dc0481ef973f82b66c686542
  with on = On.match On.Event.ReleasesBranches "azure-cli"
  with name = "azure-cli (main)"
