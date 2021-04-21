let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:cfcbe324956d5a8ecb142bdab1562c2f2db6a84eff617f7b138cddb305c2e1d9
  with on = On.match On.Event.ReleasesBranches "dhall/**"
  with name = "dhall (main)"
