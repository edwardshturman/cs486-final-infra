provider "vercel" {
  api_token = var.vercel_api_token
  team      = "edday"
}

resource "vercel_project" "with_git" {
  name = "cs486-final-src-backend"
  git_repository = {
    type = "github"
    repo = "edwardshturman/hono-on-vercel"
  }

  automatically_expose_system_environment_variables = true
  serverless_function_region                        = "sfo1"
}

resource "vercel_deployment" "with_git" {
  project_id = vercel_project.with_git.id
  ref        = "main"
}
