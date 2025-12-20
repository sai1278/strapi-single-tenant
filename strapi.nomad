job "strapi-single-tenant" {
  datacenters = ["dc1"]
  type = "service"

  group "strapi" {
    count = 1

    network {
      port "http" {
        static = 1337
      }
    }

    task "strapi" {
      driver = "docker"

      config {
        image = "dockerhub-username/strapi-single:latest"
        ports = ["http"]
      }

      env {
        NODE_ENV = "production"
        DATABASE_CLIENT = "postgres"
        DATABASE_HOST = "db-host"
        DATABASE_NAME = "strapi_db"
        DATABASE_USERNAME = "strapi_user"
        DATABASE_PASSWORD = "strapi_password"
      }

      resources {
        cpu    = 500
        memory = 1024
      }
    }
  }
}
