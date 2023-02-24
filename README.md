# autobot_rollout
Manage sending the Autumn-aton to a place of your choice!

# Installation
`git checkout https://github.com/dizzydis/autobot_rollout main`

## Important Note:
A recent change put the script into its own subdirectory for better organization and segregation from other Mafia scripts.

As such, doing a `git update` may not remove the old version of the script. If not, it is safe to be deleted.
Also, since Autobot Rollout doesn't manage any Mafia Automation Settings - if you don't update the Pre-Adventure setting, and the old version of the script (the one that **isn't** in its own subdirectory) hasn't been removed, then doing a git update will never result in you running any changes that have been implemented since the script move.

To fix this, just make sure you update the Pre-Adventure setting to whatever is listed in this guide.
Cleaning up the old script isn't necessary, but may be preferrable to keep a clean UI in Mafia.

# Config
The script checks if the autumn-aton is available in the inventory.  
If so, it checks to see how many turns the next expedition will require.  
If the amount of current available turns exceeds the amount of turns for the next expedition, it will send the autumn-aton.

## Location
In its current form, the script will send the Autumn-aton to The Oasis.  
If a different location is desired, the script will need to be manually updated.  
I might get around to changing this later.  

## Automation Trigger
Update the setting in Mafia:  
`General -> Preferences -> Automation -> Pre-Adventure`  
To reference the newly installed script `scripts\autobot_rollout\autobot_rollout.ash`  

With this setting enabled, the script will trigger before each adventure when using the automated Mafia adventure option.

## Manual Adventuring Trigger
Update the following setting in Mafia to be enabled/checked:  
`General -> Preferences -> Look & Feel -> Relay Browser -> Run betweenBattleScript before manual adventures`  

With this setting enabled, the Pre-Adventure script will now also trigger when manually adventuring using the Relay Browser.

## Potential Problems
If Mafia thinks that your Autumn-aton is out on an Expedition, but you still have the Autumn-aton in your inventory, the script will never actually send the Autumn-aton.

To fix this, you can try running the following command in the Mafia gCLI:  
`set autumnatonQuestLocation =`  
to reset the Autumn-aton's quest location.
