let On =
      ../../.github/dhall/workflows/On.dhall sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall sha256:cb65aab4f9f555d30f86625a544db3e78dea6731ea706f0d752d6d378356aa2d
  with on = On.match On.Event.FeatureBranches "no-k8s"
  with name = "no-k8s (branch)"
