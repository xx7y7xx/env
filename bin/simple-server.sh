#!/bin/bash

python -m SimpleHTTPServer
chromium-browser http://localhost:8000
