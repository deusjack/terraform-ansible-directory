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
    var.secontext.user != null ? { dir_seuser = var.secontext.user } : {},
    var.secontext.role != null ? { dir_serole = var.secontext.role } : {},
    var.secontext.type != null ? { dir_setype = var.secontext.type } : {},
    var.secontext.level != null ? { dir_selevel = var.secontext.level } : {}
  )
  lifecycle {
    replace_triggered_by = [
      null_resource.directory,
      null_resource.external,
      null_resource.variables
    ]
  }
}
