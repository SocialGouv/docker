let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:797e521f4865c58817ea3c99b06dbdeb8f6d7e654340db914ccaad578e1b175d
  with on = On.match On.Event.ReleasesBranches "curl/**"
  with name = "curl (main)"
