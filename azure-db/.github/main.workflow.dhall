let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:77e2e2685ae15492aeb1fdf59fe8ac3067e8f0c231b8158bc000824a79ca3426
  with on = On.match On.Event.ReleasesBranches "azure-db"
  with name = "azure-db (main)"
