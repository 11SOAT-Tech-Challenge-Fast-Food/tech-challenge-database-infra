
---
# ☁️ Terraform — RDS PostgreSQL (Tech Challenge FIAP)

Este projeto provisiona uma instância **Amazon RDS (PostgreSQL)** usando **Terraform**.
O objetivo é automatizar a criação da infraestrutura do banco de dados no ambiente AWS Academy (LabRole).

---

## 🧩 Pré-requisitos

Antes de começar, certifique-se de ter instalado:

* [Terraform](https://developer.hashicorp.com/terraform/downloads)
* Conta AWS Academy ativa com o **LabRole**
* Configuração do AWS CLI (com o perfil `LabRole` ativo)

---

## ⚙️ Configuração

1. Clone o repositório:

   ```bash
   git clone https://github.com/seu-usuario/tech-challenge-database-infra.git
   cd tech-challenge-database-infra/terraform
   ```

2. Inicialize o Terraform:

   ```bash
   terraform init
   ```

3. (Opcional) Valide a configuração:

   ```bash
   terraform validate
   ```

4. Veja o plano de execução:

   ```bash
   terraform plan
   ```

5. Aplique as mudanças para criar o RDS:

   ```bash
   terraform apply
   ```

   ✅ Quando solicitado, confirme digitando `yes`.

---

## 🔍 Variáveis

As variáveis principais estão definidas em `variables.tf`:

* `db_username`: nome de usuário do banco (não pode ser “admin”)
* `db_password`: senha do banco (senha deve ser maior que 8 caracteres)
* `private_subnet_ids`: ID's das subnets privadas existentes
* `vpc_id`: ID da VPC existente
* `app_security_group_id`: ID do Security Group da aplicação

Você pode criar um arquivo `terraform.tfvars` para sobrescrever valores, por exemplo:

```hcl
db_username = "fastfood_user"
db_password = "minha_senha_segura"
```

---

## 🧹 Destruir a infraestrutura

Para remover todos os recursos criados:

```bash
terraform destroy
```

---

## 🏁 Resultado Esperado

Após aplicar o Terraform, você terá:

* Um **RDS PostgreSQL** configurado e acessível apenas na VPC privada.
* Um **DB Subnet Group** vinculado às subnets privadas especificadas.
* Um **Security Group** permitindo acesso apenas às portas e origens configuradas.

---
