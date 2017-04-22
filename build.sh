#!/bin/bash

BRANCH=${1?choose a branch e.g. stage, production}
REPO=${2?choose a Docker repository e.g. company/appname}

# Save current git branch
OLDBRANCH=`git rev-parse --abbrev-ref HEAD`

# Make a temporary build directory and delete on exit
BUILDDIR=`mktemp -d`
function cleanup {     
  if [[ "$BUILDDIR" && -d "$BUILDDIR" ]]; then rm -rf "$BUILDDIR"; fi
}
trap cleanup EXIT


# Get to code.  Exit if unsaved changes in repo
if `git status | grep -q "nothing to commit, working directory clean"`; then
  git checkout --quiet $BRANCH || exit 1
else
  echo "ERROR: repo has unsaved changes"
  #exit 1
fi

# This loads nvm, load node version in .nvmrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" && nvm install

# build locally
rm -rf $BUILDDIR

# Npm install
[ ! -d "node_modules" ] && npm install
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
