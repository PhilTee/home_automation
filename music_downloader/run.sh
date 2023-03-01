#!/bin/bash
/usr/bin/flock -n /tmp/music_downloader.lockfile /opt/automation/music_downloader/automate.py
