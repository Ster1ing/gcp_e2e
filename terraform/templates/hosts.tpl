---
gcp:
  hosts:
    server:      
      ansible_host: ${server_ip}
      ansible_user: ${username}
      ansible_ssh_private_key_file: ${ssh_hosts}
      ansible_ssh_common_args: '-o StrictHostKeyChecking=no'
      interpreter_python: /usr/bin/python3.12 
      