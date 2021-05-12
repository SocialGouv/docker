let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:d72bcc17861427aacc05a16d0462de5a8b9b61f085b45737f4943c71b311a4f2
  with on = On.match On.Event.FeatureBranches "azure-db"
  with name = "azure-db (branch)"
