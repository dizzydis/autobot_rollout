void initAutobotPrefrefs(){
    print("Making sure Autobot Prefs are set!");
    string [string] pref_default_map;
   
    pref_default_map["autobot_mode"] = "aftercore";
    pref_default_map["autobot_rolled_out"] = false;
    pref_default_map["autobot_aftercore_destination"] = "The Oasis";
   
    foreach pref in pref_default_map {
        if ( get_property(pref) == "" ) {
            set_property(pref, pref_default_map[pref]);
        }
    }
}

boolean isAutobotRolledOut() {
    print("Checking to see if Autobot has already rolled out!");
    boolean isRolledOut = false;

    if ( item_amount( $item[autumn-aton] ) > 0 ) {
        #isRolledOut = false;
        set_property("autobot_rolled_out", false);
    }
    else {
        #isRolledOut = true;
        set_property("autobot_rolled_out", true);
    }

    return to_boolean(get_property("autobot_rolled_out"));
}

string getMode() {
    return to_string(get_property("autobot_mode"));
}

boolean getRolledOut() {
    return isAutobotRolledOut();
}

string getDest() {
    return to_string(get_property("autobot_aftercore_destination"));
}

void sendFallbot(string dest){
  print("AUTOBOT...ROLL OUT!");
  cli_execute("autumnaton send " + dest);
}

int nextExpeditionAdvCount() {

    #Check how many advs the next expedition will take
    int questsDone = to_int( get_property("_autumnatonQuests") );
    int normalizedQuestsDone = questsDone;
    string upgrades = to_string( get_property("autumnatonUpgrades") );
    string[int] upgradesMap = split_string(upgrades,",");
    int legUpgradesCount = 0;
    foreach i in upgradesMap {
        if (upgradesMap[i] == "leftleg1"){
            legUpgradesCount+=1;
        }
        if (upgradesMap[i] == "rightleg1"){
            legUpgradesCount+=1;
        }
    }
    questsDone -= legUpgradesCount;

    if (questsDone < 1) {
        normalizedQuestsDone = 1;
    }
    else {
        normalizedQuestsDone = questsDone;
    }

    return 11 * normalizedQuestsDone;
}

initAutobotPrefrefs();


# Are we in aftercore mode?
# This is the mode to set if you don't want to give any thought to managing the autobot. This is also the default mode.
# By default, this will send the autobot to The Oasis, so it assumes you're in aftercore.
# This mode is just trying to make sure the autobot is always out and about, expeditioning in a location of your preference 
#    It should:
#    - Send Autobot on an Expedition whenever he is available. (with notable exception on next bullet point)
#      - If the next expedition would take more adventures than we have left for the day + 11, don't send. 
#    - Send Autobot to our aftercore destination (autobot_aftercore_destination).. Aftercore mode assumes the user is farming 
#      something specific with autobot and wants it to always go to the specified destination. E.g. Mojo Filers from the Oasis.
#      - This can be updated at any time by updating the pref
#    
# Are we in normalcore mode?
# This mode is trying to use the autobot more strategically to help speed up an ascension.
#   It should:
#   - Prioritize acquiring upgrades
#     - Legs first to reduce expedition times
#   - Once upgrades have been acquired, check if there are any specific items that are still needed, and whose zone is available. 
#   - Otherwise, adventure in the chosen fallback location to make sure we're not wasting him. 
#     This location is a pref that can be set, will default to The Haunted Pantry, and if the chosen location *isn't* available yet,
#     will revert to a location that *is* available.  Probably one of the following:
#     - Haunted Pantry - AutumnFest Ale awesome booze
#     - The Daily Dungeon - Autumn Dollar
#     - The Spooky Forest - autumn leaf
#     - The Haunted Kitchen/Library - autumn-spice donut


#Do aftercore things if we're in aftercore mode
if ( getMode() == "aftercore" ) {
  # Check if autumnaton is available
  if ( ! isAutobotRolledOut() ) {
    int nextExpCount = nextExpeditionAdvCount();
    int remainingAdvs = my_adventures();

    if ( nextExpCount < (remainingAdvs + 11) {
      sendFallbot(to_string(get_property("autobot_aftercore_destination")));
    }
  }
}


boolean autobotNeedsNextUpgrade() {
  #TODO.. actually make this check upgrades at some point
  return false;
}

void embarkForNextUpgrade(){
  #Defining this so it won't error
  print("This doesn't do anything right now... double check Autobot goes somewhere!...also how did we get here?);
}


#Do normalcore things if we're in normalcore mode
#We're checking this here before checking if autobot is rolled out in case we want to make a strategic choice NOT to send autumnaton..
#  I'm not sure if this is a real case.. but just in case
if ( getMode() == "normalcore" ) {

  # Do we need an upgrade?
  if ( autobotNeedsNextUpgrade() ) {
    embarkForNextUpgrade();
  }
  #At some point we'll add checks to get specific things.. for now.. *oof* 
  else if ( false ) {
    print("Todo...");
  }
  #Otherwise.. use a fallback zone
  else {
    sendFallbot("The Haunted Pantry");
  }
  
}

