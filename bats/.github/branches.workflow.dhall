let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:c80a9a069de2003eb727a7808108587ba64c489b356cd98533f1c964a2e6d635
  with on = On.match On.Event.FeatureBranches "bats"
  with name = "bats (branch)"
