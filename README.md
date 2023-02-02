# auto-daily-slack-report
Automates the process of writing a daily report at the end of the day and sending it to slack. 

# Αuto Daily Slack Report (Slacker)
A shell script that sends daily Git commit reports to a Slack channel.

## Usage
The script can be executed by running 
```bash
    ./auto-daily-slack-report.sh [OPTIONS] [FOLDER_NAME].
```
---

## Options:

- `-m, --message`: add an extra message to be included in the end of the commit report.
- `-l, --list`: display the available projects and exit (Helper option).
- `Folder Name`: The script requires the name of the Git project folder as an argument. The folder should be located in the ~/Code/ directory.

---

## Configuration

Before running the script, you need to set the following environment variables:

`GIT_USERNAME`: your Git username.
`SLACK_HOOK_URL`: the URL for the Slack incoming webhook.

These environment variables can be set in a config.sh file located in the same directory as the script.

## Output
The script outputs the commits for the specified project folder, grouped by author and project name. If the `-m or --message` option is used, the extra message is added to the end of the report.

The script will prompt the user to confirm if they want to proceed and send the message to Slack. If the user confirms, the message is sent to the Slack channel using a Slack incoming webhook.

## example usage and results
```bash
auto-daily-slack-report ./auto-daily-slack-report.sh smart-trade

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

Author: athanstan
Project: smart-trade

Commits:
 - b7cc430 [feature] Add Storage Datatable






Do you want to proceed and send the message to Slack? (yes/no) y
ok, check your slack
```