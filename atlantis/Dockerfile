# busybox:1.31.1-uclibc
FROM busybox@sha256:afe605d272837ce1732f390966166c2afff5391208ddd57de10942748694049d AS terragrunt
ADD https://github.com/gruntwork-io/terragrunt/releases/download/v0.28.19/terragrunt_linux_amd64 /terragrunt_linux_amd64
RUN echo "c40937f3417a342133305738821320d3f1ed6e1ce6964dddbd796ba3060d19fa  /terragrunt_linux_amd64" | sha256sum -c
RUN chmod +x /terragrunt_linux_amd64

# busybox:1.31.1-uclibc
FROM busybox@sha256:afe605d272837ce1732f390966166c2afff5391208ddd57de10942748694049d AS terragrunt-atlantis-config
ADD https://github.com/transcend-io/terragrunt-atlantis-config/releases/download/v1.7.2/terragrunt-atlantis-config_1.7.2_linux_amd64.tar.gz /terragrunt-atlantis-config_1.7.2_linux_amd64.tar.gz
RUN echo "3b439fec2743ccb99f9a22f30bcc1367cceab9d5d0b11f4dc45a18f4e7893388  /terragrunt-atlantis-config_1.7.2_linux_amd64.tar.gz" | sha256sum -c
RUN tar -xzf /terragrunt-atlantis-config_1.7.2_linux_amd64.tar.gz && mv /terragrunt-atlantis-config_1.7.2_linux_amd64/terragrunt-atlantis-config_1.7.2_linux_amd64 /terragrunt-atlantis-config
RUN chmod +x /terragrunt-atlantis-config

# hashicorp/terraform:0.14.9
FROM hashicorp/terraform@sha256:0df06a2b1e0291aa391b3de8031fa281fcad64105d9108a59be53845b9e2f59c AS terraform

# runatlantis/atlantis:v0.17.2
FROM runatlantis/atlantis@sha256:5d766c235e9b6d59943cf8cd72368068f9196d2e64a24b5039865d62c7f0f07a
COPY --from=terragrunt /terragrunt_linux_amd64 /usr/local/bin/terragrunt
COPY --from=terraform /bin/terraform /usr/local/bin/tf/versions/0.14.9/terraform
COPY --from=terragrunt-atlantis-config /terragrunt-atlantis-config /usr/local/bin/terragrunt-atlantis-config
RUN ln -sf /usr/local/bin/tf/versions/0.14.9/terraform /usr/local/bin/terraform0.14.9
RUN apk --no-cache add jq
