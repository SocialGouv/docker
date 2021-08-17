let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:edd44a91379086baa45327cdba6031a0cf5f73e12ef9e499891a58ceb8a06ac0
  with on = On.match On.Event.ReleasesBranches "azure-db"
  with name = "azure-db (main)"
