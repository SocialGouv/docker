let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:e9e8ad1a1ec532c53769fe1fa2c7316785fa34f6383526f1a91db268536e05d8
  with on = On.match On.Event.FeatureBranches "curl"
  with name = "curl (branch)"
