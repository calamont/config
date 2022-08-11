alias pip=pip3
alias ls="ls -lpG"
alias weather="curl http://wttr.in/"
# alias grep="ggrep"  # use GNU grep
alias paws="aws --profile personal"
alias ec2ls="aws ec2 describe-instances --profile personal  --region eu-west-2 | jq -r '.Reservations[] | .Instances[] | \"\(.InstanceId)\t\(.InstanceType)\t\(.LaunchTime)\"'"
alias fvim="nvim -c 'Telescope find_files'"  # automatically open nvim in Telescope file browser
alias gvim="nvim -c 'Ge:'"  # use nvim fugitive plugin to organise git
# Authentical AWS ECR with Docker
alias ecr_login='aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com'

alias config='git --git-dir=$HOME/.config_bare/ --work-tree=$HOME'
alias venv='python3 -m venv venv && . venv/bin/activate && pip install --upgrade pip &> /dev/null'

alias pjson='pbpaste | jq'  # prints valid json in your clipboard
# prints a list of root and nested keys for a json object
alias list_keys="jq 'select(objects)|=[.] | map(paths(scalars)) | map( map(select(numbers)=\"[]\") | join(\".\")) | unique'"
