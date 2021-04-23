let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:8c8af52eb19c8f10f49f6ca0d3cd348adca64d9db3760c0b72f89c00156d5d41
  with on = On.match On.Event.ReleasesBranches "wait-for-postgres/**"
  with name = "wait-for-postgres (main)"
