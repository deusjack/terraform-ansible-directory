output "triggers" {
  value = {
    directory = terraform_data.directory
  }
  description = "Trigger for directory changes to be used by other terraform_data/modules"
}

output "hostname" {
  value       = jsondecode(terraform_data.directory.output).hostname
  description = "The hostname of linux machine the directory was created on"
}

output "path" {
  value       = jsondecode(terraform_data.directory.output).path
  description = "Path of the directory"
}

output "mode" {
  value       = jsondecode(terraform_data.directory.output).mode
  description = "Mode of the directory"
}

output "owner" {
  value       = jsondecode(terraform_data.directory.output).owner
  description = "Name of the owner of the directory"
}

output "group" {
  value       = jsondecode(terraform_data.directory.output).group_owner
  description = "Name of the group owner of the directory"
}

output "secontext" {
  value = {
    user  = jsondecode(terraform_data.directory.output).secontext_user
    role  = jsondecode(terraform_data.directory.output).secontext_role
    type  = jsondecode(terraform_data.directory.output).secontext_type
    level = jsondecode(terraform_data.directory.output).secontext_level
  }
  description = "The applied secontext for the directory"
}
