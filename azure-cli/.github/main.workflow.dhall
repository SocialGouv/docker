let On =
      ../../.github/dhall/workflows/On.dhall sha256:5a41bf6c38031ec114c83811c97bfff2923779dc571f4d0480f21e745646fb56

in  ./AssemblyLine.dhall sha256:868152eabedb900f33e0415223a622d10fe6a973dc0481ef973f82b66c686542
  with on = On.match On.Event.ReleasesBranches "azure-cli"
  with name = "azure-cli (main)"
