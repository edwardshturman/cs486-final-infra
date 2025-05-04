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
