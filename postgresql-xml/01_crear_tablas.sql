-- 1. Crear tabla departments
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50),
    location_id INT
);

-- 2. Crear tabla employees
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT REFERENCES departments(department_id)
);

-- 3. Insertar datos de ejemplo
INSERT INTO departments (department_name, location_id) VALUES
('IT', 1),
('HR', 2);

INSERT INTO employees (first_name, last_name, department_id) VALUES
('John', 'Doe', 1),
('Jane', 'Smith', 2);