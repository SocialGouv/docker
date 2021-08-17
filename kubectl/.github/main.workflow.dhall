let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:85424443bbbfae2382ae50d7364b1869b0394fac815de4f58f11d0d46dbef2b7
  with on = On.match On.Event.ReleasesBranches "kubectl"
  with name = "kubectl (main)"
