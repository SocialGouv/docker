let On =
      ../../.github/dhall/workflows/On.dhall sha256:5a41bf6c38031ec114c83811c97bfff2923779dc571f4d0480f21e745646fb56

in  ./AssemblyLine.dhall sha256:3d9aea24361eabe41df7b29db93114db225d3d2d669800b5345a0ce7d4dce841
  with on = On.match On.Event.ReleasesBranches "kosko"
  with name = "kosko (main)"
