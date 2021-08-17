let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:59ce45f138c9bdf9ba2dbb5e67f762a508dc044282e0762736d209959a9e9318
  with on = On.match On.Event.FeatureBranches "ci-deploy"
  with name = "ci-deploy (branch)"
