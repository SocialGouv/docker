let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:8006c7c4950c70ccd631fbe5566b7b0328abddb6b7dec6769698d1e540a7c78d
  with on = On.match On.Event.ReleasesBranches "curl/**"
  with name = "curl (main)"
