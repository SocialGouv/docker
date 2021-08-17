let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:77b0a5cbbab3b1f3a463e6aef0f33c0ab7a2dff046eb365678b81106d69cc992
  with on = On.match On.Event.ReleasesBranches "wait-for-http"
  with name = "wait-for-http (main)"
