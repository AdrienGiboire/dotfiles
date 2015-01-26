#!/bin/sh

################################################################################
# GitHub to BitBucket
#
# We all have private projects that arrive to an end and we don't want to keep
# spending money for those projects but we don't necessarily want to get rid of
# them.
#
# A solution that can be used is to 'archive' them on BitBucket.
#
# USAGE
#
# Run:
# $ ./archive_github_repo_to_bitbucket.sh \
#   -bbu <bitbucket_username> \
#   -bbp <bitbucket_password> \
#   -r <repositories> \
#   -gho <github-organisation> \
#   -bbo <bitbucket-organisation>
#
# Where:
#   <bitbucket_username> is the login for bitbucket
#   <bitbucket_password> is the password for bitbucket
#   <repositories> is the comma-separated list of repositories on github you want to migrate
#   <github-organisation> is the name of the organisation on github
#   <bitbucket-organisation> is the name of the organisation on bitbucket
#
# Here are a few things to keep in mind:
#   - You should already be able to deal with Bitbucket repositories in CLI
#   - You should already be able to deal with Github repositories in CLI
#   - After the script is done running, you still have to manually delete Github repositories
#
# CONTRIBUTING
#
# Want to contribute? Awesome! Thank you so much!
#
## HOW?
#
# 1. Fork it (https://help.github.com/articles/fork-a-repo)
# 2. Create a feature branch (`git checkout -b my-new-feature`)
# 3. Commit changes (`git commit -am 'Add my new feature'`)
# 4. Push to the branch (`git push origin my-new-feature`)
# 5. Create a Pull Request (https://help.github.com/articles/using-pull-requests)
#
# CHANGELOG
#
# v1.0.0
#   2015-01-26
#   * Official release
#
# LICENSE
#
# Copyright (C) 2015 Adrien Giboire, MIT License
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
################################################################################

function clone_from_github
{
    echo "Cloning $github_organisation/$repository from GitHub..."

    git clone git@github.com:$github_organisation/$repository.git 2> /dev/null

    echo "$github_organisation/$repository cloned."
}

function create_bitbucket_repository
{
    echo "Creating repository $bitbucket_organisation/$repository on BitBucket..."
    
    curl -X POST -v \
	 -H "Content-Type: application/json" \
	 -u $bitbucket_username:$bitbucket_password \
	 https://api.bitbucket.org/2.0/repositories/$bitbucket_organisation/$repository \
	 -d '{"scm": "git", "is_private": "true"}' \
	 2> /dev/null
    
    echo "Bitbucket repository created."
}

function push_on_bitbucket
{
    echo "Pushing on BitBucket $bitbucket_organisation/$repository repository..."
    
    git push git@bitbucket.org:$bitbucket_organisation/$repository.git master

    echo "Push done."
}

function clean_relicate
{
    echo "Cleaning relicates in 'tmp'"
    
    cd /tmp
    rm -fr $repository

    echo "'tmp' cleaned."
}

function main
{
    for i in "${repositories[@]}"; do
	repository=$i

	cd /tmp
	clone_from_github
	
	cd $repository
	create_bitbucket_repository
	
	push_on_bitbucket
    
	clean_relicate
    done
}

function usage
{
    echo "usage: archive_github_repo_to_bitbucket -bbu|--bitbucket-username <bitbucket_username> -bbp|--bitbucket-password <password> -r|--repositories <repositories> -gho|--github-organisation <github-organisation> -bbo|--bitbucket-organisation <bitbucket-organisation>"
    echo "\t <bitbucket_username> is the login for bitbucket"
    echo "\t <bitbucket_password> is the password for bitbucket"
    echo "\t <repositories> is the comma-separated list of repositories on github you want to migrate"
    echo "\t <github-organisation> is the name of the organisation on github"
    echo "\t <bitbucket-organisation> is the name of the organisation on bitbucket"
}

### Run

if [ "$1" = "" ]; then
   usage
   exit 1
fi

bitbucket_username=
bitbucket_password=
repositories=
github_organisation=
bitbucket_organisation=

while [ "$1" != "" ]; do
    case $1 in
	-bbu | --bitbucket-username )
	    shift
	    bitbucket_username=$1
	    ;;
	-bbp | --bitbucket-password )
	    shift
	    bitbucket_password=$1
	    ;;
	-r | --repositories )
	    shift
	    IFS="," read -ra repositories <<< "$1"
	    ;;
	-gho | --github-organisation )
	    shift
	    github_organisation=$1
	    ;;
	-bbo | --bitbucket-organisation )
	    shift
	    bitbucket_organisation=$1
	    ;;
	* )
	    usage
	    exit 1
    esac
    shift
done

main
