output "supabase_db_id" {
  description = "Supabase database ID"
  value       = supabase_project.cs486-final-db.id
}

output "backend_vercel_deployment_url" {
  description = "The Preview Deployment URL of cs486-final-src-backend"
  value       = vercel_deployment.with_git.url
}
