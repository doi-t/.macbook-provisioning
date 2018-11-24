.PHONY: provision

init:
	ansible-playbook --diff -v provision.yml -i hosts --extra-vars=user_name=$$(whoami) --ask-become-pass

update:
	ansible-playbook --diff -v provision.yml -i hosts --extra-vars=user_name=$$(whoami)
