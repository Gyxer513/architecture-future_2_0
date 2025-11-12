variable "docker_host" {
  description = "Docker API endpoint"
  type        = string
  default     = "unix:///var/run/docker.sock"
}

variable "project_name" {
  description = "Имя проекта"
  type        = string
  default     = "myproject"
}

variable "environment" {
  description = "Окружение (dev/staging/prod)"
  type        = string
  default     = "dev"
}

variable "app_image_tag" {
  description = "Тег для Docker-образа приложения"
  type        = string
  default     = "latest"
}

variable "app_port" {
  description = "Порт, на котором слушает приложение"
  type        = number
  default     = 8080
}

variable "db_version" {
  description = "Версия Postgres"
  type        = string
  default     = "15"
}

variable "db_port" {
  description = "Порт БД наружу"
  type        = number
  default     = 5432
}

variable "db_name" {
  description = "Имя базы данных"
  type        = string
  default     = "appdb"
}

variable "db_username" {
  description = "Пользователь БД"
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "Пароль БД"
  type        = string
  default     = "postgres"
}

variable "db_host_override" {
  description = "Переопределить имя хоста БД, если нужно вручную"
  type        = string
  default     = null
}