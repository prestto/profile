# Profile

A website brought from Hencework and adapted to fit my CV.

Note that this project is not original, but all work in the **projects** section is.

## dev

To run a dev server:

```bash
./run.sh dev
```

## prod

To push to prod:

```bash
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
