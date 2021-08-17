let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:630fe9346bf1b8cfedb082c580a33e710557e10ade1a0cdeb0a2103027737dc2
  with on = On.match On.Event.FeatureBranches "bats"
  with name = "bats (branch)"
