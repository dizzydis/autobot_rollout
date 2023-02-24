void initAutobotPrefrefs(){
    string [string] pref_default_map;
   
    pref_default_map["autobot_mode"] = "aftercore";
    pref_default_map["autobot_rolled_out"] = false;
    pref_default_map["autobot_exp_destination"] = "The Oasis";
   
    foreach pref in pref_default_map {
        if ( get_property(pref) == "" ) {
            set_property(pref, pref_default_map[pref]);
        }
    }
}

boolean isAutobotRolledOut() {
    boolean isRolledOut = false;

    if ( item_amount( $item[autumn-aton] ) > 0 ) {
        isRolledOut = false;
    }
    else {
        isRolledOut = true;
    }

    return isRolledOut;
}

initAutobotPrefrefs();

# Check if autumnaton is available
if ( isAutobotRolledOut() ) {

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

    int nextExpCount = 11 * normalizedQuestsDone;
    int remainingAdvs = my_adventures();

    if ( nextExpCount < remainingAdvs ) {
        cli_execute("autumnaton send" + get_property("autobot_exp_destination"));
    }

}
