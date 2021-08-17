let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:2f9641a22bf6608068aade0c33175c9c850e20085fd7654868eb403079805534
  with on = On.match On.Event.FeatureBranches "azure-cli"
  with name = "azure-cli (branch)"
