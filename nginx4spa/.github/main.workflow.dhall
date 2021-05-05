let On =
      ../../.github/dhall/workflows/On.dhall sha256:5a41bf6c38031ec114c83811c97bfff2923779dc571f4d0480f21e745646fb56

in  ./AssemblyLine.dhall sha256:9da9c38b893d7aaf088aefdf07ae03b8f783ea0b77842b9bfc5664caed75471c
  with on = On.match On.Event.ReleasesBranches "nginx4spa"
  with name = "nginx4spa (main)"
