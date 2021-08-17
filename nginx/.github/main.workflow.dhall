let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:b62dd0cece82f6d16d1a57ecca2f4f1463e84407b99cf65707a6bb8bd55f3734
  with on = On.match On.Event.ReleasesBranches "nginx"
  with name = "nginx (main)"
