let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:49eb937be922d92a41da6633b7244b746e11b6ec335a996619e51f875a9955e0
  with on = On.match On.Event.FeatureBranches "dhall"
  with name = "dhall (branch)"
