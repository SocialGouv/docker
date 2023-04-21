let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:cfb894114d97738ce8747cbf5851e7f5ddad2f9c2045b42635b9027337e8876c
  with on = On.match On.Event.ReleasesBranches "cnpg-pgvector"
  with name = "cnpg-pgvector (main)"
