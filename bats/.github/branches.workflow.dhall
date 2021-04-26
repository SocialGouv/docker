let On =
      ../../.github/dhall/workflows/On.dhall sha256:146002c5643e9f8353d93cab8d40a143a2100bc046ebe7f686c0012d117c77c2

in  ./AssemblyLine.dhall sha256:0f833cfef3cc1610c626a7c4e1d39bb2819127b8900b399e4f17fe1fa961b148
  with on = On.match On.Event.FeatureBranches "bats/**"
  with name = "bats (branch)"
