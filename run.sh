#!/bin/bash

flutter build web
cd build/web
firefox http://localhost:3001 &
python3 -m http.server 3001
