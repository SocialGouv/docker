let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:4aeddad93814914025c65fcd0501010eab9b9796834ad44767f6ca8496961e1a
  with on = On.match On.Event.ReleasesBranches "azure-db/**"
  with name = "azure-db (main)"
