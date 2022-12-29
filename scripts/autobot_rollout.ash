string fallbot_status = cli_execute_output("autumnaton");
# Check if autumnaton is available
if ( ! contains_text(fallbot_status,"will return after") ) {

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
    #print("We have autumnaton.");
    #print("We have used it "+to_string(questsDone)+" times.");
    #print("We have applied "+legUpgradesCount+" leg upgrades to the autumnaton.");
    #print("Next expedition will take "+to_string(nextExpCount)+" adventures");
    if ( nextExpCount < remainingAdvs ) {
        cli_execute("autumnaton send \"The Oasis\"");
    }

}
