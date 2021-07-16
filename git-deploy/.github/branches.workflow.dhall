let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:301b261621031aa3430166cce91638e0cb5b8a0fe7c71fb2c8ceddabd82f170e

in  ./AssemblyLine.dhall
      sha256:757f105f3210a50f16ba9238d2f08214d0fdd83cf3c84f2d89136e94bf0ae7ad
  with on = On.match On.Event.FeatureBranches "git-deploy"
  with name = "git-deploy (branch)"
