locals {
  bug_string = <<EOT
/usr/lib/python3.11/site-packages/paramiko/pkey.py:100: CryptographyDeprecationWarning: TripleDES has been moved to cryptography.hazmat.decrepit.ciphers.algorithms.TripleDES and will be removed from this module in 48.0.0.
  "cipher": algorithms.TripleDES,
/usr/lib/python3.11/site-packages/paramiko/transport.py:259: CryptographyDeprecationWarning: TripleDES has been moved to cryptography.hazmat.decrepit.ciphers.algorithms.TripleDES and will be removed from this module in 48.0.0.
  "class": algorithms.TripleDES,
EOT

  secontext = one(jsondecode(replace(ansible_playbook.directory.ansible_playbook_stdout, local.bug_string, "")).plays).tasks[0].hosts[var.hostname].secontext
}

output "triggers" {
  value = {
    playbook = ansible_playbook.directory.id
  }
  description = "Trigger for directory changes to be used by other terraform_data/modules"
}

output "hostname" {
  value       = var.hostname
  description = "The hostname of linux machine the directory was created on"
}

output "path" {
  value       = var.path
  description = "Path of the directory"
}

output "mode" {
  value       = var.mode
  description = "Mode of the directory"
}

output "owner" {
  value       = var.owner
  description = "Name of the owner of the directory"
}

output "group" {
  value       = var.group_owner != null ? var.group_owner : var.owner
  description = "Name of the group owner of the directory"
}

output "secontext" {
  value = {
    user  = split(":", local.secontext)[0]
    role  = split(":", local.secontext)[1]
    type  = split(":", local.secontext)[2]
    level = split(":", local.secontext)[3]
  }
  description = "The applied secontext for the directory"
}
