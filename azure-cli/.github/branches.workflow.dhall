let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:2b461183fe1dc9b8918452ec256d051c9b12b15bd3557942095d93b757216483
  with on = On.match On.Event.FeatureBranches "azure-cli"
  with name = "azure-cli (branch)"
