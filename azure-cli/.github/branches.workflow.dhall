let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:fd283fa80b64de4a47ecf624468f4179b3e2b285d9cbdfa13b3415ae8d5aa4a2
  with on = On.match On.Event.FeatureBranches "azure-cli"
  with name = "azure-cli (branch)"
