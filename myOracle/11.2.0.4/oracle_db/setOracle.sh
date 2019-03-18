#!/bin/bash

#set param

sqlplus / as sysdba << EOF

alter system set db_create_file_dest='/opt/oracle/oradata/$ORACLE_SID/' scope=both;

alter system set "_gc_policy_minimum"=10000000 scope=spfile;
alter system set "_high_priority_processes"='LMS*|VKTM|LGWR|DBW*' scope=spfile;
alter system set "_resource_manager_always_off" =TRUE scope=spfile;
alter system set "_rollback_segment_count"=12000 scope=spfile;
alter system set "_use_adaptive_log_file_sync"=FALSE scope=spfile;
alter system set "undo_retention"=10 scope=spfile;
alter system set "gcs_server_processes"=12 scope=spfile;
alter system set "result_cache_max_size"=0 scope=spfile;

alter system reset memory_target;
alter system reset memory_max_target;
alter system set processes=2000 scope=spfile; 
alter system set db_files=2000 scope=spfile; 
alter system set standby_file_management='AUTO'  scope=spfile; 
alter system set control_file_record_keep_time=30  scope=spfile; 
alter system set fast_start_mttr_target=120 scope=spfile; 
alter system set open_links_per_instance=10 scope=spfile; 
alter system set session_cached_cursors=300  scope=spfile; 
alter system set archive_lag_target=1800 scope=spfile; 
alter system set open_cursors=1500 scope=spfile; 
alter system set open_links=10  scope=spfile; 
alter system set undo_retention=10800 scope=spfile; 
alter system set lock_sga=FALSE  scope=spfile; 
alter system set remote_login_passwordfile='EXCLUSIVE'  scope=spfile; 
alter system set resource_manager_plan='' scope=spfile; 
alter system set statistics_level='TYPICAL'  scope=spfile; 
alter system set timed_statistics=TRUE  scope=spfile; 
alter system set undo_management='AUTO'   scope=spfile; 
alter system set db_cache_advice='OFF'  scope=spfile; 
alter system set audit_trail='NONE' scope=spfile;  
alter system set audit_sys_operations=false scope=spfile;
alter system  set "_gc_policy_time"=0 scope=spfile;
alter system set "_sort_elimination_cost_ratio"=1  scope=spfile; 
alter system set "_use_adaptive_log_file_sync"=  FALSE scope=spfile;
alter system set "result_cache_max_size"= 0 scope=spfile;
alter system set use_large_pages=false scope=spfile;

shutdown immediate;
startup;
exit

EOF
