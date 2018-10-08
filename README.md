### Build locally:

```
docker run --rm -v `pwd`:/blog -w /blog yitsushi/hugo-extended-builder
```

### GitLab Pipeline

```
build:
  stage: generate
  image: yitsushi/hugo-extended-builder
  script:
    - hugo
  artifacts:
    paths:
      - public/
      - Dockerfile
    expire_in: 1 day
```

Dockerfile marked as part of the artifact because that way, in a later
step we can build our finale image that contains only the artifact as webroot
without `git`, like:

```
docker:
  stage: build
  image: docker:stable
  before_script:
    - docker login -u gitlab-ci-token -p $CI_BUILD_TOKEN registry.gitlab.com
  script:
    - docker build --pull -t $CONTAINER_CURRENT_IMAGE .
    - docker push $CONTAINER_CURRENT_IMAGE
  only:
    - master
  variables:
    GIT_STRATEGY: none
```

The corresponding `Dockerfile`:

```
FROM nginx:alpine

LABEL maintainer="Balazs Nadasdi <yitsushi@protonmail.ch>"

COPY public /usr/share/nginx/html
```
