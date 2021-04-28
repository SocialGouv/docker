let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:9627c773aa4277461ec30dddab365f70ed7cea8396960d3558aec72292234337
  with on = On.match On.Event.ReleasesBranches "bats"
  with name = "bats (main)"
