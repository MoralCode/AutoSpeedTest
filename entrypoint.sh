#!/bin/bash
set -e

systemctl enable cron
systemctl start cron

exec "$@"