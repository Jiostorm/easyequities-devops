variable "host_socket" {
  type        = string
  description = "Docker Host Socket"
}

variable "host_port_number" {
  type        = number
  description = "Nginx Host Port"
  validation {
    condition     = var.host_port_number >= 1024 && var.host_port_number <= 65535
    error_message = "Error: Port outside of the range [1024-65536]!"
  }
}
