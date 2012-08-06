function prompt_char {
	git branch >/dev/null 2>/dev/null && echo '±' && return
		echo '○'
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
#ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{$fg[magenta]%}%n%{$reset_color%} in %{$fg[yellow]%}${PWD/#$HOME/~}%{$reset_color%} ($(git_time_since_commit)$(git_prompt_info)) $(prompt_char) '

local return_status="%{$fg[red]%}%(?..✘)%{$reset_color%}"
RPROMPT='${return_status}%{$reset_color%}'

function rvm_prompt() {
	echo `~/.rvm/bin/rvm-prompt interpreter version gemset`
}

# Determine the time since last commit. If branch is clean,
# use a neutral color, otherwise colors will vary according to time.
function git_time_since_commit() {
	if git rev-parse --git-dir > /dev/null 2>&1; then
		# Only proceed if there is actually a commit.
		if [[ $(git log 2>&1 > /dev/null | grep -c "^fatal: bad default revision") == 0 ]]; then
			# Get the last commit.
			last_commit=`git log --pretty=format:'%at' -1 2> /dev/null`
			now=`date +%s`
			seconds_since_last_commit=$((now-last_commit))

			# Totals
			MINUTES=$((seconds_since_last_commit / 60))
			HOURS=$((seconds_since_last_commit/3600))

			# Sub-hours and sub-minutes
			DAYS=$((seconds_since_last_commit / 86400))
			SUB_HOURS=$((HOURS % 24))
			SUB_MINUTES=$((MINUTES % 60))

			if [[ -n $(git status -s 2> /dev/null) ]]; then
				if [ "$MINUTES" -gt 30 ]; then
					COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG"
						elif [ "$MINUTES" -gt 10 ]; then
						COLOR="$ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM"
				else
					COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT"
				fi
			else
				COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL"
			fi

			if [ "$HOURS" -gt 24 ]; then
				echo "$(rvm_prompt)$COLOR${DAYS}d${SUB_HOURS}h${SUB_MINUTES}m%{$reset_color%}|"
			elif [ "$MINUTES" -gt 60 ]; then
					echo "$(rvm_prompt)$COLOR${HOURS}h${SUB_MINUTES}m%{$reset_color%}|"
			else
				echo "$(rvm_prompt)$COLOR${MINUTES}m%{$reset_color%}|"
			fi
		else
			COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL"
			echo "$(rvm_prompt)$COLOR~|"
		fi
	fi
}