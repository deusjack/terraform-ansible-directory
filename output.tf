output "triggers" {
  value = {
    playbook = ansible_playbook.directory.id
  }
}
