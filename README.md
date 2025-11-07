# Petlife API

REST API em Spring Boot para consultar e cadastrar usuários na tabela `users` do banco MySQL **petlife**.

## Requisitos

- Java 17+
- Maven 3.9+
- Docker (opcional, para executar via container)
- Banco MySQL existente com a tabela `users (id BIGINT AUTO_INCREMENT, email VARCHAR, senha VARCHAR, ativo TINYINT)`

## Configuração

Defina as variáveis de ambiente de conexão antes de iniciar a aplicação (ajuste conforme suas credenciais):

```bash
export DB_HOST=petlife_db-petlife
export DB_PORT=3306
export DB_NAME=petlife
export DB_USER=petlife_user
export DB_PASSWORD='sua_senha_aqui'
```

Alternativamente, edite `src/main/resources/application.properties` com os valores desejados.

## Executar localmente

```bash
mvn spring-boot:run
```

Quando iniciar, a API estará disponível em `http://localhost:8080`.

### Endpoints

- `GET /api/users` — lista todos os usuários
- `GET /api/users/{id}` — consulta um usuário pelo `id`
- `POST /api/users` — cria um novo usuário
  - Corpo esperado:

    ```json
    {
      "nome": "Maria Silva",
      "email": "usuario@example.com",
      "ativo": true
    }
    ```

## Build do artefato

```bash
mvn clean package -DskipTests
```

O arquivo gerado será `target/petlife-api-0.0.1-SNAPSHOT.jar`.

## Docker

### Build da imagem

```bash
docker build -t petlife-api .
```

### Executar o container

```bash
docker run \
  -e DB_HOST=petlife_db-petlife \
  -e DB_PORT=3306 \
  -e DB_NAME=petlife \
  -e DB_USER=petlife_user \
  -e DB_PASSWORD='sua_senha_aqui' \
  -p 8080:8080 \
  petlife-api
```

A aplicação dentro do container expõe a porta 8080.
