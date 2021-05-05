let On =
      ../../.github/dhall/workflows/On.dhall sha256:5a41bf6c38031ec114c83811c97bfff2923779dc571f4d0480f21e745646fb56

in  ./AssemblyLine.dhall sha256:9ba5aa369d084a1b682a43283f879384c769f9d96c31467da87afbdb3ecf3f61
  with on = On.match On.Event.ReleasesBranches "bats"
  with name = "bats (main)"
