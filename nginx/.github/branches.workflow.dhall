let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:48c497642f60bbd230e75f039c93e5e20185671886f0d17f6078206bf68052fc
  with on = On.match On.Event.FeatureBranches "nginx"
  with name = "nginx (branch)"
