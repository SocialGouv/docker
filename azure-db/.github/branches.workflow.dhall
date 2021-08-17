let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:fc0f870ff0cf6fdae4d67bf5cdcd78e33a21f59a642620d10e92aaf6cae3bfa2
  with on = On.match On.Event.FeatureBranches "azure-db"
  with name = "azure-db (branch)"
