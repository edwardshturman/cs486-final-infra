resource "supabase_project" "db" {
  organization_id   = var.supabase_org_id
  name              = "${var.prefix}-db"
  database_password = var.supabase_db_password
  region            = "us-west-1"
}

data "supabase_pooler" "production" {
  project_ref = supabase_project.db.id
}
