let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:04c8d6fb62cc8825f06987b3e2865b07ee42fe1ea89946cf8eccdeed82f417ff
  with on = On.match On.Event.FeatureBranches "no-k8s"
  with name = "no-k8s (branch)"
