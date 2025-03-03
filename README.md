# Python Microservices Project

This project demonstrates a basic microservices architecture with an API Gateway using Python Flask and NGINX. It consists of two simple microservices (user-service and order-service) and an NGINX API Gateway that routes requests and implements basic cross-cutting concerns like rate limiting.

## Project Overview

### Components
- **User Service**: A Flask application that provides user-related endpoints
- **Order Service**: A Flask application that provides order-related endpoints
- **API Gateway**: An NGINX server that routes requests to the appropriate service

## Architecture Overview

```
                   ┌─────────────┐
                   │             │
 Client ───────────►   Nginx     │
                   │  Gateway    │
                   │             │
                   └──────┬──────┘
                          │
                 ┌────────┴────────┐
                 │                 │
        ┌────────▼─────┐   ┌───────▼──────┐
        │              │   │              │
        │ User Service │   │ Order Service│
        │              │   │              │
        └──────────────┘   └──────────────┘
```

## Prerequisites

- Docker
- Docker Compose
- Windows, macOS, or Linux operating system

## Getting Started

### Project Structure
```
microservices-project/
├── user-service/
│   ├── user_service.py
│   ├── Dockerfile
│   └── requirements.txt
├── order-service/
│   ├── order_service.py
│   ├── Dockerfile
│   └── requirements.txt
├── nginx.conf
├── docker-compose.yml
└── README.md
```

### Setup Instructions

1. **Clone or create the project**:
   ```bash
   # Create the directory structure
   mkdir -p microservices-project/user-service microservices-project/order-service
   cd microservices-project
   ```

2. **Create the required files**:
   
   Each file should be created with the content provided in the corresponding sections below.

3. **Build and run the project**:
   ```bash
   docker-compose up --build
   ```

4. **Test the services**:
   ```bash
   # Test user service
   curl http://localhost:8080/users
   
   # Test order service
   curl http://localhost:8080/orders
   
   # Test rate-limited endpoints
   curl http://localhost:8080/limited-users
   curl http://localhost:8080/limited-orders
   ```

## API Endpoints

### User Service
- `GET /users` - Returns a list of users
- `GET /users/{id}` - Returns details for a specific user
- `GET /health` - Health check endpoint

### Order Service
- `GET /orders` - Returns a list of orders
- `GET /orders/{id}` - Returns details for a specific order
- `GET /health` - Health check endpoint

### API Gateway
- `GET /users` - Proxies to the user service
- `GET /orders` - Proxies to the order service
- `GET /limited-users` - Rate-limited access to user service
- `GET /limited-orders` - Rate-limited access to order service

## Extending the Project

This project can be extended in several ways:

1. **Add a Database**: Connect the services to a database like MongoDB or PostgreSQL
2. **Implement Event-Driven Communication**: Add a message broker like RabbitMQ or Kafka
3. **Add Authentication**: Implement JWT authentication in the API Gateway
4. **Service Discovery**: Add service discovery using Consul or etcd
5. **Monitoring**: Add Prometheus and Grafana for monitoring
6. **CI/CD Pipeline**: Set up a CI/CD pipeline using GitHub Actions or Jenkins

## Troubleshooting

1. **Port conflicts**: If you get port conflict errors, change the port mappings in the docker-compose.yml file
2. **Connection refused**: Make sure all services are running (`docker ps` to check)
3. **NGINX errors**: Check the NGINX logs (`docker-compose logs nginx`)

## Resources

- [Flask Documentation](https://flask.palletsprojects.com/)
- [NGINX Documentation](https://nginx.org/en/docs/)
- [Docker Documentation](https://docs.docker.com/)
- [Microservices Architecture](https://microservices.io/)
