#!/bin/sh
xautolock -locker "lock" &
xss-lock -- xautolock -locknow &
