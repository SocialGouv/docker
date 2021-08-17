let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:4afae47d130ec036a8ea140f9e4f5e4a0c2a8546ede3674eb174b4e1015cace5
  with on = On.match On.Event.FeatureBranches "no-k8s"
  with name = "no-k8s (branch)"
