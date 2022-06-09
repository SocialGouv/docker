let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:da853a5db37c26255c4aa87c47aab71280f597afa792f12cb51b8d64567bf7ba
  with on = On.match On.Event.ReleasesBranches "psql"
  with name = "psql (main)"
