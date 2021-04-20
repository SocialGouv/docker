let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:8e42f8e64d1f709e8d76e83d9b4cb3a0f75468f5b1cc58996c4c4e8bc3b3ecb2
  with on = On.match On.Event.ReleasesBranches "azure-db/**"
  with name = "azure-db (main)"
