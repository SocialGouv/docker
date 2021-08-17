let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:82448f08b032cb4e04f3c7512498eccc4503e4b170703963799e33a32f2b870b
  with on = On.match On.Event.FeatureBranches "kosko"
  with name = "kosko (branch)"
