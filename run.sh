#!/usr/bin/env bash
set -euo pipefail

PORT="${1:-8000}"
DIR="$(cd "$(dirname "$0")" && pwd)"

if command -v python3 &>/dev/null; then
    echo "Starting server on http://localhost:${PORT} ..."
    echo "Open http://localhost:${PORT}/metronome.html in your browser."
    echo "Press Ctrl+C to stop."
    python3 -m http.server "$PORT" --directory "$DIR"
elif command -v python &>/dev/null; then
    echo "Starting server on http://localhost:${PORT} ..."
    echo "Open http://localhost:${PORT}/metronome.html in your browser."
    echo "Press Ctrl+C to stop."
    python -m SimpleHTTPServer "$PORT"
else
    echo "Python not found. Install Python or start any HTTP server serving: $DIR" >&2
    exit 1
fi
