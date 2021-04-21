let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:a40e428f7e59ae4c7f9a6cc9b840b0c7bee36f5e369be361c39b4d0203a6da54
  with on = On.match On.Event.ReleasesBranches "dhall/**"
  with name = "dhall (main)"
