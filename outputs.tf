output "supabase_db_id" {
  description = "Supabase database ID"
  value       = supabase_project.db.id
}

output "supabase_db_url" {
  description = "Safe DATABASE_URL"
  value       = data.supabase_pooler.production.url.transaction
}

output "backend_student_vercel_deployment_url" {
  description = "The Preview Deployment URL of cs486-final-backend-student"
  value       = vercel_deployment.backend_student.url
}

output "backend_catalog_vercel_deployment_url" {
  description = "The Preview Deployment URL of cs486-final-backend-catalog"
  value       = vercel_deployment.backend_catalog.url
}

output "backend_registration_vercel_deployment_url" {
  description = "The Preview Deployment URL of cs486-final-backend-registration"
  value       = vercel_deployment.backend_registration.url
}
