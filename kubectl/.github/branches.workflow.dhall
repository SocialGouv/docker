let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:2052a55f9e96bc39c0c0fcad0c895416e209d5a737769a718e3c244d8859fff4
  with on = On.match On.Event.FeatureBranches "kubectl"
  with name = "kubectl (branch)"
