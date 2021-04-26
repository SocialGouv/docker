let On =
      ../../.github/dhall/workflows/On.dhall sha256:146002c5643e9f8353d93cab8d40a143a2100bc046ebe7f686c0012d117c77c2

in  ./AssemblyLine.dhall sha256:ef436ef740b4925fabc48d8a9fab26340e93ae882dcd850b860ee2d096ef7bc8
  with on = On.match On.Event.FeatureBranches "nginx4spa/**"
  with name = "nginx4spa (branch)"
