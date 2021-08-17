let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:69f585abdcde62ec9ea8d4a0acb64f2a973aa9925c50694a60320a823acffa9e
  with on = On.match On.Event.ReleasesBranches "curl"
  with name = "curl (main)"
