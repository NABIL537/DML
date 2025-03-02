-- Create Department Table
CREATE TABLE Department (
    Num_S INT PRIMARY KEY,
    Label VARCHAR(255) NOT NULL,
    Manager_Name VARCHAR(255)
);
-- Create Employee Table
CREATE TABLE Employee (
    Num_E INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Position VARCHAR(255),
    Salary DECIMAL(10, 2),
    Department_Num_S INT,
    FOREIGN KEY (Department_Num_S) REFERENCES Department(Num_S)
);

-- Create Project Table
CREATE TABLE Project (
    Num_P INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Start_Date DATE,
    End_Date DATE,
    Department_Num_S INT,
    FOREIGN KEY (Department_Num_S) REFERENCES Department(Num_S)
);

-- Create Employee_Project Table
CREATE TABLE Employee_Project (
    Employee_Num_E INT,
    Project_Num_P INT,
    Role VARCHAR(255),
    PRIMARY KEY (Employee_Num_E, Project_Num_P),
    FOREIGN KEY (Employee_Num_E) REFERENCES Employee(Num_E),
    FOREIGN KEY (Project_Num_P) REFERENCES Project(Num_P)
);

-- Insert records into Department table
INSERT INTO Department (Num_S, Label, Manager_Name) VALUES
(1, 'IT', 'Alice Johnson'),
(2, 'HR', 'Bob Smith'),
(3, 'Marketing', 'Clara Bennett');

-- Insert records into Employee table
INSERT INTO Employee (Num_E, Name, Position, Salary, Department_Num_S) VALUES
(101, 'John Doe', 'Developer', 60000.00, 1),
(102, 'Jane Smith', 'Analyst', 55000.00, 2),
(103, 'Mike Brown', 'Designer', 50000.00, 3),
(104, 'Sarah Johnson', 'Data Scientist', 70000.00, 1),
(105, 'Emma Wilson', 'HR Specialist', 52000.00, 2);

-- Insert records into Project table
INSERT INTO Project (Num_P, Title, Start_Date, End_Date, Department_Num_S) VALUES
(201, 'Website Redesign', '2024-01-15', '2024-06-30', 1),
(202, 'Employee Onboarding', '2024-03-01', '2024-09-01', 2),
(203, 'Market Research', '2024-02-01', '2024-07-31', 3),
(204, 'IT Infrastructure Setup', '2024-04-01', '2024-12-31', 1);

-- Insert records into Employee_Project table
INSERT INTO Employee_Project (Employee_Num_E, Project_Num_P, Role) VALUES
(101, 201, 'Frontend Developer'),
(104, 201, 'Backend Developer'),
(102, 202, 'Trainer'),
(105, 202, 'Coordinator'),
(103, 203, 'Research Lead'),
(101, 204, 'Network Specialist');

-- Update Role of Employee_Num_E = 101 in Employee_Project table
UPDATE Employee_Project
SET Role = 'Full Stack Developer'
WHERE Employee_Num_E = 101;

-- Delete Employee with Num_E = 103 from Employee table and corresponding records in Employee_Project
DELETE FROM Employee_Project WHERE Employee_Num_E = 103;
DELETE FROM Employee WHERE Num_E = 103;
