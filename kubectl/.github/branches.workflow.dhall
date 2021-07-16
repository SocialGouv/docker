let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:cfb91d826fee0d6b7b446ffdf40902e5e168056c6175d789d21ec68c3ecdc6af
  with on = On.match On.Event.FeatureBranches "kubectl"
  with name = "kubectl (branch)"
