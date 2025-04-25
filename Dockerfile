# Stage 1: Build app1
FROM golang:1.22-alpine AS builder-app1
WORKDIR /app1
COPY go.mod ./
# RUN go mod download
COPY cmd/server1/ ./
RUN go build -o /bin/app1

# Stage 2: Build app2
FROM golang:1.22-alpine AS builder-app2
WORKDIR /app2
COPY go.mod ./
# RUN go mod download
COPY cmd/server2/ ./
RUN go build -o /bin/app2

# Stage 3: Final image
FROM nginx:1.16-alpine

# Copy nginx config
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Copy built applications from previous stages
COPY --from=builder-app1 /bin/app1 /app1
COPY --from=builder-app2 /bin/app2 /app2

# Expose ports
EXPOSE 80

# Run Go applications and Nginx in background
CMD ["/bin/sh", "-c", "/app1 & /app2 & nginx -g 'daemon off;'"]
