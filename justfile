# Default recipe
ls:
  just --list

_prompt name='':
  #!/bin/bash
  read -p "Installing {{name}}. Do you want to proceed? (yes/no) " yn

  case $yn in
    yes ) echo "Installing..";;
    no ) echo "Exiting...";
            exit 1;;
    * ) echo "Invalid response";
            exit 1;;
  esac

# Install configs
install: (_prompt 'configs')
  stow .
