let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:87313e306cfd39e4b59b16e35144f462207a57d9d7652450fe97f45d8612b385
  with on = On.match On.Event.FeatureBranches "no-k8s"
  with name = "no-k8s (branch)"
