TYPE=VIEW
query=select if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),\'background\',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR`) AS `ios`,`sys`.`format_time`(sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`)) AS `io_latency` from `performance_schema`.`events_waits_summary_by_host_by_event_name` where (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` like \'wait/io/file/%\') group by if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),\'background\',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) desc
md5=53b0d9b1a70d1f81690a79d9d4d8f59c
updatable=0
algorithm=1
definer_user=mysql.sys
definer_host=localhost
suid=0
with_check_option=0
<<<<<<< HEAD
timestamp=2020-10-07 09:19:52
=======
timestamp=2020-10-05 10:19:30
>>>>>>> master
create-version=1
source=SELECT IF(host IS NULL, \'background\', host) AS host, SUM(count_star) AS ios, sys.format_time(SUM(sum_timer_wait)) AS io_latency  FROM performance_schema.events_waits_summary_by_host_by_event_name WHERE event_name LIKE \'wait/io/file/%\' GROUP BY IF(host IS NULL, \'background\', host) ORDER BY SUM(sum_timer_wait) DESC
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),\'background\',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR`) AS `ios`,`sys`.`format_time`(sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`)) AS `io_latency` from `performance_schema`.`events_waits_summary_by_host_by_event_name` where (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` like \'wait/io/file/%\') group by if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),\'background\',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) desc
