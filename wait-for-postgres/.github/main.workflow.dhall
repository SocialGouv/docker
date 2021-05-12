let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:381042ee05a2a0e221c0c609c25cd2b5a2fba84e170568834ad56f4189eecf84
  with on = On.match On.Event.ReleasesBranches "wait-for-postgres"
  with name = "wait-for-postgres (main)"
