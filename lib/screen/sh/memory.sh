#!/bin/bash

free -m | awk 'NR==2{printf "%.1f/%.1fG(%i%)", $3/1024,$2/1024,$3*100/$2 }'
