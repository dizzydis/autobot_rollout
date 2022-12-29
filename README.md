# autobot_rollout
Manage sending the Autumn-aton to a place of your choice!

# Installation
`git checkout https://github.com/dizzydis/autobot_rollout main`

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
To reference the newly installed script `scripts/autobot_rollout.ash`  

With this setting enabled, the script will trigger before each adventure when using the automated Mafia adventure option.

## Manual Adventuring Trigger
Update the following setting in Mafia to be enabled/checked:  
`General -> Preferences -> Look & Feel -> Relay Browser -> Run betweenBattleScript before manual adventures`  

With this setting enabled, the Pre-Adventure script will now also trigger when manually adventuring using the Relay Browser.
