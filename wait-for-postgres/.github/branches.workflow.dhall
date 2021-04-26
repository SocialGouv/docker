let On =
      ../../.github/dhall/workflows/On.dhall sha256:146002c5643e9f8353d93cab8d40a143a2100bc046ebe7f686c0012d117c77c2

in  ./AssemblyLine.dhall sha256:66b3fb5d7b0bd50058101130898969497ac383be602a5157239ef254a16d5c1d
  with on = On.match On.Event.FeatureBranches "wait-for-postgres/**"
  with name = "wait-for-postgres (branch)"
