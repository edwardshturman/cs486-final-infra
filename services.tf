resource "vercel_project" "backend" {
  name      = "${var.prefix}-src-backend"
  framework = "nextjs"
  git_repository = {
    type = "github"
    repo = "edwardshturman/cs486-final-src"
  }
  root_directory = "backend"

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

resource "vercel_deployment" "backend" {
  project_id = vercel_project.backend.id
  ref        = "main"
}
