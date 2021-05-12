let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:4da0a922a786049b001dae7ae7b5fb15c2ec3a638b9150c45043144b1d9ddf01
  with on = On.match On.Event.ReleasesBranches "dhall"
  with name = "dhall (main)"
