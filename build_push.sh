docker build --no-cache -t johngaltdebugger/mywebapp:latest -f Dockerfile-web-server .
docker build --no-cache -t johngaltdebugger/mydatabase:latest -f Dockerfile-db .
docker push johngaltdebugger/mywebapp:latest
docker push johngaltdebugger/mydatabase:latest