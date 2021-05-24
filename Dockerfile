FROM alpine

RUN apk add --no-cache cyrus-sasl cyrus-sasl-login postfix postfix-pcre py3-pip

RUN pip3 install "email-to-telegram<2.0.0"

COPY root /

ENV \
  MAIL_PATH="/var/spool/mail/" \
  USER="telegram"

RUN \
  adduser --g "" -HD "$USER" && \
  addgroup "$USER" mail && \
  chmod 0775 "$MAIL_PATH" && \
  touch "$MAIL_PATH/$USER" && \
  chown telegram:mail "$MAIL_PATH/$USER" && \
  chmod 0660 "$MAIL_PATH/$USER" && \
  chown root:mail "$MAIL_PATH"

ENTRYPOINT /entrypoint.sh
