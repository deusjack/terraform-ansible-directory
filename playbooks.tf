resource "ansible_playbook" "directory" {
  name                    = var.hostname
  playbook                = "${path.module}/directory.yaml"
  replayable              = false
  ignore_playbook_failure = false
  extra_vars = merge(
    {
      dir_path        = var.path
      dir_mode        = var.mode
      dir_owner       = var.owner
      dir_group_owner = var.group_owner != null ? var.group_owner : var.owner
    },
    var.selinux.role != null ? { dir_serole = var.selinux.role } : {},
    var.selinux.type != null ? { dir_setype = var.selinux.type } : {},
    var.selinux.user != null ? { dir_seuser = var.selinux.user } : {}
  )
  lifecycle {
    replace_triggered_by = [
      null_resource.directory,
      null_resource.external,
      null_resource.variables
    ]
  }
}
