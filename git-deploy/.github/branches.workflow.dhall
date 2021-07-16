let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:cd16a34ec5c7cd26964440489b16510fd4880bbaa721bb5bdde2ea2dcd151b99
  with on = On.match On.Event.FeatureBranches "git-deploy"
  with name = "git-deploy (branch)"
