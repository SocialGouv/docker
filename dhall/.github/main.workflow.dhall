let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:cad1f85d969851f0ab2926abe8a1925b796bf6c4808cfe3fbbb84a3f865ee90d
  with on = On.match On.Event.ReleasesBranches "dhall/**"
  with name = "dhall (main)"
