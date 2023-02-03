# Αuto Daily Slack Report (Slacker)
A shell script that sends daily Git commit reports to a Slack channel, and more...

## Usage
The script can be executed by running 
```bash
chmod +x ./auto-daily-slack-report.sh #give it execute permissions
./auto-daily-slack-report.sh [OPTIONS] [FOLDER_NAME].
```
---

## Options:
- `blank`: If you don't give any parameters to the script it will output all the project folders that you have made a commit today. 
- `-m, --message`: add an extra message to be included in the end of the commit report.
- `-l, --list`: display the available projects and exit (Helper option).
- `Folder Name`: The script requires the name of the Git project folder as an argument. The folder should be located in the ~/Code/ directory.

---

## Configuration

Before running the script, you need to set the following environment variables:

`GIT_USERNAME`: your Git username.
`SLACK_HOOK_URL`: the URL for the Slack incoming webhook.
`CODE_DIR`: your directory pointing to all project folders. (e.g. ~/Code)

These environment variables can be set in a config.sh file located in the same directory as the script.

## Output
The script outputs the commits for the specified project folder, grouped by author and project name. If the `-m or --message` option is used, the extra message is added to the end of the report.

The script will prompt the user to confirm if they want to proceed and send the message to Slack. If the user confirms, the message is sent to the Slack channel using a Slack incoming webhook.

## Example usage and results
```bash
auto-daily-slack-report ./auto-daily-slack-report.sh NSAsprscr3tpr0ject

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

Author: 1337Hax0r
Project: NSAsprscr3tpr0ject

Commits:
 - b7cc430 [feature] Add extra anti forensics automations 
 - ba234lq [hot-fix] Couldn't hear clearly through reverse-shell mics, fix of frequencies
 - dsa43gh [bug-fix] Fix data exposure vuln. about 911 attacks






Do you want to proceed and send the message to Slack? (yes/no) y
ok, check your slack
```

### 👀 More to come : 

- 💣 `--bomb` command: Will search for all the commits made today, and then send everything that it found! 
  - Saves the trouble of writing down one by one all the projects you've commited to today. 