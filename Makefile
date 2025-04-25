up:
	go run .\cmd\server1\main.go
	go run .\cmd\server2\main.go
	nginx

docker-run:
	docker run -p 8080:8080 --name my-go-container nginx-load-balancer