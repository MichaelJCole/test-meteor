#!/bin/bash

BRANCH=${1?choose a branch e.g. stage, production}
REPO=${2?choose a Docker repository e.g. company/appname}

# Change to branch and warning/exit if unsaved changes
OLDBRANCH=`git rev-parse --abbrev-ref HEAD`
if `git status | grep -q "nothing to commit, working directory clean"`; then
  git checkout --quiet $BRANCH || exit 1
else
  echo "ERROR: repo has unsaved changes"
  #exit 1
fi

# Use node version in .nvmrc and npm install
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" && nvm install
# Npm install
[ ! -d "node_modules" ] && npm install

# Make a temporary build directory and delete on exit
BUILDDIR=`mktemp -d`
function cleanup {     
  if [[ "$BUILDDIR" && -d "$BUILDDIR" ]]; then rm -rf "$BUILDDIR"; fi
}
trap cleanup EXIT

# Meteor build
meteor build \
  --directory $BUILDDIR \
  --architecture os.linux.x86_64 \
  --server-only || exit 1

# Create sensible version `[package.json]-[git hash]`
VERSION=`version.sh`

# Build Docker Image
tar -cz Dockerfile package.json -C $BUILDDIR bundle | \
  docker build -t $REPO:$VERSION - || exit 1
  
# Push to Docker repository
docker push $REPO:$VERSION || exit 1

# Done
git checkout --quiet $OLDBRANCH

echo "==========================================="
echo "BUILT AND PUSHED $REPO:$VERSION FOR $BRANCH"
