let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:d3a92329bf1bceaa77fcb74e50da45dc37d1f97130374a76637709b58855902d
  with on = On.match On.Event.FeatureBranches "dhall"
  with name = "dhall (branch)"
