let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:92dd04aba215b7f9be01fa24193d62f7842af97265b37efe9f022ec457dee075
  with on = On.match On.Event.FeatureBranches "kubectl"
  with name = "kubectl (branch)"
