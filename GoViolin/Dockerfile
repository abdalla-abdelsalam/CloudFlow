# i'm using multi-stage  technique to minimize the size of the image

# starting from golang alpine base image
FROM golang:1.16.4-alpine as build-stage

# making goviolin my working directory
WORKDIR /goviolin

# Copy the source code
COPY . .

# creating go.mod file
RUN go mod init 

# for go modules
ENV GO111MODULE=on

RUN export CGO_ENABLED=0 

# Build the Go app
RUN go build -o goviolin .

##########################################################################
# use multi-stage 

FROM alpine

# copy the binary file to the new image
COPY --from=build-stage /goviolin /goviolin

WORKDIR /goviolin

# This container exposes port 8080 to the outside world
EXPOSE 8080

# Run the binary program produced by `go build`
CMD ["./goviolin"]