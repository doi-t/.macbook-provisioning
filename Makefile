.PHONY: provision

provision:
	ansible-playbook --diff -vv provision.yml -i hosts
