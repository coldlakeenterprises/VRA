# Input variable: url
variable "url" {
  description = "The URL of the vRealize Automation environment either vRA 8.x or vRA Cloud"
  type = string
  default = "https://CLE-VRA01.coldlake.local"
}

# Input variable: refresh_token
variable "refresh_token" {
  description = "The refresh token to connect to the vRealize Automation environment"
  type = string
  default = ""
}

# Input variable: insecure
variable "insecure" {
  description = "Should SSL verification be skipped? true = skip ssl verification"
  type = bool
  default = "false"
}