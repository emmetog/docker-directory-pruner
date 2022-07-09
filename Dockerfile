FROM alpine

RUN apk add --update bash \
    && rm -rf /var/cache/apk/*

COPY prune-dir.sh /bin/
RUN chmod +x /bin/prune-dir.sh

RUN mkdir /target

ENV DIR_TO_CLEAN "/target"
ENV RECENT_FILES_TO_KEEP 7
ENV DRY_RUN "false"

CMD ["bash", "/bin/prune-dir.sh"]
