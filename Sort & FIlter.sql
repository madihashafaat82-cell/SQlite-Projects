CREATE TABLE Students (
    StudentID INTEGER,
    Name TEXT,
    Class INTEGER,
    Marks INTEGER
);

INSERT INTO Students VALUES
(1, 'Ali', 10, 85),
(2, 'Ahmed', 10, 72),
(3, 'Sara', 11, 91),
(4, 'Ayesha', 11, 68),
(5, 'Hamza', 10, 78);

SELECT * FROM Students
WHERE Marks > 70
ORDER BY Marks DESC;