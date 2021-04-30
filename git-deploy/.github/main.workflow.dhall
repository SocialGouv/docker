let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:71457a7c44a451f34af51d1ae5a7f51ad032aa8b589568404b25f004f32ecaf4
  with on = On.match On.Event.ReleasesBranches "git-deploy"
  with name = "git-deploy (main)"
