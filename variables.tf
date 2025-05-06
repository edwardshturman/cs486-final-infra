variable "prefix" {
  description = "Project prefix"
  type        = string
  default     = "cs486-final"
}

variable "vercel_team" {
  description = "Vercel team slug or ID for projects and deployments"
  type        = string
  default     = "compsigh"
}

variable "vercel_api_token" {
  description = "Vercel API token"
  type        = string
  sensitive   = true
  default     = ""
}

variable "supabase_access_token" {
  description = "Supabase personal access token"
  type        = string
  sensitive   = true
  default     = ""
}

variable "supabase_org_id" {
  description = "Supabase organization ID"
  type        = string
  sensitive   = true
  default     = ""
}

variable "supabase_db_password" {
  description = "Supabase database password"
  type        = string
  sensitive   = true
  default     = ""
}
