# nightly
# Preview domains are formatted as:
# e.g. cs486-final-frontend-edwardshturman-compsigh.vercel.app

# qa
# Environment domains are formatted as:
# <project name>-env-<custom environment name>-<team name>.vercel.app
# e.g. cs486-final-frontend-env-qa-compsigh.vercel.app

# resource "vercel_project_domain" "backend_student_qa" {
#   project_id            = vercel_project.backend_student.id
#   domain                = "cs486-final-backend-student-qa.edwardshturman.com"
# }

resource "vercel_project" "backend_student" {
  name      = "${var.prefix}-backend-student"
  framework = "nextjs"
  git_repository = {
    type = "github"
    repo = "edwardshturman/cs486-final-src"
  }
  root_directory = "backend-student"

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

resource "vercel_custom_environment" "backend_student_qa" {
  project_id = vercel_project.backend_student.id
  name       = "qa"
}

resource "vercel_deployment" "backend_student" {
  project_id = vercel_project.backend_student.id
  ref        = "main"
}

resource "vercel_project" "backend_catalog" {
  name      = "${var.prefix}-backend-catalog"
  framework = "nextjs"
  git_repository = {
    type = "github"
    repo = "edwardshturman/cs486-final-src"
  }
  root_directory = "backend-catalog"

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

resource "vercel_custom_environment" "backend_catalog_qa" {
  project_id = vercel_project.backend_catalog.id
  name       = "qa"
}

resource "vercel_deployment" "backend_catalog" {
  project_id = vercel_project.backend_catalog.id
  ref        = "main"
}

resource "vercel_project" "backend_registration" {
  name      = "${var.prefix}-backend-registration"
  framework = "nextjs"
  git_repository = {
    type = "github"
    repo = "edwardshturman/cs486-final-src"
  }
  root_directory = "backend-registration"

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

resource "vercel_custom_environment" "backend_registration_qa" {
  project_id = vercel_project.backend_registration.id
  name       = "qa"
}

resource "vercel_deployment" "backend_registration" {
  project_id = vercel_project.backend_registration.id
  ref        = "main"
}
