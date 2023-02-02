#!/bin/bash
source config.sh

extra_message=""

#define the banner
banner="
*********************************************************************
 #####                                            
#     # #        ##    ####  #    # ###### #####  
#       #       #  #  #    # #   #  #      #    # 
 #####  #      #    # #      ####   #####  #    # 
      # #      ###### #      #  #   #      #####  
#     # #      #    # #    # #   #  #      #   #  
 #####  ###### #    #  ####  #    # ###### #    # 
*********************************************************************
                    === Welcome Slacker! ===
*********************************************************************
"

echo "$banner"

# Iterate through the command line arguments
while [ $# -gt 0 ]; do
    arg="$1"
    if [ "$arg" == "-m" ] || [ "$arg" == "--message" ]; then
        # Get the next argument as the extra message
        extra_message="$2"
        shift # shift the arguments so the loop does not process the message as a folder

    # Check if the argument is either --list or -l
    elif [ "$arg" == "--list" ] || [ "$arg" == "-l" ]; then
        # Get the list of all the folders inside the ~/Code directory
        projects=($(find ~/Code/ -maxdepth 1 -type d -exec basename {} \; | awk -F/ '{print $NF}' | sort))

        # Display a message indicating the available projects
        echo "Available projects: "

        # Loop through the sorted list of projects
        for project in "${projects[@]}"; do
            # Display each project with a bullet point
            echo " - $project"
        done

        # Exit the script
        exit
    else
        # Process the current argument as the folder name
        folder_name="$arg"
        username=$GIT_USERNAME
        # Change directory to the folder
        cd ~/Code/$folder_name

        # Use git log to get all commits for today
        commits=$(git log --since=yesterday --date=short --oneline --author="$username")

        # Check if there are any commits
        if [ -z "$commits" ]; then
            echo "No commits found for $folder_name"
        else
            # Format the message
            message="Author: $username \nProject: $folder_name\n\`\`\`$commits\`\`\` \n"

            # Store the commit messages in a variable
            all_commits+="$commits\n"

            # Concatenate the message to the all_messages variable
            all_messages+="$message"
        fi
    fi
    shift # remove the processed argument from the list
done

# Format the commit messages as a list
echo -e "Author: $username \nProject: $folder_name\n"
echo "Commits:"
IFS=$'\n' read -rd '' -a commit_array <<< "$all_commits"

for commit in "${commit_array[@]}"; do
    echo -e " - $commit"
done
echo -e "\n\n\n\n"
all_messages+=$extra_message

# echo $all_messages

read -p "Do you want to proceed and send the message to Slack? (yes/no) " yn

case $yn in 
	yes | y ) 
    echo ok, check your slack 
    curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"$all_messages\"}" $SLACK_HOOK_URL
    ;;
	no | n) 
    echo exiting...;
		exit;;
	* ) echo invalid response;
		exit 1;;
esac

# Use curl to send the message to Slack
