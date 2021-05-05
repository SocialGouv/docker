let On =
      ../../.github/dhall/workflows/On.dhall sha256:5a41bf6c38031ec114c83811c97bfff2923779dc571f4d0480f21e745646fb56

in  ./AssemblyLine.dhall sha256:68fc68a72cedb0a8c832f31dd73309e477abc1867f48ea06c8f0db64b17eba35
  with on = On.match On.Event.ReleasesBranches "no-k8s"
  with name = "no-k8s (main)"
