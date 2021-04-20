let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:299be511114ba934722a4ba55095c7488cdfcaca084ec82bb517b3871d3e1ebb
  with on = On.match On.Event.ReleasesBranches "dhall/**"
  with name = "dhall (main)"
