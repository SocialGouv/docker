let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:6ee7e7c10483491b6b9789fef3e397eb805a4b8fedba43ceaaf30b80c18fe7cb
  with on = On.match On.Event.ReleasesBranches "azure-cli/**"
  with name = "azure-cli (main)"
