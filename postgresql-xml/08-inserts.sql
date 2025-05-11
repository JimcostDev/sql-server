-- Inserción válida (debería pasar)
INSERT INTO xml_employees (data)
VALUES (
  XMLPARSE(DOCUMENT '
  <Employees>
    <Employee id="200">
      <EmployeeID>200</EmployeeID>
      <FirstName>Pat</FirstName>
      <LastName>Fay</LastName>
      <DepartmentID>10</DepartmentID>
      <DepartmentName>Administration</DepartmentName>
    </Employee>
  </Employees>')
);

-- Inserción inválida (falta DepartmentName)
INSERT INTO xml_employees (data)
VALUES (
  XMLPARSE(DOCUMENT '
  <Employees>
    <Employee id="201">
      <EmployeeID>201</EmployeeID>
      <FirstName>John</FirstName>
      <LastName>Doe</LastName>
      <DepartmentID>20</DepartmentID>
      <!-- <DepartmentName>Marketing</DepartmentName> faltante -->
    </Employee>
  </Employees>')
);
-- → ERROR: XML inválido: <Employee id="201"> sin <DepartmentName>

-- selección de los datos insertados
SELECT
  id,
  xml2_prettyprint(data) AS formatted_xml
FROM xml_employees;