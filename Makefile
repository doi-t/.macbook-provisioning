.PHONY: provision

provision:
	ansible-playbook --diff -v provision.yml -i hosts
