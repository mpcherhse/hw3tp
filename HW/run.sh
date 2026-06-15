#!/bin/bash
set -e

case "$1" in
  build_generator)
    docker build -f Dockerfile.generator -t generator .
    ;;
  run_generator)
    mkdir -p data
    docker run --rm -v "$(pwd)/data:/data" generator
    ;;
  create_local_data)
    mkdir -p local_data
    python3 generate.py local_data
    ;;
  build_reporter)
    docker build -f Dockerfile.reporter -t reporter .
    ;;
  run_reporter)
    mkdir -p data
    docker run --rm -v "$(pwd)/data:/data" reporter
    ;;
  structure)
    find . -not -path './.git/*' -not -name '.git' | sort
    ;;
  clear_data)
    rm -f data/*.csv data/*.html
    echo "data/ очищена"
    ;;
  inside_generator)
      mkdir -p data
      docker run --rm --entrypoint ls -v "$(pwd)/data:/data" generator -la /data
      ;;
  inside_reporter)
    mkdir -p data
    docker run --rm -v "$(pwd)/data:/data" reporter ls -la /data
    ;;
  report_server)
    mkdir -p data
    cp data/report.html data/index.html 2>/dev/null || true
    docker run --rm -d --name report_server \
      -v "$(pwd)/data:/usr/share/nginx/html" \
      -p 8080:80 nginx:alpine
    echo "Сервер запущен на порту 8080"
    ;;

  *)
    echo "Команды: build_generator | run_generator | create_local_data | build_reporter | run_reporter | structure | clear_data | inside_generator | inside_reporter | report_server"
    exit 1
    ;;
esac

