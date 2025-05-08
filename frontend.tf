resource "vercel_project" "frontend" {
  name      = "${var.prefix}-frontend"
  framework = "nextjs"
  git_repository = {
    type = "github"
    repo = "edwardshturman/cs486-final-src"
  }
  root_directory = "frontend"

  serverless_function_region                        = "sfo1"
  automatically_expose_system_environment_variables = true
  environment = [
    {
      key    = "SERVICE_STUDENT_URL"
      value  = vercel_deployment.backend_student.url
      target = ["production"]
    },
    {
      key    = "SERVICE_CATALOG_URL"
      value  = vercel_deployment.backend_catalog.url
      target = ["production"]
    },
    {
      key    = "SERVICE_REGISTRATION_URL"
      value  = vercel_deployment.backend_registration.url
      target = ["production"]
    }
  ]
}

resource "vercel_custom_environment" "frontend_qa" {
  project_id = vercel_project.frontend.id
  name       = "qa"
}

resource "vercel_deployment" "frontend" {
  project_id = vercel_project.frontend.id
  ref        = "main"
}
