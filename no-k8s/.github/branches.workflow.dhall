let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:03aeea77ba314d210dca5b5ddedf802731e57ac1d4c8d89024b06ab5dc9c7916
  with on = On.match On.Event.FeatureBranches "no-k8s"
  with name = "no-k8s (branch)"
