let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:0a8f15aec67a433ace6657bcdbaefb3dd2de63963e5b48ce94e0060ca436ca72
  with on = On.match On.Event.FeatureBranches "dhall"
  with name = "dhall (branch)"
