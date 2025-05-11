-- Ejemplo de consulta que agrupa en un XML toda la lista
SELECT
  xmlelement(name "Employees",
    xmlagg(
      xmlelement(name "Employee",
        xmlattributes(e.employee_id AS id),
        xmlelement(name "EmployeeID",   e.employee_id),
        xmlelement(name "FirstName",    e.first_name),
        xmlelement(name "LastName",     e.last_name),
        xmlelement(name "DepartmentID", e.department_id),
        xmlelement(name "DepartmentName", d.department_name)
      )
    )
  ) AS employees_xml
FROM hr.employees e
JOIN hr.departments d
  ON e.department_id = d.department_id;
