FROM zenato/puppeteer

USER root
WORKDIR /
RUN yarn add mermaid.cli
COPY puppeteer-config.json /

WORKDIR /mmd
ENTRYPOINT [ "/node_modules/.bin/mmdc", "-p", "/puppeteer-config.json" ]
CMD [ "--help" ]
