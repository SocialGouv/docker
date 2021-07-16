let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:e366adf9b7dfa01655c38206068c997d1cd0ab75fda4ac064fb9b989a110554c
  with on = On.match On.Event.ReleasesBranches "wait-for-http"
  with name = "wait-for-http (main)"
