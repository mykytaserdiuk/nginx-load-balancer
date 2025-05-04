up:
	go run .\cmd\server1\main.go
	go run .\cmd\server2\main.go
	nginx

docker-run:
	docker run -p 8080:8080 --name my-go-container nginx-load-balancer

docker-base-push:	
	docker build -t zomgra/nginx-load-balancer -f ./Dockerfile .
	docker push zomgra/nginx-load-balancer


docker-arm-push:
	docker build -t zomgra/nginx-load-balancer:arm64 -f ./arm.Dockerfile .
	docker push zomgra/nginx-load-balancer:arm64

docker-push:
	$(Make) docker-arm-push
	$(Make) docker-base-push
	