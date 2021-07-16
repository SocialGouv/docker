let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:f93556bf7ec4659bf23eaaf0abb69974e3c5a4b5979d2f4169598260b4e09ec4
  with on = On.match On.Event.ReleasesBranches "curl"
  with name = "curl (main)"
