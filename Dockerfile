FROM gcc AS build
RUN apt-get update && apt-get install -y flex bison
WORKDIR /src/
COPY . /src/
RUN make LDFLAGS=-static

FROM debian:stable-slim as simple
COPY --from=build /src/simple /usr/bin/simple
CMD ["/usr/bin/simple"]


FROM scratch as small
COPY --from=build /src/simple /simple
CMD ["/simple"]