let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:498ea8b082b03ff4772b31545a910e3d367e94359cba00b6db29a1b7ac83266d
  with on = On.match On.Event.ReleasesBranches "dhall"
  with name = "dhall (main)"
