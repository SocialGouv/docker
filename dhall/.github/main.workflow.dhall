let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:cd79fd56342356ed2081f18e8d739200f7965794595314148d78f565956810ae
  with on = On.match On.Event.ReleasesBranches "dhall"
  with name = "dhall (main)"
