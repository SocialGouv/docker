let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:addd0a469430a0223cd94a02c13de2139209262ce47c9fa4b9d118d9ffb18b64
  with on = On.match On.Event.ReleasesBranches "azure-db/**"
  with name = "azure-db (main)"
