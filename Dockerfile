FROM alpine:latest
LABEL maintainer "Jason Charcalla"

RUN apk -U add curl bc bash
COPY ./tlapser360.sh /usr/local/bin/tlapser360.sh
RUN chmod +x /usr/local/bin/tlapser360.sh

ENTRYPOINT ["/usr/local/bin/tlapser360.sh"]
CMD ["-h"]
