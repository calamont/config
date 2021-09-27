alias pip=pip3
alias ls="ls -lG"
alias icloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/"
alias UCL="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/UCL"
alias modules="cd /Users/cal_lamont/Library/Mobile\ Documents/com~apple~CloudDocs/programming/python/modules"
alias weather="curl http://wttr.in/"
# alias grep="ggrep"  # use GNU grep
alias paws="aws --profile personal"
alias ec2ls="aws ec2 describe-instances --profile personal  --region eu-west-2 | jq -r '.Reservations[] | .Instances[] | \"\(.InstanceId)\t\(.InstanceType)\t\(.LaunchTime)\"'"
alias fvim="nvim -c 'Telescope find_files'"  # automatically open nvim in Telescope file browser
alias gvim="nvim -c 'Ge:'"  # use nvim fugitive plugin to organise git
# Authentical AWS ECR with Docker
alias ecr_login='aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com'

alias config='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
