let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:0e8df1f6273841f5afd0250144679b5c3e96e931aaf801e02a417c10a9523c7f
  with on = On.match On.Event.FeatureBranches "dhall"
  with name = "dhall (branch)"
