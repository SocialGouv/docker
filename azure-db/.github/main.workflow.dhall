let On =
      ../../.github/dhall/workflows/On.dhall sha256:5a41bf6c38031ec114c83811c97bfff2923779dc571f4d0480f21e745646fb56

in  ./AssemblyLine.dhall sha256:fc5d04744fca117beaa3d3d1c0b5a73b61fffef3c428c293549f88d3c4fb525c
  with on = On.match On.Event.ReleasesBranches "azure-db"
  with name = "azure-db (main)"
