let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:851e61349bde3390a516bd06af49831b4230667383956c6f9c472f18bc7a9952
  with on = On.match On.Event.FeatureBranches "no-k8s"
  with name = "no-k8s (branch)"
