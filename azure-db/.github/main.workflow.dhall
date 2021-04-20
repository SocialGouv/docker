let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:bd2054ba8ee125e8dd8744eba55d27dff86fc426ed30ff550979e0e5a77d614b
  with on = On.match On.Event.ReleasesBranches "azure-db/**"
  with name = "azure-db (main)"
