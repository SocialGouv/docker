let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:9d08ed86ad5c68354483277a3c6fb068ac0ed73ed43c12b83d25d6abb6545e2d
  with on = On.match On.Event.ReleasesBranches "dhall/**"
  with name = "dhall (main)"
