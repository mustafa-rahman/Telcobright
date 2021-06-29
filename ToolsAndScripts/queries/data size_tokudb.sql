 select sum(bt_size_allocated)/1024/1024/1024 total, sum(bt_size_in_use)/1024/1024/1024 used, (sum(bt_size_allocated)-sum(bt_size_in_use))/1024/1024/1024 free 
 from information_schema.TokuDB_fractal_tree_info
 where table_schema='platinum' and table_name like 'cdrloaded%'
