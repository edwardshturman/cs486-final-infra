resource "vercel_project" "frontend" {
  name      = "${var.prefix}-src-frontend"
  framework = "nextjs"
  git_repository = {
    type = "github"
    repo = "edwardshturman/cs486-final-src"
  }
  root_directory = "frontend"

  serverless_function_region                        = "sfo1"
  automatically_expose_system_environment_variables = true
  environment = [{
    key = "DATABASE_URL"
    value = "${replace(
      data.supabase_pooler.production.url.transaction,
      "[YOUR-PASSWORD]",
      var.supabase_db_password
    )}?pgbouncer=true"
    target = ["production"]
  }]
}

resource "vercel_deployment" "frontend" {
  project_id = vercel_project.frontend.id
  ref        = "main"
}
