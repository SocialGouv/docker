let On =
      ../../.github/dhall/workflows/On.dhall sha256:5a41bf6c38031ec114c83811c97bfff2923779dc571f4d0480f21e745646fb56

in  ./AssemblyLine.dhall sha256:c3135ac052bee9cc2a2c01d331e5501f0da87ecb228e9434375bc3a4eea05d82
  with on = On.match On.Event.ReleasesBranches "dhall"
  with name = "dhall (main)"
