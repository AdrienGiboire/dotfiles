function git_branch {
  git b >/dev/null 2>&1 && {
    local current_branch="$(git b | grep -e '*' | cut -d ' ' -f2)"
    echo " (${PR_BLUE}${current_branch}%{$reset_color%})"
  }
}

function _ruby_version {
  chruby >/dev/null 2>&1 && {
    local ruby_version="$(chruby | grep -e '*' | cut -d ' ' -f3)"
    [[ -z "$ruby_version" ]] && [[ -e .ruby-version ]] && {
      ruby_version="$(cat .ruby-version)"
    }
    [[ -n "$ruby_version" ]] && echo " (${PR_YELLOW}${ruby_version}%{$reset_color%})"
  }
}

ruby_version="$(_ruby_version)"
current_pwd="$(pwd | sed -e "s,^$HOME,~,")"

function _update_current_pwd {
  current_pwd="$(pwd | sed -e "s,^$HOME,~,")"
}

function _update_ruby_version {
  ruby_version="$(_ruby_version)"
}

chpwd_functions+=(_update_ruby_version _update_current_pwd)
PROMPT='
${PR_GREEN}${current_pwd}%{$reset_color%}${ruby_version}$(git_branch)
> '
