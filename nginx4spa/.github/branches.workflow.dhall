let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:2f983b990d7118d00bf9492d1430706cc561f3ca20107fa77402a5f6cb3d0b33
  with on = On.match On.Event.FeatureBranches "nginx4spa"
  with name = "nginx4spa (branch)"
