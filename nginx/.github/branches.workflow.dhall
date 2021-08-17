let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:0a63196adc5d1fe06d4d925ceb6e75e45ddee31630cebc1fa8b538c7adb3a8a4
  with on = On.match On.Event.FeatureBranches "nginx"
  with name = "nginx (branch)"
