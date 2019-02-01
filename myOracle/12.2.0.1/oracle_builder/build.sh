
docker build --cpuset-cpus=3 -f Dockerfile --build-arg DB_EDITION=EE -t oracle-builder:12.2.0.1 .

