let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:1e4c8ccf93deea7c5676f4d350a1cab581674a7330406d877f0cb018484f8c4e
  with on = On.match On.Event.ReleasesBranches "kubectl/**"
  with name = "kubectl (main)"
