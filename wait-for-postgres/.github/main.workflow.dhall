let On =
      ../../.github/dhall/workflows/On.dhall sha256:5a41bf6c38031ec114c83811c97bfff2923779dc571f4d0480f21e745646fb56

in  ./AssemblyLine.dhall sha256:bdeda8ff2d70a6ce260ccee8f82dce81f49e265cc244d3e0bee28bc47337c561
  with on = On.match On.Event.ReleasesBranches "wait-for-postgres"
  with name = "wait-for-postgres (main)"
