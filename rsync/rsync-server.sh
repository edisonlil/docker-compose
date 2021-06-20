#!/bin/bash
set -e
exec /usr/bin/rsync --no-detach --daemon --config=/etc/rsyncd.conf


