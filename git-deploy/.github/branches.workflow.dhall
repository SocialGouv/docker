let On =
      ../../.github/dhall/workflows/On.dhall sha256:5a41bf6c38031ec114c83811c97bfff2923779dc571f4d0480f21e745646fb56

in  ./AssemblyLine.dhall sha256:71457a7c44a451f34af51d1ae5a7f51ad032aa8b589568404b25f004f32ecaf4
  with on = On.match On.Event.FeatureBranches "git-deploy"
  with name = "git-deploy (branch)"
