let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:68fc68a72cedb0a8c832f31dd73309e477abc1867f48ea06c8f0db64b17eba35
  with on = On.match On.Event.ReleasesBranches "no-k8s"
  with name = "no-k8s (main)"
