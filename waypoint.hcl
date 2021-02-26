project = "minecraft"

app "minecraft" {
  build {
    use "docker-pull" {
      image = "itzg/minecraft-server"
      tag   = "latest"
    }
  }
  deploy {
    use "kubernetes" {
      scratch_path = "/data"
      static_environment = {
        EULA = true
      }
    }
  }
  release {
    use "kubernetes" {
      load_balancer = true
      port          = 25565
    }
  }
}
