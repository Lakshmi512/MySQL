use sales;

DELIMITER $$
create procedure Data_1()
BEGIN
set @a = 1 , @b = 1;
gen_1 : loop
insert into loop_1 values( @a , @b ) ;
set @a = @a +1 , @b = @a * @a  ;
if @a = 101 then
    leave gen_1 ;
end if ;
end loop gen_1 ;
END $$;

call Data_1()

select * from loop_1


DELIMITER $$ 
create function date_diff_days (end_date date,start_date date)
returns int
DETERMINISTIC
begin
     declare date_difference int ;
    SET date_difference = DATEDIFF(end_date,start_date);
    return date_difference;
END $$;

select date_diff_days( curdate(),'1993-12-05');

select date_diff_days('1993-12-05' , curdate());

select date_diff_days('1996-08-18', '1993-12-05');

select date_diff_days( '1993-12-05' , '1996-08-18' );


DELIMITER $$
create function log_base_10(a int)
returns decimal(30,12)
DETERMINISTIC
BEGIN
    Declare b decimal(30,12) ;
    set b = log10(a) ;
    return b ;
END $$;

select log_base_10(250);

select log_base_10(489);

select log_base_10(1296345);

DELIMITER $$
create function total_records()
returns int
DETERMINISTIC
BEGIN
     Declare b int ;
     set b = (select count( * ) from sales);
     return b ;
END $$;

select total_records();

DELIMITER $$
create procedure total_records1(in tablename varchar(100))
BEGIN
SET @t1 = CONCAT( ' SELECT COUNT(*)  FROM ' , tablename ) ;
PREPARE stmt3 FROM @t1 ;
EXECUTE stmt3 ;
DEALLOCATE PREPARE stmt3 ;
END $$;

call total_records1( 'sales' );

call total_records1('loop_1');

call total_records1( 'loop_table' );

call total_records1( 'loop_table1');

call total_records1( 'loop_table2');

select * from sales;

DELIMITER &&
create procedure 5th_rank()
BEGIN
 SELECT * FROM (SELECT * , ROW_NUMBER() OVER( ORDER BY profit DESC) AS 'ROW_NUM' FROM sales) AS test WHERE ROW_NUM = 5;
END &&;


call 5th_rank();

select * from sales;
