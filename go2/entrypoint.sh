#!/usr/bin/env bash

[[ -z "${PROJECT_ROOT}" ]] && echo "Please define PROJECT_ROOT, e.g. 'github.com/username/project'" >&2 && exit 1

set -eu -o pipefail

# create the project root & all its parents, then delete the leaf directory (e.g. create "github.com/user/prj" then delete "prj")
mkdir -pv /go/src/${PROJECT_ROOT}
rm -r /go/src/${PROJECT_ROOT}

# link project root's leaf (e.g. "prj" in the example above) to "/workspace" ("/workspace" is the standard mount by Google Cloud Build)
ln -vs /workspace /go/src/${PROJECT_ROOT}

# if "/workspace/.go-caches" exists, link that to "/root/.cache/go-build"
if [[ -f "/workspace/.go-caches" ]]; then
    rm -rfv /root/.cache/go-build
    mkdir -pv /root/.cache
    ln -vs /workspace/.go-caches /root/.cache/go-build
fi

# now go to project root and build the project
cd /go/src/${PROJECT_ROOT}
make
