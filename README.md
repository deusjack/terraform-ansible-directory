# terraform-ansible-directory
Terraform module to create a directory on Linux with Ansible

> [!Warning]
> * This module doesn't have resources with a traditional state.
> * Make sure to set var.external_triggers for any changes that require an update other than variables.
> * This module doesn't delete the changes on the target system on destroy.

# Terraform Docs

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8 |
| <a name="requirement_ansible"></a> [ansible](#requirement\_ansible) | >= 1, < 2 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 3, < 4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ansible"></a> [ansible](#provider\_ansible) | 1.3.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [ansible_playbook.directory](https://registry.terraform.io/providers/ansible/ansible/latest/docs/resources/playbook) | resource |
| [null_resource.directory](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.external](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.variables](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_external_triggers"></a> [external\_triggers](#input\_external\_triggers) | Triggers for rerunning the directory playbook except variables | `map(string)` | `{}` | no |
| <a name="input_group_owner"></a> [group\_owner](#input\_group\_owner) | Name of the group owner of the directory | `string` | `null` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | The hostname of linux machine the directory will be created on | `string` | n/a | yes |
| <a name="input_mode"></a> [mode](#input\_mode) | Mode of the directory | `string` | `"0755"` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | Name of the owner of the directory | `string` | `"root"` | no |
| <a name="input_path"></a> [path](#input\_path) | Path of the directory | `string` | n/a | yes |
| <a name="input_secontext"></a> [secontext](#input\_secontext) | The secontext for the directory | <pre>object({<br>    user  = optional(string, null)<br>    role  = optional(string, null)<br>    type  = optional(string, null)<br>    level = optional(string, null)<br>  })</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_group"></a> [group](#output\_group) | Name of the group owner of the directory |
| <a name="output_hostname"></a> [hostname](#output\_hostname) | The hostname of linux machine the directory was created on |
| <a name="output_mode"></a> [mode](#output\_mode) | Mode of the directory |
| <a name="output_owner"></a> [owner](#output\_owner) | Name of the owner of the directory |
| <a name="output_path"></a> [path](#output\_path) | Path of the directory |
| <a name="output_secontext"></a> [secontext](#output\_secontext) | The applied secontext for the directory |
| <a name="output_triggers"></a> [triggers](#output\_triggers) | Trigger for directory changes to be used by other null\_resources/modules |
<!-- END_TF_DOCS -->
