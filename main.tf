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

resource "vercel_project" "with_git" {
  name = "cs486-final-src-backend"
  git_repository = {
    type = "github"
    repo = "edwardshturman/hono-on-vercel"
  }

  serverless_function_region                        = "sfo1"
  automatically_expose_system_environment_variables = true
  environment = [{
    key    = "DB_ID"
    value  = supabase_project.cs486-final-db.id
    target = ["production"]
  }]
}

resource "vercel_deployment" "with_git" {
  project_id = vercel_project.with_git.id
  ref        = "main"
}
