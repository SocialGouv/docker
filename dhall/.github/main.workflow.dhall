let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:91d9cedad5d0a7fe633788b47ef07b6bd5cff65c12ea23aba0e3569ea488d332
  with on = On.match On.Event.ReleasesBranches "dhall"
  with name = "dhall (main)"
