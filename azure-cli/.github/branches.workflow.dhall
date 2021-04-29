let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:fcabeaa895564f2dc0a569a68ff09f21fe8d95ef69f05529270e3c8b501706bc
  with on = On.match On.Event.FeatureBranches "azure-cli"
  with name = "azure-cli (branch)"
