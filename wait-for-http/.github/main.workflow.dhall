let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:07e88bdcfd0374d3e63c72b03089e47887d033bd7d2cb76d230fd20834b9a3ec
  with on = On.match On.Event.ReleasesBranches "wait-for-http"
  with name = "wait-for-http (main)"
