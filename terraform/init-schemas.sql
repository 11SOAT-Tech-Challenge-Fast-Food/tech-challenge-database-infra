-- Criação dos schemas para cada microsserviço
CREATE SCHEMA IF NOT EXISTS customer;
CREATE SCHEMA IF NOT EXISTS payment;
CREATE SCHEMA IF NOT EXISTS product;

-- Comentários descrevendo cada schema
COMMENT ON SCHEMA customer IS 'Schema para o microsserviço de Customer';
COMMENT ON SCHEMA payment IS 'Schema para o microsserviço de Payment';
COMMENT ON SCHEMA product IS 'Schema para o microsserviço de Product';

-- Criação de usuários específicos para cada microsserviço
CREATE USER customer_user WITH PASSWORD '${customer_password}';
CREATE USER payment_user WITH PASSWORD '${payment_password}';
CREATE USER product_user WITH PASSWORD '${product_password}';

-- Permissões específicas: cada usuário só acessa seu próprio schema
-- Customer User
GRANT CONNECT ON DATABASE ${db_name} TO customer_user;
GRANT USAGE ON SCHEMA customer TO customer_user;
GRANT ALL PRIVILEGES ON SCHEMA customer TO customer_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA customer TO customer_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA customer TO customer_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA customer GRANT ALL PRIVILEGES ON TABLES TO customer_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA customer GRANT ALL PRIVILEGES ON SEQUENCES TO customer_user;

-- Payment User
GRANT CONNECT ON DATABASE ${db_name} TO payment_user;
GRANT USAGE ON SCHEMA payment TO payment_user;
GRANT ALL PRIVILEGES ON SCHEMA payment TO payment_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA payment TO payment_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA payment TO payment_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA payment GRANT ALL PRIVILEGES ON TABLES TO payment_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA payment GRANT ALL PRIVILEGES ON SEQUENCES TO payment_user;

-- Product User
GRANT CONNECT ON DATABASE ${db_name} TO product_user;
GRANT USAGE ON SCHEMA product TO product_user;
GRANT ALL PRIVILEGES ON SCHEMA product TO product_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA product TO product_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA product TO product_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA product GRANT ALL PRIVILEGES ON TABLES TO product_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA product GRANT ALL PRIVILEGES ON SEQUENCES TO product_user;
