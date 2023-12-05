FROM golang:1.21.4

RUN wget https://github.com/mikefarah/yq/releases/download/v4.40.4/yq_linux_amd64 && \
    chmod +x yq_linux_amd64 && \
    mv yq_linux_amd64 /usr/bin/yq



ENV GOPRIVATE="gitlab.jiebu.com"
ENV GOINSECURE="gitlab.jiebu.com"
ENV GOPROXY='https://goproxy.cn,direct'

RUN mkdir -p ~/.ssh
COPY ./rsa ~/.ssh/

RUN git config --global url."git@gitlab.jiebu.com:".insteadOf "http://gitlab.jiebu.com/"



