# Mumble server

This is a simple docker Mumble server

### Quick Start Guide

1. Clone this repository into your server or computer
2. Rename `.env.example` file to `.env`
3. Update this file if necessary
4. If you update the port into .env file, update the port into the mumble-server.ini file (port=64738 by default)
5. Open the port into your firewall if necessary (64738 by default for TCP and UDP)
6. Start this container : `docker compose up -d`
