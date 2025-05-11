
-- DROP FUNCTION IF EXISTS validate_hr_xml();
-- Crea una función de validación xml
CREATE OR REPLACE FUNCTION validate_hr_xml()
RETURNS TRIGGER AS $$
DECLARE
  nodes      xml[];
  node       xml;
  v_id       TEXT;
  v_empid    TEXT;
  v_deptid   TEXT;
  v_deptname TEXT;
BEGIN
  -- 1) Comprobar <Employees>  
  IF array_length(xpath('/Employees', NEW.data),1) = 0 THEN
    RAISE EXCEPTION 'XML inválido: falta elemento raíz <Employees>';
  END IF;

  -- 2) Extraer cada <Employee>  
  nodes := xpath('/Employees/Employee', NEW.data);
  IF array_length(nodes,1) = 0 THEN
    RAISE EXCEPTION 'XML inválido: no hay ningún <Employee>';
  END IF;

  -- 3) Validar campos de cada uno
  FOREACH node IN ARRAY nodes LOOP
    -- 3.1 Atributo id en la raíz del fragmento
    v_id := COALESCE((xpath('string(/*/@id)',         node))[1], '');
    IF v_id = '' THEN
      RAISE EXCEPTION 'XML inválido: <Employee> sin atributo id';
    END IF;

    -- 3.2 Elementos hijos
    v_empid    := COALESCE((xpath('string(/*/EmployeeID)',     node))[1], '');
    v_deptid   := COALESCE((xpath('string(/*/DepartmentID)',   node))[1], '');
    v_deptname := COALESCE((xpath('string(/*/DepartmentName)', node))[1], '');

    IF v_empid = '' THEN
      RAISE EXCEPTION 'XML inválido: <Employee id="%" sin <EmployeeID>', v_id;
    ELSIF v_deptid = '' THEN
      RAISE EXCEPTION 'XML inválido: <Employee id="%" sin <DepartmentID>', v_id;
    ELSIF v_deptname = '' THEN
      RAISE EXCEPTION 'XML inválido: <Employee id="%" sin <DepartmentName>', v_id;
    END IF;

    -- 3.3 Validar que sean enteros
    PERFORM v_id::integer;
    PERFORM v_empid::integer;
    PERFORM v_deptid::integer;
  END LOOP;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;
