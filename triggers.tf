#################
# ansible files #
#################

resource "terraform_data" "directory" {
  input = filemd5("${path.module}/directory.yaml")
}

#####################
# external triggers #
#####################

resource "terraform_data" "external" {
  input = join(",", values(var.external_triggers))
}

#############
# variables #
#############

resource "terraform_data" "variables" {
  input = join(",", values({
    path            = var.path
    mode            = var.mode
    owner           = var.owner
    group_owner     = var.group_owner != null ? var.group_owner : var.owner
    secontext_role  = var.secontext.role != null ? var.secontext.role : ""
    secontext_type  = var.secontext.type != null ? var.secontext.type : ""
    secontext_user  = var.secontext.user != null ? var.secontext.user : ""
    secontext_level = var.secontext.level != null ? var.secontext.level : ""
  }))
}
