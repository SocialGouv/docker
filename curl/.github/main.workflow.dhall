let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:797ad05f7ee7d19d66579c63b0bf3545878abdc738070735b19f9bf5a25bb26c
  with on = On.match On.Event.ReleasesBranches "curl"
  with name = "curl (main)"
