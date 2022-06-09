let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:d5f6b557f60f4af2229e6e79bf4e228a553b6107a8a8a19dde85b7f7a9a780c2
  with on = On.match On.Event.FeatureBranches "nginx4spa"
  with name = "nginx4spa (branch)"
