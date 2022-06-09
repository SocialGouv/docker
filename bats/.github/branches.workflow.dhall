let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:f0483ede4a67bfb6dd26d8ab7e0c74c2cf2bf6a1765388b744e75262bab358cf
  with on = On.match On.Event.FeatureBranches "bats"
  with name = "bats (branch)"
