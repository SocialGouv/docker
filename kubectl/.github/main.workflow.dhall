let On =
      ../../.github/dhall/workflows/On.dhall sha256:5a41bf6c38031ec114c83811c97bfff2923779dc571f4d0480f21e745646fb56

in  ./AssemblyLine.dhall sha256:74abde38c395a8ae9df96e25a172731d88a7d2df2ae22beadcc3d8dce150ad45
  with on = On.match On.Event.ReleasesBranches "kubectl"
  with name = "kubectl (main)"
