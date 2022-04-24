
# Pewlett Hackard Analysis

## <font color=#6495ED>Overview of Project</font>
Pewlett Hackard is a large company boasting several thousand employees and it's been around for a long time. As baby boomers begins to retire at a rapid rate, Pewlett Hackard is looking toward the future. One way is to think about which positions will need to be filled in the near future. the number of upcoming retirements will leave thousands of job openings. Our assignments are to determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. 
### <font color=#6495D>Purposes</font>

1. Retrieve data from the Employees table.
2. Retrieve data from the Title table.
3. Retrieve joined data based on the given information of employees who were born between 1952 and 1955.
4. Retrieve the number of retiring employees by title. 
5. Retrieve data from the Department Employee table.
6. Create a table that is having info about mentorship eligibility based on 3 joined tables of employees who were born on 1965.
7. Retrieve data from the Mentorship Eligibility table and create a table for the number of employees of mentorship eligibility by title.
8. Compare the number of retiring employees by title and the number of employees of mentorship eligibility by title.

---
## <font color=#6495ED>Resources</font>
* Data Source:
    * employees.csv
    * titles.csv
    * dept_emp.csv
* Software: PostgreSQL 13.6 , pgAdmin 4

## <font color=#6495ED>Results</font>
-  we retrieved joined data based on the given information of retiring employees who were born between 1952 and 1955.


    ![unique_titles](https://github.com/NingYang2022/Pewlett-Hackard-Analysis/blob/main/Snapshots/unique_titles.png?raw=true)
    
- we retrieved the number of retiring employees by title. 

    ![retiring_titles](https://github.com/NingYang2022/Pewlett-Hackard-Analysis/blob/main/Snapshots/retiring_titles.png?raw=true)
    
- we retrieved data of employees who are eligible for mentorship by title.


    ![mentorship_eligibility](https://github.com/NingYang2022/Pewlett-Hackard-Analysis/blob/main/Snapshots/mentorship_eligibility.png?raw=true)
    
- we retrieved the number of employees of mentorship eligibility by title.


    ![mentorship_eligibility_titles](https://github.com/NingYang2022/Pewlett-Hackard-Analysis/blob/main/Snapshots/mentorship_eligibility_titles.png?raw=true)


## <font color=#6495ED>Summary</font>  
1. There are 70,909 roles will need to be filled as the "silver tsunami" begins to make an impact.
It's a huge difference in numbers.


![number_need_to_be_filled](https://github.com/NingYang2022/Pewlett-Hackard-Analysis/blob/main/Snapshots/number_need_to_be_filled.png?raw=true)

2. We compared the difference between the retiring employees and employees of mentorship eligibility by title.There are enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees.


![compare_the_counts_by_title](https://github.com/NingYang2022/Pewlett-Hackard-Analysis/blob/main/Snapshots/compare_the_counts_by_title.png?raw=true)
