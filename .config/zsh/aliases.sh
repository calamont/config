# For editing and managing configs
alias config='git --git-dir=$HOME/.config_bare/ --work-tree=$HOME'
alias editrc='nvim ~/.config/zsh/.zshrc'

# For navigation
alias pu=pushd
alias po=popd
alias dirs='dirs -v'

# For development
alias gs='git status'

alias uuidgen="uuidgen | tr '[:upper:]' '[:lower:]'"

alias dc='docker compose'
alias ls="ls -lpG"
# alias grep="ggrep"  # use GNU grep
alias paws="aws --profile personal"
# TODO: Is this needed anymore?
alias ec2ls="aws ec2 describe-instances --profile personal  --region eu-west-2 | jq -r '.Reservations[] | .Instances[] | \"\(.InstanceId)\t\(.InstanceType)\t\(.LaunchTime)\"'"
alias fvim="nvim -c 'Telescope find_files'"  # automatically open nvim in Telescope file browser
alias gvim="nvim -c 'Ge:'"  # use nvim fugitive plugin to organise git
# Authentical AWS ECR with Docker
alias ecr_login='aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com'

alias venv='python3 -m venv venv && . venv/bin/activate && pip install --upgrade pip &> /dev/null'

alias pjson='pbpaste | jq'  # prints valid json in your clipboard
# prints a list of root and nested keys for a json object
alias list_keys="jq 'select(objects)|=[.] | map(paths(scalars)) | map( map(select(numbers)=\"[]\") | join(\".\")) | unique'"

# TODO: Do I want any of these Java/Gradle aliases? I can't seem to remember them.
alias gradleinit='docker run --rm -v "$PWD":/home/gradle/project -w /home/gradle/project -it gradle gradle init'
alias springwebinit="curl https://start.spring.io/starter.zip -d dependencies=web -d bootVersion=3.4.1 -d type=gradle-project  -o my-project.zip"
alias javad='docker run -it --rm -v "$PWD":/home/gradle/src -w /home/gradle/src -e /bin/bash openjdk:17'
alias gradlew='docker run --rm -v "$PWD":/home/gradle/src -w /home/gradle/src -e /bin/bash openjdk:17 ./gradlew'
alias jepl='docker run -it --rm -v "$PWD":/home/gradle/src -w /home/gradle/src -e /bin/bash openjdk:17'
alias direnv='export $(grep -v '^#' .env | xargs)'
