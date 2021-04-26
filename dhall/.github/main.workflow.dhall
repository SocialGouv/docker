let On =
      ../../.github/dhall/workflows/On.dhall sha256:146002c5643e9f8353d93cab8d40a143a2100bc046ebe7f686c0012d117c77c2

in  ./AssemblyLine.dhall sha256:ec04d3cdc519db0e7578ca7f4201c7f35074a1cfb67f2722442e3e873ba337c5
  with on = On.match On.Event.ReleasesBranches "dhall/**"
  with name = "dhall (main)"
