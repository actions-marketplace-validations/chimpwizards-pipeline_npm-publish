FROM  docker:stable

RUN apk add jq
RUN apk add gettext
RUN apk add npm nodejs
RUN npm install -g js-yaml asciidoctor.js@1.5.5-1 json2yaml
RUN apk add rsync

LABEL "com.github.actions.name"="NPM Publish"
LABEL "com.github.actions.description"="Publish an npm package to NPM repository"
LABEL "com.github.actions.icon"="mic"
LABEL "com.github.actions.color"="purple"

LABEL "repository"="http://github.com/chimpwizards-pipeline/npm-publish"
LABEL "homepage"="http://github.com/marketplace/chimpwizards"
LABEL "maintainer"="ndru@chimpwizard.com"

ADD entrypoint.sh /entrypoint.sh
ADD ./templates/ /templates/

#WORKDIR /github/workspace

ENTRYPOINT ["/entrypoint.sh"]