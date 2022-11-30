### build and start
```bash
docker-compose up -d --build
```

### run nginx inside container
```bash
docker exec -it nginx_in_ubuntu nginx
```
### check nginx running
```bash
docker exec -it nginx_in_ubuntu bash -c 'ps aux | grep nginx'
```
