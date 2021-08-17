let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:1d0e4d89aa70eb0359d371030630103a3e7fd58fc3d5f3d02e0cb8532051a793
  with on = On.match On.Event.FeatureBranches "azure-cli"
  with name = "azure-cli (branch)"
