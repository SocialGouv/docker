let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:335b646f0139c48c4f11141004b66760fbf8d74226878326130250161fa96e6e
  with on = On.match On.Event.ReleasesBranches "bats/**"
  with name = "bats (main)"
