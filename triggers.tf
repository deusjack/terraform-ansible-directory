#################
# ansible files #
#################

resource "null_resource" "directory" {
  triggers = {
    directory = filemd5("${path.module}/directory.yaml")
  }
}

#####################
# external triggers #
#####################

resource "null_resource" "external" {
  triggers = var.external_triggers
}

#############
# variables #
#############

resource "null_resource" "variables" {
  triggers = {
    path         = var.path
    mode         = var.mode
    owner        = var.owner
    group_owner  = var.group_owner
    selinux_role = var.selinux.role
    selinux_type = var.selinux.type
    selinux_user = var.selinux.user
  }
}
