let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:642d90c9c7eb33a50d97adaf005c2e3a9c2e2aa583f98b8a2bcc98dae13e8243
  with on = On.match On.Event.ReleasesBranches "bats"
  with name = "bats (main)"
