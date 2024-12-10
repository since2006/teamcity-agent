# Linux
docker build \
  --build-arg TEAMCITY_VERSION=
  --build-arg jdkLinuxComponent='https://corretto.aws/downloads/resources/8.432.06.1/amazon-corretto-8.432.06.1-linux-x64.tar.gz' \
  --build-arg jdkLinuxComponentMD5SUM='6fb237cb31a9c4474bf5f79798d94943' \
  -t since2006/teamcity-agent:2024.12-linux-sudo-java8 .

# macOS
docker build \
  --build-arg TEAMCITY_VERSION=2024.12-linux-arm64-sudo \
  --build-arg jdkLinuxComponent='https://corretto.aws/downloads/latest/amazon-corretto-8-aarch64-linux-jdk.tar.gz' \
  --build-arg jdkLinuxComponentMD5SUM='d02a87c0f3f2bd847a43b55f8a02f43a' \
  -t since2006/teamcity-agent:2024.12-linux-arm64-sudo-java8 .
