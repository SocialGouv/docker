let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:46593f10e8c59c06e4089184986cba1d33f38f75d5e1bbd1913ed2240c019f1c
  with on = On.match On.Event.FeatureBranches "git-deploy"
  with name = "git-deploy (branch)"
