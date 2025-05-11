-- Crear tabla para almacenar esquemas XML
CREATE TABLE xml_schema (
  id          SERIAL PRIMARY KEY,
  schema_name TEXT UNIQUE,
  xsd         TEXT NOT NULL
);

-- Insertar el esquema XSD
INSERT INTO xml_schema (schema_name, xsd)
VALUES (
  'hr_employees_depts',
  $$<?xml version="1.0" encoding="UTF-8"?>
  <xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="Employees">
      <xs:complexType>
        <xs:sequence>
          <xs:element name="Employee" maxOccurs="unbounded">
            <xs:complexType>
              <xs:sequence>
                <xs:element name="EmployeeID"   type="xs:integer"/>
                <xs:element name="FirstName"    type="xs:string"/>
                <xs:element name="LastName"     type="xs:string"/>
                <xs:element name="DepartmentID" type="xs:integer"/>
                <xs:element name="DepartmentName" type="xs:string"/>
              </xs:sequence>
              <xs:attribute name="id" type="xs:integer" use="required"/>
            </xs:complexType>
          </xs:element>
        </xs:sequence>
      </xs:complexType>
    </xs:element>
  </xs:schema>$$
);