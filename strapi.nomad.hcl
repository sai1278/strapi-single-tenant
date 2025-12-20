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
        image = "strapi/strapi:latest"
        ports = ["http"]
      }

      env {
        NODE_ENV = "development"
      }

      resources {
        cpu    = 500
        memory = 512
      }
    }
  }
}
