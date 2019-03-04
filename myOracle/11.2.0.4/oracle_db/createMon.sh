#!/bin/bash


userName=monitor
userPasswd=monitor

sqlplus / as sysdba << EOF
----创建监控用户
create user $userName identified by $userPasswd default tablespace users;
grant connect,resource,select_catalog_role to $userName;
grant unlimited tablespace to $userName;
grant select any dictionary to $userName;
grant execute on DBMS_WORKLOAD_REPOSITORY to $userName;

----连接到新创建的监控用户，创建监控表
conn $userName/$userPasswd
create table cmonitor
(id number primary key,
type varchar2(100),
ctime date);
insert into cmonitor values(1,'QFusion monitor',sysdate);
commit;

EOF

