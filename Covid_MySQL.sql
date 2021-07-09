
/*--Create Database*/

/*
create database Covid;
*/

use covid;

/*Test for PHP Variables*/
/*
create table php (zip int, nppl int);
*/

/*
delimiter //
CREATE PROCEDURE testProc(
	in zip INT) 
BEGIN
	set @prev_active = 0;
	set @prevalence = 147;  
	set @trans = 0.105;
    
	SELECT c.County, c.today, ztf.ZIP
	from countypop c join `zip-county-fips` ztf
			on c.County = ztf.COUNTYNAME
    where ztf.ZIP = @zip;

END //

delimiter ;
*/
/*
call testProc(36507);
*/

/*
delimiter //
CREATE PROCEDURE testProc1(
in zip int,
out infectionRate int) 
BEGIN
	

	SELECT c.today into infectionRate
	from countypop c 
    where c.today = @zip;
END //

delimiter ;
*/


/*
call testProc1(36507, @inf);

select @inf;
*/









/*Stored Procedure for infection rate*/


/*
DROP PROCEDURE InfectionRate;



delimiter //
CREATE PROCEDURE InfectionRate(
	in zippy INT, 
	nppl INT) 
BEGIN
	set @prevalence = 147;  
	set @trans = 0.105;
	set @infectionrate = 0;
       
    
	SELECT count(Today),
    case
		when count(Today) > 1
			then sum(Today) / count(Today) 
		when count(Today) = 1
            then Today
		when count(Today) = 0
			then'Invalid Zip Code'
	end as active_caseCount 
	FROM covid.zips 
	where @zipCode = ZIP and COUNTYNAME = County;
        
							
	set @prev_active = @active_caseCount / @prevalence;

	SELECT 1 - (POWER((1 - (@prev_active * @trans)), @nppl));

	select count(Today)
    from covid.zips
    where @zipCode = ZIP;
    
END //

delimiter ;

	set @zipCode = 36003;
	set @nppl = 1;
    
    call InfectionRate(@zipCode, @nppl);
    
    select count(Today)
    from covid.zips
    where @zipCode = ZIP;
*/    

/*Algorithm without procedure*/
/*
	set @zip = 36003;
	set @nppl = 1;
	set @prev_active = 0;
	set @prevalence = 147;  
	set @trans = 0.105;
	set @infectionrate = 0;
       
    
	SELECT
    case
		when count(Today) > 1
			then sum(Today) / count(Today) 
		when count(Today) = 1
            then Today
		else 'Invalid Zip Code'
	end into @active_caseCount 
	FROM covid.zips 
	where @zip = ZIP;
        
							
	set @prev_active = @active_caseCount / @prevalence;

	SELECT 1 - (POWER((1 - (@prev_active * @trans)), @nppl));

	select @active_caseCount;
*/


/*Statement for Prevalence when GitHub Repo is added*/
/*
SELECT @prevalence = c.cases 
	FROM [us-counties] c JOIN [ZIP-COUNTY-FIPS] ztf
		ON c.fips = ztf.STCOUNTYFP
	WHERE @zip = ztf.ZIP AND c.county = ztf.COUNTYNAME and c.date = 
							(SELECT MAX(date)
							FROM [us-counties]);
*/

/*Statement for Total US cases*/
/*
select cases
from us
where 'date' = max('date');
*/




    
    
    
    
