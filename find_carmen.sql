-- Clue #1: We recently got word that someone fitting Carmen Sandiego's description has been
-- traveling through Southern Europe. She's most likely traveling someplace where she won't be noticed,
-- so find the least populated country in Southern Europe, and we'll start looking for her there.

SELECT * from country WHERE region='Southern Europe' order by population ASC
-- The answer: Holy See (Vatican City State)

--"VAT"	"Holy See (Vatican City State)"	"Europe"	"Southern Europe"	0.4	1929	1000		9.00		"Santa Sede/Cittï¿½ del Vaticano"	"Independent Church State"	"Johannes Paavali II"	3538	"VA"

-- Clue #2: Now that we're here, we have insight that Carmen was seen attending language classes in
-- this country's officially recognized language. Check our databases and find out what language is
-- spoken in this country, so we can call in a translator to work with you.
SELECT * from countrylanguage WHERE countrycode='VAT' AND isofficial='true'
-- The answer : Italian

--"VAT"	"Italian"	true	0


-- Clue #3: We have new news on the classes Carmen attended – our gumshoes tell us she's moved on
-- to a different country, a country where people speak only the language she was learning. Find out which
--  nearby country speaks nothing but that language.
SELECT * from countrylanguage WHERE language='Italian'

-The exact one, answer 2:
SELECT * from countrylanguage WHERE language='Italian' AND percentage= 100


--Answer 1: 
-- "ITA"	"Italian"	true	94.1
-- "SMR"	"Italian"	true	100
-- "VAT"	"Italian"	true	0
-- "ARG"	"Italian"	false	1.7
-- "AUS"	"Italian"	false	2.2
-- "LIE"	"Italian"	false	2.5
-- "BEL"	"Italian"	false	2.4
-- "BRA"	"Italian"	false	0.4
-- "LUX"	"Italian"	false	4.6
-- "MCO"	"Italian"	false	16.1
-- "CHE"	"Italian"	true	7.7
-- "CAN"	"Italian"	false	1.7
-- "FRA"	"Italian"	false	0.4
-- "DEU"	"Italian"	false	0.7
-- "USA"	"Italian"	false	0.6

--Answer 2: 
-- "SMR"	"Italian"	true	100

-- Clue #4: We're booking the first flight out – maybe we've actually got a chance to catch her this time.
 -- There are only two cities she could be flying to in the country. One is named the same as the country – that
 -- would be too obvious. We're following our gut on this one; find out what other city in that country she might
 --  be flying to.
SELECT * from city WHERE countrycode='SMR'

--Answer:
-- 3170	"Serravalle"	"SMR"	"Serravalle/Dogano"	4802
-- 3171	"San Marino"	"SMR"	"San Marino"	2294

-- So the exact answer: Serravalle

-- Clue #5: Oh no, she pulled a switch – there are two cities with very similar names, but in totally different
-- parts of the globe! She's headed to South America as we speak; go find a city whose name is like the one we were
-- headed to, but doesn't end the same. Find out the city, and do another search for what country it's in. Hurry!
SELECT * from city WHERE name LIKE 'Serra%'

-- Answer: 
-- 265	"Serra"	"BRA"	"Espï¿½rito Santo"	302666
-- 3170	"Serravalle"	"SMR"	"Serravalle/Dogano"	4802

--one solution
SELECT * from country WHERE code = 'SMR'

--other solution
SELECT * from country WHERE code = 'BRA' AND region = 'South America'

-- Answer: 
-- "SMR"	"San Marino"	"Europe"	"Southern Europe"	61	885	27000	81.1	510.00		"San Marino"	"Republic"		3171	"SM"
-- "BRA"	"Brazil"	"South America"	"South America"	8.547403e+06	1822	170115000	62.9	776739.00	804108.00	"Brasil"	"Federal Republic"	"Fernando Henrique Cardoso"	211	"BR"

-- The answer is : Brazil

-- Clue #6: We're close! Our South American agent says she just got a taxi at the airport, and is headed towards
 -- the capital! Look up the country's capital, and get there pronto! Send us the name of where you're headed and we'll
 -- follow right behind you!
SELECT code, name, capital from country WHERE name = 'Brazil'

-- SELECT * from city WHERE id= 211

SELECT name from city WHERE id= 211
-- Answer 1 : "BRA"	"Brazil"	211
-- Answer 2: 211	"Brasï¿½lia"	"BRA"	"Distrito Federal"	1969868
-- Exact Answer : Brasï¿½lia

-- Clue #7: She knows we're on to her – her taxi dropped her off at the international airport, and she beat us to
 -- the boarding gates. We have one chance to catch her, we just have to know where she's heading and beat her to the
 -- landing dock. Lucky for us, she's getting cocky. She left us a note, and I'm sure she thinks she's very clever, but
-- if we can crack it, we can finally put her where she belongs – behind bars.

-- Our playdate of late has been unusually fun –
-- As an agent, I'll say, you've been a joy to outrun.
-- And while the food here is great, and the people – so nice!
-- I need a little more sunshine with my slice of life.
-- So I'm off to add one to the population I find
-- In a city of ninety-one thousand and now, eighty five.

-- 91085 - 1 = 91084

-- We're counting on you, gumshoe. Find out where she's headed, send us the info, and we'll be sure to meet her at the gates with bells on.

SELECT * from city WHERE population= 91084
SELECT * from country WHERE code= 'USA'

--4060	"Santa Monica"	"USA"	"California"	91084
-- "USA"	"United States"	"North America"	"North America"	9.36352e+06	1776	278357000	77.1	8510700.00	8110900.00	"United States"	"Federal Republic"	"George W. Bush"	3813	"US"


-- She's in Santa Monica - USA!
