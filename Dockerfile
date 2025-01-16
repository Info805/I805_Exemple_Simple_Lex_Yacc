FROM gcc AS build
RUN apt-get update && apt-get install -y flex bison
WORKDIR /src/
COPY . /src/
RUN make LDFLAGS=-static

FROM debian:stable-slim AS simple
COPY --from=build /src/simple.exe /usr/bin/simple.exe
CMD ["/usr/bin/simple.exe"]

FROM scratch AS small
COPY --from=build /src/simple.exe /simple.exe
CMD ["/simple.exe"]
