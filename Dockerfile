FROM alpine

ARG MAIL_PATH="/var/spool/mail/"
ARG USER="telegram"
ARG VERSION="<2.0.0"

RUN \
	apk add --no-cache cyrus-sasl cyrus-sasl-login postfix postfix-pcre py3-pip && \
	pip3 install "email-to-telegram$VERSION" && \
	adduser --g "" -HD "$USER" && \
	addgroup "$USER" mail && \
	chmod 0775 "$MAIL_PATH" && \
	touch "$MAIL_PATH/$USER" && \
	chown telegram:mail "$MAIL_PATH/$USER" && \
	chmod 0660 "$MAIL_PATH/$USER" && \
	chown root:mail "$MAIL_PATH"

COPY root /

ENTRYPOINT /entrypoint.sh
