let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:7d9c98b32bddd35745cdeb507171f05025dff981908e14177d3a64ed70140a08
  with on = On.match On.Event.ReleasesBranches "wait-for-http"
  with name = "wait-for-http (main)"
