let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:b48ba63a2fe398e9314672480402e253ece0c89fa0ecacc19c8c55230071f831
  with on = On.match On.Event.FeatureBranches "ci-deploy"
  with name = "ci-deploy (branch)"
