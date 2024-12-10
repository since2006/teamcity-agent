docker build \
  --build-arg jdkLinuxComponent='https://corretto.aws/downloads/resources/8.432.06.1/amazon-corretto-8.432.06.1-linux-x64.tar.gz' \
  --build-arg jdkLinuxComponentMD5SUM='6fb237cb31a9c4474bf5f79798d94943' \
  -t since2006/teamcity-agent:2024.12-linux-sudo-java8 .
