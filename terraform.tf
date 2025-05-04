terraform {
  required_version = "1.11.3"
  required_providers {
    vercel = {
      source  = "vercel/vercel"
      version = "3.0.1"
    }
    supabase = {
      source  = "supabase/supabase"
      version = "1.5.1"
    }
  }
}
