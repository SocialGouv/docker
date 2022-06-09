let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:9a479b1c5acdb8108532eba15b51ff1df8a9b47a693441fbd5c328510cb0317d
  with on = On.match On.Event.ReleasesBranches "wait-for-postgres"
  with name = "wait-for-postgres (main)"
