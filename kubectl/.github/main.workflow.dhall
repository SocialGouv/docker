let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:0835cadd70478b2b1e45e095f4ae04b000d47cb56fe68cfec7aace54a3f9fbf0
  with on = On.match On.Event.ReleasesBranches "kubectl/**"
  with name = "kubectl (main)"
