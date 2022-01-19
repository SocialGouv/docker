let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:91d7d10f27ce446fabf02d690abc68e90c3da668c129280043cc58628c92da43
  with on = On.match On.Event.ReleasesBranches "psql"
  with name = "psql (main)"