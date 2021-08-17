let On =
      ../../.github/dhall/workflows/On.dhall
        sha256:d1cce9f45a9ccada3c6152cc684d23678d27bb58410c642b7396c13c3f7f99c9

in  ./AssemblyLine.dhall
      sha256:aa16b1fd15454c89c282e6a51ffc3dfb4f2c31bf3aca598b531fb523df9e7c0f
  with on = On.match On.Event.ReleasesBranches "git-deploy"
  with name = "git-deploy (main)"
