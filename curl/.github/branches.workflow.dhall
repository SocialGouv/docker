let On =
      ../../.github/dhall/workflows/On.dhall sha256:5a41bf6c38031ec114c83811c97bfff2923779dc571f4d0480f21e745646fb56

in  ./AssemblyLine.dhall sha256:093b87dc85007e99887dbd0950e67bae51bac9f2d5e1a3be39e4c78fd8ff1276
  with on = On.match On.Event.FeatureBranches "curl"
  with name = "curl (branch)"
