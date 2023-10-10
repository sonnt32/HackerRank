
###**[Revising the Ollivander's Inventory](https://www.hackerrank.com/challenges/harry-potter-and-wands/problem)**


Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.

Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. If more than one wand has same power, sort the result in order of descending age.

Input Format


The following tables contain data on the wands in Ollivander's inventory:
Wands: The id is the id of the wand, code is the code of the wand, coins_needed is the total number of gold galleons needed to buy the wand, and power denotes the quality of the wand (the higher the power, the better the wand is).

|  Cols| Type |
|-------|-----|
| ID  | INTEGER  |
| CODE| INTEGER  |
| COINS_NEEDED| INTEGER  |
| POWER |  INTEGER|

Wands_Property: The code is the code of the wand, age is the age of the wand, and is_evil denotes whether the wand is good for the dark arts. If the value of is_evil is 0, it means that the wand is not evil. The mapping between code and age is one-one, meaning that if there are two pairs, (code1,age1)  and (code2, age2), then code1 ≠ code 2 and age1 ≠ age2 .

|  Cols| Type |
|-------|-----|
| CODE | INTEGER  |
| AGE | INTEGER  |
| IS_DEVIL| INTEGER  |


1. Age >, Power >, Coins < --> nhóm (Power, Age) để ưu tiên sort theo giá, sau đó sort theo Power + Age

2. NOT DEVIL



**Solution**
```sql
SELECT id, age, power, coins_needed
FROM(
   SELECT (id, age, power, coins_needed, dense_rank(partition by age, power order by coins_needed desc) AS RN
   FROM Wands W 
   INNER JOIN Wands_Property Ws ON W.code = Ws.code
   WHERE is_evil >0)
Where RN = 1
Order by Power Desc, Age Desc
```