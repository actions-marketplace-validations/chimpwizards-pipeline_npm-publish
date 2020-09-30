FROM  docker:stable

RUN apk add jq
RUN apk add gettext
RUN apk add npm nodejs
RUN npm install -g js-yaml asciidoctor.js@1.5.5-1 json2yaml
RUN apk add rsync

ADD entrypoint.sh /entrypoint.sh
ADD ./templates/ /templates/

#WORKDIR /github/workspace

ENTRYPOINT ["/entrypoint.sh"]