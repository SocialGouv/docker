let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:57029424d538e7bc7e95dc2f1837a39527a3c588f4030bbf79a5203cc9245c12
  with on = On.match On.Event.ReleasesBranches "azure-cli"
  with name = "azure-cli (main)"
