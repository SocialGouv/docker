let On =
      ../../.github/dhall/workflows/On.dhall sha256:52078a01efec2ed9385da80b4a1478c86f0045d3b99b412c629b1cb06cc8f39d

in  ./AssemblyLine.dhall sha256:85ef655421daf7665600c819627302cef3728705096ef9aa0e11ca12cf56e535
  with on = On.match On.Event.FeatureBranches "nginx4spa/**"
  with name = "nginx4spa (branch)"
