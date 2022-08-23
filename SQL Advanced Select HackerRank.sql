-- Type of Triangle

-- Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

-- Equilateral: It's a triangle with  sides of equal length.
-- Isosceles: It's a triangle with  sides of equal length.
-- Scalene: It's a triangle with  sides of differing lengths.
-- Not A Triangle: The given values of A, B, and C don't form a triangle.

SELECT 
IF(A+B<=C OR B+C<=A OR A+C<=B, 'Not A Triangle', 
	IF(A=B AND B=C, 'Equilateral',
		IF(A=B OR B=C OR A=C, 'Isosceles', 'Scalene')))
FROM TRIANGLES



--The PADS


-- Generate the following two result sets:

--Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
--Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:

--There are a total of [occupation_count] [occupation]s.
--where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

--Note: There will be at least two entries in the table for each type of occupation.

SELECT CONCAT(Name,'(', SUBSTRING(Occupation,1,1), ')')
    FROM Occupations
ORDER BY Name
SELECT CONCAT('There are a total of ', COUNT(Occupation), ' ',LOWER(Occupation), 's.')
    FROM Occupations
GROUP BY
    Occupation
ORDER BY
    COUNT(Occupation)


--Binary Tree Nodes

--You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.

--Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

--Root: If node is root node.
--Leaf: If node is leaf node.
--Inner: If node is neither root nor leaf node.

SELECT N, CASE WHEN P IS NULL THEN 'Root' ELSE
            CASE WHEN N IN (SELECT P FROM BST) THEN 'Inner'
                ELSE 'Leaf' END
                    END
FROM BST
ORDER BY N ASC;