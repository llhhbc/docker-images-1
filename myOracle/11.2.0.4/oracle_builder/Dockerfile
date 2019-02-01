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
FROM oracle-base:11.2.0.4.0-ee

# Copy binaries
# -------------
COPY $INSTALL_FILE_1 $INSTALL_FILE_2 $INSTALL_RSP $INSTALL_DB_BINARIES_FILE $INSTALL_DIR/
RUN chown oracle:oinstall -R $INSTALL_DIR 

# Install DB software binaries
USER oracle
RUN $INSTALL_DIR/$INSTALL_DB_BINARIES_FILE


