let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:ca780cb1491a2853f553615366c7fdbb0bc28d6fde3daa3b67768947321db497
  with on = On.match On.Event.ReleasesBranches "azure-db/**"
  with name = "azure-db (main)"
