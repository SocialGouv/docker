let On =
      ../../.github/dhall/workflows/On.dhall sha256:146002c5643e9f8353d93cab8d40a143a2100bc046ebe7f686c0012d117c77c2

in  ./AssemblyLine.dhall sha256:0508ce2292f8634eba998782799118c0e20b0c603e519c068912d2a8a221bfdd
  with on = On.match On.Event.ReleasesBranches "no-k8s/**"
  with name = "no-k8s (main)"
