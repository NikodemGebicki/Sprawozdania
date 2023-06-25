# Diagram a:
```sql
SELECT * FROM guests order by Lname, Fname asc;

SELECT DISTINCT guests.* FROM `guests` INNER JOIN `reservations` ON reservations.LoginID = guests.LoginID;

SELECT guests.Fname, guests.Lname FROM `guests` INNER JOIN `reservations` ON reservations.LoginID = guests.LoginID GROUP BY guests.LoginID;

SELECT guests.LoginID, count(reservations.LoginID) FROM `guests` LEFT JOIN `reservations` ON reservations.LoginID = guests.LoginID GROUP BY guests.LoginID;

SELECT DISTINCT guests.* FROM `guests` INNER JOIN `rooms` ON rooms.LoginID = guests.LoginID WHERE rooms.Smoking = 1;
```

# Diagram c
```sql
SELECT * FROM `planeta` ORDER BY HNazwa;
SELECT * FROM `planeta` ORDER BY `planeta`.`Nazwa_planety`;
SELECT * FROM `ciało niebieskie` WHERE `Gwiazda_key` IS NOT NULL ORDER BY `Nazwa`;
```

```sql
SELECT * FROM `księżyc` WHERE RNazwa = 2;
SELECT * FROM `księżyc` WHERE `Nazwa_planety` = "c";
SELECT * FROM `ciało niebieskie` WHERE `Planeta_key` = "d";
```

```sql
SELECT `planeta`.* FROM `planeta` WHERE `HNazwa` NOT IN (SELECT `planeta`.`HNazwa` FROM `księżyc` JOIN `planeta` ON `księżyc`.`RNazwa` = `planeta`.`HNazwa`);

SELECT `planeta`.* FROM `planeta` WHERE `Nazwa_planety` NOT IN (SELECT `planeta`.`Nazwa_planety` FROM `księżyc` JOIN `planeta` ON `księżyc`.`Nazwa_planety` = `planeta`.`Nazwa_planety`);

SELECT * FROM `ciało niebieskie` WHERE `Nazwa` NOT IN (SELECT `Planeta_key` FROM `ciało niebieskie` WHERE `Planeta_key` IS NOT NULL) AND `Gwiazda_key` IS NOT NULL;
```

```sql
SELECT `gwiazda`.`Nazwa`, 
COUNT(DISTINCT `planeta`.`RNazwa`) + COUNT(`księżyc`.`RNazwa`) 
FROM `gwiazda` LEFT JOIN (`planeta` LEFT JOIN `księżyc` 
ON `planeta`.`HNazwa` = `księżyc`.`RNazwa`) 
ON `gwiazda`.`Nazwa` = `planeta`.`RNazwa` 
GROUP BY `gwiazda`.`Nazwa`;

SELECT `gwiazda`.`Nazwa_gwiazdy`, 
COUNT(DISTINCT `planeta`.`Nazwa_gwiazdy`) + COUNT(`księżyc`.`Nazwa_planety`) 
FROM `gwiazda` LEFT JOIN (`planeta` LEFT JOIN `księżyc` 
ON `planeta`.`Nazwa_planety` = `księżyc`.`Nazwa_planety`) 
ON `gwiazda`.`Nazwa_gwiazdy` = `planeta`.`Nazwa_gwiazdy` 
GROUP BY `gwiazda`.`Nazwa_gwiazdy`;

SELECT `gwiazda`.`Nazwa`, 
COUNT(DISTINCT `planeta`.`Gwiazda_key`) + COUNT(`ksiezyc`.`Planeta_key`) 
FROM `ciało niebieskie` AS `gwiazda` 
LEFT OUTER JOIN (`ciało niebieskie` AS `planeta` 
LEFT OUTER JOIN `ciało niebieskie` AS `ksiezyc` 
ON `planeta`.`Nazwa` = `ksiezyc`.`Planeta_key`) 
ON `gwiazda`.`Nazwa` = `planeta`.`Gwiazda_key` 
WHERE `gwiazda`.`Gwiazda_key` IS NULL AND `gwiazda`.`Planeta_key` IS NULL 
GROUP BY `gwiazda`.`Nazwa`;
```