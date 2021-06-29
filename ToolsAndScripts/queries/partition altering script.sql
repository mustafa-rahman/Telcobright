alter table cdrloaded
add partition
(partition p39 VALUES LESS THAN ('2014-01-20') ENGINE = InnoDB,
partition p40 VALUES LESS THAN ('2014-02-02') ENGINE = InnoDB,
partition p41 VALUES LESS THAN ('2014-02-14') ENGINE = InnoDB,
partition p42 VALUES LESS THAN ('2014-02-28') ENGINE = InnoDB,
partition p43 VALUES LESS THAN ('2014-03-15') ENGINE = InnoDB,
partition p44 VALUES LESS THAN ('2014-04-01') ENGINE = InnoDB
);


alter table cdrloaded drop partition p2,p3,p4,p5;

