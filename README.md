# docker-backup
Script for backing up your Docker config directory

# Introduction
After rebuilding a Linux server a number of times and having to re-pull and reconfig all my Docker containers, I decided it was time to build a simple script to backup the Docker config directory, which I have located at "/docker".

# Pre-requisits
This should work for most all Linux distributions.
Docker config path is /docker
Backup location is /backups/Docker
- Note: I use /backups for other things as well, hence the sub-directory for Docker here.
I simplified this to use 1 docker-compose.yml file, however if you have multiple files and want to backup all the containers associated with those containers, replace the following:
- docker-compose stop
With:
- docker-compose -f docker-compose-1.yml -f docker-compose-2.yml -f docker-compose-3.yml stop
and
- docker-compose start
With:
- docker-compose -f docker-compose-1.yml  -f docker-compose-2.yml -f docker-compose-3.yml start
