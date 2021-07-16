let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:a28e42e20cc6707ec6c58985e8af95a887497bfac40adb180b3176d70dc803c4
  with on = On.match On.Event.FeatureBranches "azure-cli"
  with name = "azure-cli (branch)"
