let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:c2ab76ec63a6918835409179b202d8d17d0483115ef89b517754ed9dcfd7a338
  with on = On.match On.Event.ReleasesBranches "azure-cli"
  with name = "azure-cli (main)"
