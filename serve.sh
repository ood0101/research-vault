#!/bin/bash
# Simple local server for the research vault
echo "Research Vault running at http://localhost:3333"
cd "$(dirname "$0")"
python3 -m http.server 3333
