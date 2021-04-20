let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:875b4319456039963516c8de5b4c9ab991c4bae48ca98455612b5329305616a2
  with on = On.match On.Event.ReleasesBranches "azure-cli/**"
  with name = "azure-cli (main)"
