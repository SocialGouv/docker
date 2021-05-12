let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:09ce4a4b72f3064942bdda950dfba467e541bbee456c4ff8261a21db51cb30e5
  with on = On.match On.Event.ReleasesBranches "curl"
  with name = "curl (main)"
