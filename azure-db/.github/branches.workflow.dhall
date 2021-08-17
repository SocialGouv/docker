let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:243b364a4cec7a62ed5be8cdfabfc195df1f68e3e38af3e7d30d85494cb454c9
  with on = On.match On.Event.FeatureBranches "azure-db"
  with name = "azure-db (branch)"
