#!/bin/bash
#validation 

if ! [ -x "$(command -v git)" ]; then
  echo 'Error: git is not installed.' 
  exit 1
fi

if ! [ -x "$(command -v brew)" ]; then
  echo 'Error: brew is not installed.'
  exit 1
fi

if ! [ -x "$(command -v az)" ]; then
  echo 'Error: azure is not installed.' 
  exit 1
fi
if ! [ -x "$(command -v node)" ]; then
  echo 'Error: node is not installed.' 
  exit 1
fi

directoryName=$1
if ! [ -z $directoryName ]; then
      mkdir $directoryName
      cd $directoryName

  ## docker
  mkdir .docker

 touch \
  .docker/dockerfile \
  .docker/dockerup.yaml

 ## github
 mkdir -p \
  .github/ISSUE_TEMPLATE \
  .github/PULL_REQUEST_TEMPLATE

 touch \
  .github/ISSUE_TEMPLATE/issue-template.md \
  .github/PULL_REQUEST_TEMPLATE/pull-request-template.md

 touch \
  .github/CODE-OF-CONDUCT.md \
  .github/CONTRIBUTING.md

 ## root
 mkdir \
  client \
  src \
  test

 touch \
  client/.gitkeep \
  src/.gitkeep \
  test/.gitkeep

 touch \
  .azureup.yaml \
  .dockerignore \
  .editorconfig \
  .gitignore \
  .markdownlint.yaml \
  CHANGELOG.md \
  LICENSE.txt \
  README.md

   echo "script complete" 
   exit 0 
fi
  
  echo "setup and validation complete"
  exit 0




