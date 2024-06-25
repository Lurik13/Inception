FROM ubuntu:22.04.4 AS os
RUN apt update
ENTRYPOINT [ "echo", "salut" ]