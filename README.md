# **autobot_rollout**
Manage sending the Autumn-aton to a place of your choice!

# **Installation**
`git checkout https://github.com/dizzydis/autobot_rollout main`

## **Important Note:**
A recent change put the script into its own subdirectory for better organization and segregation from other Mafia scripts.

As such, doing a `git update` may not remove the old version of the script. If not, it is safe to be deleted.
Also, since Autobot Rollout doesn't manage any Mafia Automation Settings - if you don't update the Pre-Adventure setting, and the old version of the script (the one that **isn't** in its own subdirectory) hasn't been removed, then doing a git update will never result in you running any changes that have been implemented since the script move.

To fix this, just make sure you update the Pre-Adventure setting to whatever is listed in this guide.
Cleaning up the old script isn't necessary, but may be preferrable to keep a clean UI in Mafia.

# **Config**
The script checks if the autumn-aton is available in the inventory.  
If so, it checks to see how many turns the next expedition will require.  
If the amount of current available turns exceeds the amount of turns for the next expedition, it will send the autumn-aton.

## **Prefs**

### Watching your Autobot Settings in the Mafia UI
`set watchedPreferences = "autobot_mode,autobot_rolled_out,autobot_exp_destination"`

### **autobot_mode**
The `autobot_mode` setting controls whether the Autobot things you're in Aftercore or not.   
Currently this is set to Aftercore and is not used. But eventually will allow you to customize the behavior of the Autobot.  

#### - Aftercore  
This is the default setting for `autobot_mode`.  
Eventually will control how the Autobot behaves - e.g. Going on expeditions to `autobot_exp_destination` whenever possible.  

If you have been using Autobot Rollout prior to this update, this mode will be what you are used to.

### **autobot_exp_destination**
The `autobot_exp_destination` setting controls where the Autobot adventures.
Eventually this might only apply to certain situations (such as if the `autobot_mode` is set to `aftercore`).

To change this, enter the following in the Mafia gCLI:
`set autobot_exp_destination = <destination>`

To see a list of possible options, enter the following in the Mafia gCLI:
`autumnaton locations`

### **autobot_rolled_out**
The `autobot_rolled_out` setting is used internally by the script to know whether or not the Autobot is available to go on an expedition.

You should not need to do anything with this setting.

## **Location**
In its current form, the script will send the Autumn-aton to The Oasis.  
This is controlled by the pref `autobot_exp_destination` whose default value is `The Oasis`.  
See above for information on how to change this.

## **Automation Trigger**
Update the setting in Mafia:  
`General -> Preferences -> Automation -> Pre-Adventure`  
To reference the newly installed script `scripts\autobot_rollout\autobot_rollout.ash`  

With this setting enabled, the script will trigger before each adventure when using the automated Mafia adventure option.

## **Manual Adventuring Trigger**
Update the following setting in Mafia to be enabled/checked:  
`General -> Preferences -> Look & Feel -> Relay Browser -> Run betweenBattleScript before manual adventures`  

With this setting enabled, the Pre-Adventure script will now also trigger when manually adventuring using the Relay Browser.

## **Potential Problems**
If Mafia thinks that your Autumn-aton is out on an Expedition, but you still have the Autumn-aton in your inventory, the script will never actually send the Autumn-aton.

To fix this, you can try running the following command in the Mafia gCLI:  
`set autumnatonQuestLocation =`  
to reset the Autumn-aton's quest location.

**Note:** This might actually no longer be a problem based on a recent change to how Autobot Rollout determine the availability of the autumnaton. Will need to do testing to find out.