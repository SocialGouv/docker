let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:4707c4e3821334feee74e1b0dc260d7f723165813a84a782e36223a8f2007080
  with on = On.match On.Event.FeatureBranches "azure-cli"
  with name = "azure-cli (branch)"
