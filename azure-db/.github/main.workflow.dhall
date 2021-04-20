let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:cea3d42dc6617e3471c36d67a958b34fe6b3e07580688eaf428909f12c3b0a0d
  with on = On.match On.Event.ReleasesBranches "azure-db/**"
  with name = "azure-db (main)"
