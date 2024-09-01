variable "external_triggers" {
  type        = map(string)
  description = "Triggers for rerunning the directory playbook except variables"
  default     = {}
}

# Doesn't need a trigger. On change the playbooks is automatically replaced.
variable "hostname" {
  type        = string
  description = "The hostname of linux machine the directory will be created on"
}

variable "path" {
  type        = string
  description = "Path of the directory"
}

variable "mode" {
  type        = string
  description = "Mode of the directory"
  default     = "0755"
}

variable "owner" {
  type        = string
  description = "Owner of the directory"
  default     = "root"
}

variable "group_owner" {
  type        = string
  description = "Group owner of the directory"
  default     = null
}

variable "selinux" {
  type = object({
    role = optional(string, null)
    type = optional(string, null)
    user = optional(string, null)
  })
}
