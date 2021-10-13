# Profile

A website brought from Hencework and adapted to fit my CV.

Note that this project is not original, but all work in the **projects** section is.

## build

```bash
# build image
# docker build -t profile .
./run.sh build

# run image
# docker run --rm -d -p 8080:80 --name profile profile
./run.sh run

# login to docker hub
docker login

# tag image
./run.sh build

# push to dockerhub
./run.sh push

# redeploy on k8s
./run.sh rollout
```

## Ingress

To set up ingress, see the [ingress repo](https://github.com/prestto/ingress).
