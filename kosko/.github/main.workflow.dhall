let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:987e577713ff1904a1277540c8e2bb768614895c15f9443c1ee2bf1d128134dc
  with on = On.match On.Event.ReleasesBranches "kosko"
  with name = "kosko (main)"
