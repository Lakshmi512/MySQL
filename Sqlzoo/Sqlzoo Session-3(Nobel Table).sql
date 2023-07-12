 --Displays Nobel prizes for 1950
 
 SELECT yr, subject, winner FROM nobel
 WHERE yr = 1950;
 
 Show who won the 1962 prize for literature
 
 SELECT winner FROM nobel
 WHERE yr = 1962
   AND subject = 'literature';
   
--Show the year and subject that won 'Albert Einstein' his prize

SELECT yr, subject FROM nobel 
WHERE winner = 'Albert Einstein';

--Give the name of the 'peace' winners since the year 2000, including 2000

SELECT winner FROM nobel 
WHERE subject = 'peace' AND yr >= 2000

--Show all details (yr, subject, winner) of the literature prize winners for 1980 to 1989 inclusive

SELECT yr, subject, winner FROM nobel 
WHERE subject = 'literature' AND 
yr BETWEEN 1980 AND 1989;

--Show all details of the presidential winners(Theodore Roosevelt, Woodrow Wilson, Jimmy Carter, Barack Obama)

SELECT * FROM nobel
 WHERE subject = 'peace' AND 
 winner IN ('Theodore Roosevelt','Woodrow Wilson', 'Jimmy Carter', 'Barack Obama');
 
 --Show the winners with first name John
 
 SELECT winner FROM nobel WHERE winner LIKE 'john%';
 
 --Show the year, subject, and name of physics winners for 1980 together with the chemistry winners for 1984
 
 SELECT yr, subject, winner FROM nobel 
 WHERE (subject= 'physics' AND yr = 1980) OR (subject = 'chemistry' AND yr = 1984);
 
 --Show the year, subject, and name of winners for 1980 excluding chemistry and medicine 
 
 SELECT yr, subject, winner FROM nobel 
 WHERE yr = 1980 AND subject <> 'chemistry' 
 AND subject <> 'medicine';
 
 --Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)
 
 SELECT yr, subject, winner FROM nobel 
 WHERE (subject = 'medicine' AND yr < 1910) OR (subject = 'literature' AND yr >= 2004);
 
 --Find all details of the prize won by PETER GRÜNBERG (For typing Umlaut U :- Press ALT + 0252)
 
 SELECT * FROM nobel WHERE winner = 'PETER GRÜNBERG';
 
 --Find all details of the prize won by EUGENE O'NEILL (For Extracting details of all Apostrophe sign data value separate it into two parts "'EUGENE O'" with no space inbetween 'NEILL')
 
 SELECT * FROM nobel WHERE winner LIKE 'EUGENE O''NEILL';
 
 --List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order
 
 SELECT  winner, yr, subject FROM nobel 
 WHERE winner LIKE 'sir%'
ORDER BY yr DESC, winner;

--Show the 1984 winners and subject ordered by subject and winner name, but list chemistry and physics last

SELECT winner, subject FROM nobel 
WHERE yr = 1984 
ORDER BY CASE WHEN subject IN('physics', 'chemistry') THEN 1 ELSE 0 END, subject, winner;
