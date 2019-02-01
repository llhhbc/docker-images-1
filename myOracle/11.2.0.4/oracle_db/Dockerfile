# LICENSE GPL 3.0
#
# Copyright (c) 2012-2018 Hangzhou WOQUTECH co,ltd. All rights reserved.
#
# ORACLE DOCKERFILES PROJECT
# --------------------------
# This is the Dockerfile for Oracle Database 11g Release 2 Enterprise Edition
# 
# REQUIRED FILES TO BUILD THIS IMAGE
# ----------------------------------
# (1) p13390677_112040_Linux-x86-64_1of7.zip
#     p13390677_112040_Linux-x86-64_2of7.zip
#
# HOW TO BUILD THIS IMAGE
# -----------------------
# Put all downloaded files in the same directory as this Dockerfile
# Run: 
#      $ docker build -t oracle/database:11.2.0.4.0-ee . 
#
# Pull base image
# ---------------
#FROM centos

FROM oracle-builder:11.2.0.4.0-ee as builder

FROM oracle-base:11.2.0.4.0-ee as prod

COPY --chown=oracle:oinstall --from=builder $ORACLE_BASE $ORACLE_BASE

USER root
RUN $ORACLE_BASE/oraInventory/orainstRoot.sh && \
    $ORACLE_HOME/root.sh 

USER oracle
WORKDIR /home/oracle

VOLUME ["$ORACLE_BASE/oradata"]
EXPOSE 1521
HEALTHCHECK --interval=1m --start-period=5m \
   CMD "$ORACLE_BASE/$CHECK_DB_FILE" >/dev/null

# Define default command to start Oracle Database. 
#CMD exec $ORACLE_BASE/$RUN_FILE
ENTRYPOINT sh -c $ORACLE_BASE/$RUN_FILE
