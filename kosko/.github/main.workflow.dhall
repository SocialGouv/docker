let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:834175d93350f36eda4de6def264fe7bbcc353482cf46ddf67eb1e81e356a494
  with on = On.match On.Event.ReleasesBranches "kosko"
  with name = "kosko (main)"
