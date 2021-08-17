let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:319d0e38f1f3c2c9113ad40626a7b154923e0eadddc7a69f3e3646f167c4d764
  with on = On.match On.Event.ReleasesBranches "wait-for-postgres"
  with name = "wait-for-postgres (main)"
