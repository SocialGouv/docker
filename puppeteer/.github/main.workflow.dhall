let On =
      ../../.github/dhall/workflows/On.dhall sha256:146002c5643e9f8353d93cab8d40a143a2100bc046ebe7f686c0012d117c77c2

in  ./AssemblyLine.dhall sha256:a8b8a2e0e48dea3261fe5d710772198c17f32db1eb821ceade128dc60f683cfb
  with on = On.match On.Event.ReleasesBranches "puppeteer/**"
  with name = "puppeteer (main)"
