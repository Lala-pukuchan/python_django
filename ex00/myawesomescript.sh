#!/bin/sh

# Check if the URL argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <bit.ly URL>"
    exit 1
fi

# Fetch the real URL using curl
# -L: Follow redirects.
# -s: Silent mode (no progress or error messages).
# -o /dev/null: Discard the response body.
# -w '%{url_effective}': Output the final URL after following redirects.
real_url=$(curl -Ls -o /dev/null -w '%{url_effective}' "$1")

# Print the real URL
if [ -n "$real_url" ]; then
    echo "$real_url"
else
    echo "Unable to resolve the URL."
fi
