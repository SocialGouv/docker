let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:cdf6e62a93fe3d07789eeef616b885cfdb0b78c87e2d72c761b7a7259b19223e
  with on = On.match On.Event.FeatureBranches "curl"
  with name = "curl (branch)"
