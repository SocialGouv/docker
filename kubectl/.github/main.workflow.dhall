let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:fca48a9ddb5b0314abc2136a9665ed99f2001f8df89a7272c7748d22f79941d0
  with on = On.match On.Event.ReleasesBranches "kubectl"
  with name = "kubectl (main)"
