provider "vercel" {
  api_token = var.vercel_api_token
  team      = "compsigh"
}

provider "supabase" {
  access_token = var.supabase_access_token
}

resource "supabase_project" "cs486-final-db" {
  organization_id   = var.supabase_org_id
  name              = "cs486-final-db"
  database_password = var.supabase_db_password
  region            = "us-west-1"
}

data "supabase_pooler" "production" {
  project_ref = supabase_project.cs486-final-db.id
}

resource "vercel_project" "with_git" {
  name = "cs486-final-src-backend"
  git_repository = {
    type = "github"
    repo = "edwardshturman/cs486-final-src"
  }
  root_directory = "backend"

  serverless_function_region                        = "sfo1"
  automatically_expose_system_environment_variables = true
  environment = [{
    key = "DATABASE_URL"
    value = replace(
      data.supabase_pooler.production.url.transaction,
      "[YOUR-PASSWORD]",
      var.supabase_db_password
    )
    target = ["production"]
  }]
}

resource "vercel_deployment" "with_git" {
  project_id = vercel_project.with_git.id
  ref        = "main"
}
