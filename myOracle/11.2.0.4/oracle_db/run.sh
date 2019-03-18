
docker run -d --name oracledb \
-p 1521:1521 \
-e ORACLE_SID=myora \
-e ORACLE_PWD=oracle \
-e ORACLE_CHARACTERSET=ZHS16GBK \
-e SGA_SIZE=8G \
-e PGA_SIZE=8G \
-e DB_ROLE=primary \
-e ENABLE_ARCH=true \
registry.woqutech.com/longhui.li/oracle:11.2.0.4.0-ee

#-v /root/oracle/oradata/myora/:/opt/oracle/oradata \
