CREATE TABLE IF NOT EXISTS Librarian(
    librarian_id TEXT PRIMARY KEY,
    name TEXT,
    city TEXT,
    experience_rating TEXT
);


INSERT INTO Librarian(librarian_id, name, city, experience_rating)
VALUES
("5001", "James Hoog", "New York", "0.15"),
("5002", "Nail Knite", "Paris", "0.13"),
("5005", "Pit Alex", "London", "0.11"),
("5006", "Mc Lyon", "Paris", "0.14"),
("5007", "Paul Adam", "Rome", "0.13"),
("5003", "Lauson Hen", "San Jose", "0.12");


CREATE TABLE IF NOT EXISTS Student(
    student_id TEXT,
    student_name TEXT PRIMARY KEY,
    city TEXT,
    grade TEXT,
    librarian_id TEXT
);


INSERT INTO Student(student_id, student_name, city, grade, librarian_id)
VALUES
("3002", "nick rimando", "new york", "100", "5001"),
("3007", "brad davis", "new york", "200", "5001"),
("3005", "graham zusi", "california", "200", "5002"),
("3008", "julian green", "london", "300", "5002"),
("3004", "fabian johnson", "paris", "300", "5006"),
("3009", "geoff cameron", "berlin", "100", "5003"),
("3003", "jozy altidor", "moscow", "200", "5007"),
("3001", "brad guzan", "london", "", "5005");


CREATE TABLE IF NOT EXISTS BookLoans(
    loan_no TEXT PRIMARY KEY,
    fine_amount TEXT,
    loan_date TEXT,
    student_id TEXT,
    librarian_id TEXT
);


INSERT INTO BookLoans(loan_no, fine_amount, loan_date, student_id, librarian_id)
VALUES
("70001", "150.5", "2012-10-05", "3005", "5002"),
("70009", "270.65", "2012-09-10", "3001", "5001"),
("70002", "65.26", "2012-10-05", "3002", "5003"),
("70004", "110.5", "2012-08-17", "3009", "5007"),
("70007", "948.5", "2012-09-10", "3005", "5005"),
("70005", "2400.6", "2012-07-27", "3007", "5006");


SELECT Student.student_name, Librarian.name
FROM Student
JOIN Librarian ON Student.librarian_id = Librarian.librarian_id;


SELECT BookLoans.loan_no, Student.student_name, BookLoans.student_id, BookLoans.librarian_id
FROM BookLoans
JOIN Student ON BookLoans.student_id = Student.student_id
JOIN Librarian ON BookLoans.librarian_id = Librarian.librarian_id
WHERE Student.city <> Librarian.city;


SELECT BookLoans.loan_no, Student.student_name
FROM BookLoans
JOIN Student ON BookLoans.student_id = Student.student_id;


SELECT Student.student_name AS 'Student', Student.grade AS 'Grade'
FROM BookLoans
JOIN Librarian ON BookLoans.librarian_id = Librarian.librarian_id
JOIN Student ON BookLoans.student_id = Student.student_id
WHERE Student.grade IS NOT NULL AND Student.grade <> '';


SELECT Student.student_name AS 'Student',
       Student.city AS 'city',
       Librarian.name AS 'Librarian',
       Librarian.experience_rating
FROM Student
JOIN Librarian ON Student.librarian_id = Librarian.librarian_id
WHERE Librarian.experience_rating BETWEEN '0.12' AND '0.14';