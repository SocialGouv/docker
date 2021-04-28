let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:0f263b61b489d6c182db6f158fa9e6e82334cf36fd45ec345543db6dac0008fe
  with on = On.match On.Event.ReleasesBranches "no-k8s"
  with name = "no-k8s (main)"
