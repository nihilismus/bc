#!/bin/bash
# diff and grep return 1 if there is a diff or nothing is found
set +e  

service="http://localhost:8080"
red='\033[0;31m'
green='\033[0;32m'
gray='\033[0;37m'
nc='\033[0m'

# $1 number of task to run
function running { 
    >&2 echo "" # just a newline
    >&2 echo -e "${gray}running task $1${nc}"
    >&2 echo -e "${gray}---------------${nc}"
}

# $1 message
function success { 
    >&2 echo -e "${green}$1${nc}"
}

# $1 message
function fail { 
    >&2 echo -e "${red}$1${nc}"
}

function task1 { 
    running "1"
    body=$(request "/healthcheck" "200" "text/plain")
    failure $? ""

    diffIt "ok" "$body"
}







# $1 path (string)
# $2 expected status code (string) 
# $3 expected content-type (string) 
function request { 
    output=$(curl -o - -s -w '\nstatus:%{http_code}content-type:%{content_type}' "$service$1")
    failure $? "unable to connect to server $service"

    status_block=$(echo $output | grep -o -E "status:[0-9]{3}")
    failure $? "no status code returned"

    status=$(echo $status_block | grep -o -E "[0-9]{3}")
    if [ "$2" != "$status" ]; then
        fail "got $status_code wanted $2"
        return 1
    fi
    
    success "success $service$1 returned status code: $2" 

    if [ "$3" == "" ]; then
        echo "$output" | sed s/status:.*//g
        return 0
    fi
    content_type_block=$(echo $output | grep -o -E "content-type:[a-zA-Z]+/[a-zA-Z-]+")
    failure $? "no content-type returned"

    content_type=$(echo $content_type_block | grep -o -E "[a-zA-Z]+/[a-zA-Z-]+")
    if [ "$3" != "$content_type" ]; then
        fail "got $content_type wanted $3"
        return 1
    fi

    success "success $service$1 returned content-type: $3"
    echo "$output" | sed s/status:.*//g
}

function diffIt { 
    output=$(diff <(echo $1 ) <(echo $2))
    failure $? "diff: \n$output"
    success "success no diff in body"
}

# $1 should be $?, i.e. last command's exit code
function failure { 
    if [ $1 -ne 0 ]; then
        fail "$2"
        exit $1
    fi
}


# Run
for task in $@; 
do 
    case $task in
        "1")
            task1
        ;;
        "all")
            task1     
        ;;
        *)
            fail "unknown task number: $task"
            exit 1
        ;;
    esac
done
