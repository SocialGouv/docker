let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:76c93a2518f0912e9070691b66621e6015158c96c63495b38f405f4baa764680
  with on = On.match On.Event.FeatureBranches "azure-cli"
  with name = "azure-cli (branch)"
