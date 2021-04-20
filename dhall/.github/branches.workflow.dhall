let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:cf294ec04aa0e2be8830af51ddbd7287c1754f725dbc0b4b8bf24df372e9207b
  with on = On.match On.Event.FeatureBranches "dhall/**"
  with name = "dhall (branch)"
