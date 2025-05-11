-- Crear un trigger que active la validación
DROP TRIGGER IF EXISTS trg_validate_hr_xml ON xml_employees;

CREATE TRIGGER trg_validate_hr_xml
  BEFORE INSERT OR UPDATE ON xml_employees
  FOR EACH ROW
  EXECUTE FUNCTION validate_hr_xml();
