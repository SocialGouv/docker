let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:86e84604fee8a01a81a31e7a6f81abb91b2523ace5711b256f514c82aa74f5cb
  with on = On.match On.Event.ReleasesBranches "wait-for-http/**"
  with name = "wait-for-http (main)"
