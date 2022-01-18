let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:211dc7ab432c05fbe6ad7f2b48eaa803b6830b8e363a60bfcb17ae6376baec89
  with on = On.match On.Event.FeatureBranches "psql"
  with name = "psql (branch)"
