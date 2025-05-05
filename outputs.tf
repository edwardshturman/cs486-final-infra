output "supabase_db_id" {
  description = "Supabase database ID"
  value       = supabase_project.cs486-final-db.id
}

output "supabase_db_url" {
  description = "Safe DATABASE_URL"
  value       = data.supabase_pooler.production.url.transaction
}

output "backend_vercel_deployment_url" {
  description = "The Preview Deployment URL of cs486-final-src-backend"
  value       = vercel_deployment.with_git.url
}
