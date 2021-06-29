select data_length/1024/1024/1024 as Data_Size,(27618468*254)/1024/1024/1024 as i_Size,
(70000*254)/1024/1024/1024 as daily_Size,
i.* from information_schema.tables i
where table_name='CDRLOADED';