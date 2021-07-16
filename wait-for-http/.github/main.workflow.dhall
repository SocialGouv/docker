let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:dcc730b2b906b50a99bbb531c05d00d3f2fdaf8f7ee97171074952452f3a560f
  with on = On.match On.Event.ReleasesBranches "wait-for-http"
  with name = "wait-for-http (main)"
