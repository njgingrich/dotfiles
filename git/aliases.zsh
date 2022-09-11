# +-------------+
# | Git Aliases |
# +-------------+

# Outputs the name of the current branch
# Usage example: git pull origin $(git_current_branch)
# Using '--quiet' with 'symbolic-ref' will not cause a fatal error (128) if
# it's not a symbolic ref, but in a Git repo.
function git_current_branch() {
  local ref
  ref=$(__git_prompt_git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(__git_prompt_git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

alias ga='git add'
alias gac='git add -A && git commit -m'
alias gb='git branch '
alias gblame='git blame'
alias gblog="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:red)%(refname:short)%(color:reset) - %(color:yellow)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:blue)%(committerdate:relative)%(color:reset))'"                                                             # git log for each branches
alias gc='git commit'
alias gclean="git branch --merged | grep  -v '\\*\\|master\\|develop' | xargs -n 1 git branch -d" # Delete local branch merged with master
alias gco='git checkout '
# Remove `+` and `-` from start of diff lines; just rely upon color.
alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'
# alias gd='git diff'
alias gl='git log --pretty=oneline'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias glol='git log --graph --abbrev-commit --oneline --decorate'
alias gp='git push'
alias gplo='git pull origin'
alias gpo='git push origin'
alias gpp='git pull --prune'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias gpt='git push --tag'
alias gr='git remote'
alias grb='git branch -r'                                                                           # display remote branch
alias grs='git remote show'
alias gs='git status -sb'
alias gss='git status -s'
alias gsw='git switch '
alias gswc='git switch -c '
alias gtd='git tag --delete'
alias gtdr='git tag --delete origin'
