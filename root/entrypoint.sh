#!/bin/sh

set -e

if [ -z $PASSWORD ]
then
	echo "PASSWORD variable not set, using the default 'password'"
	PASSWORD=password
fi

echo "$PASSWORD" | saslpasswd2 -c -p telegram

saslauthd -a sasldb
newaliases
postfix start

su telegram -c email-to-telegram
