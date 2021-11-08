#!/bin/bash
cecho() {
    LB='\033[1;36m' # Light Blue
    LG='\033[1;32m' # Light Green
    YE='\033[1;33m' # Yellow

    # print normally if no second arg added
    if [[ $2 == "" ]]; then
        echo $1
        return
    fi

    case $1 in
    BL)
        printf "$LB%s\033[0m\n" "$2" # Light Cyan
        ;;
    GR)
        printf "$LG%s\033[0m\n" "$2" # Light green
        ;;
    YE)
        printf "$YE%s\033[0m\n" "$2" # Light green
        ;;
    normal | *)
        echo $2 # Light Purple
        ;;
    esac
}

function run_dev {
    cecho "BL" "running server on http://127.0.0.1:8080/..."
    docker run --rm -p 8080:80 --name tpprofile -v ~/projects/profile/html:/usr/share/nginx/html nginx
}

function run_build {
    cecho "BL" "Building image..."
    docker build -t user632716/profile:latest .
}

function run_run {
    cecho "BL" "Running image"
    docker run --rm -d -p 8080:80 --name profile user632716/profile:latest
}

function run_push {
    cecho "BL" "Pushing"
    docker push user632716/profile:latest
}

function run_rollout {
    cecho "BL" "Rolling out"
    kubectl --context kubernetes-admin@perso rollout restart deploy/profile-deployment
}

function show_help {
    cecho "BL" "Help: $0 <ACTION>"
    cecho "BL" "Parameters :"
    cecho "BL" " - ACTION values :"
    cecho "BL" "   * dev                           - Run nginx in docker container with mounted volume."
    cecho "BL" "   * build                         - Build docker image."
    cecho "BL" "   * run                           - Run docker image."
    cecho "BL" "   * push                          - Push docker image to dockerhub: user632716/profile."
    cecho "BL" "   * rollout                       - Redeploy on prod k8s using dockerhub image."
}

if [[ "$1" == "" ]]; then
    cecho "No arguments provided."
    show_help
    exit 1
fi

case "$1" in
dev)
    run_dev
    ;;
build)
    run_build
    ;;
run)
    run_run
    ;;
push)
    run_push
    ;;
rollout)
    run_rollout
    ;;
*)
    show_help
    ;;
esac
