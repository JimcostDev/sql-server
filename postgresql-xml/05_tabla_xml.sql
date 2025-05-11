-- 1. Registrar el esquema XML (requiere extensión xml2)
CREATE EXTENSION IF NOT EXISTS xml2;
SELECT * FROM pg_extension WHERE extname = 'xml2'

-- 2. Crear tabla para almacenar XML
CREATE TABLE xml_employees (
    id SERIAL PRIMARY KEY,
    data XML NOT NULL
);

