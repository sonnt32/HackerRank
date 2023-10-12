###**[The Blunder](https://www.hackerrank.com/challenges/the-blunder/problem?isFullScreen=true)

Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's  key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.

Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.

**Solution**

```sql
select ceiling( avg(cast(salary as decimal))-avg(cast(replace(salary,0,'')as decimal)) ) from employees;
```