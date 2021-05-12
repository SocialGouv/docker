let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:133a6426dd9adc1e4a1c685c7deb49ed1e6e9a04bb1a70a700d922fd2db033ee
  with on = On.match On.Event.ReleasesBranches "curl"
  with name = "curl (main)"
