  #!/bin/bash
  echo "Example of a pipeline build request from a remote script"

  token=atoken
  TARGET_ENV=prod
  RUN_TESTS=false
  LOG_LEVEL=DEBUG
  curl  --user admin:12345678  \
      "http://localhost:8080/job/pipeline-demo/buildWithParameters?token=$token&TARGET_ENV=$TARGET_ENV&RUN_TESTS=$RUN_TESTS&LOG_LEVEL=$LOG_LEVEL"
  
