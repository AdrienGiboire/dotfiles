#!/bin/sh

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
