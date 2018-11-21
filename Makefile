.PHONY: provision

init:
	ansible-playbook --diff -v provision.yml -i hosts --ask-become-pass

update:
	ansible-playbook --diff -v provision.yml -i hosts
