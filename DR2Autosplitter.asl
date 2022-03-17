// Version 1.0.0.0
state("deadrising2")
{
  bool IsLoading: 0x9DC3F0, 0x38, 0x1C8;
  bool IsCutsceneRunning : 0x9E5C5C, 0xB08, 0x9F8, 0x20;
  string4 CutsceneId : 0x9CB0FC, 0x58, 0x37;

  int InGameTime : 0xA11604, 0xA38, 0x2B94;
  int ZombiesKilled : 0x9DE9A8, 0x8, 0x38;
  int PlayerLevel : 0x9DE9A8, 0x8, 0x20;
  int Zombrex : 0xA11604, 0xA2C, 0x61C, 0x12D0, 0x1F0, 0x116C, 0x868, 0xC;

  int RoomId : 0x9E5C50, 0x2318, 0x54, 0x9C0;
}

startup 
{
    // Settings tree
    settings.Add("splits", true, "All Splits");

    // 72 Hours
        settings.Add("72Hour", true, "72 Hours Splits", "splits");
            
            settings.Add("prologue", false, "Prologue Splits", "72Hour");
                settings.Add("pro_TIRVictory", false, "TIR Victory", "prologue");
                settings.Add("pro_LockerRoomElevator", false, "Locker Room Elevator", "prologue");
                settings.Add("pro_RescueKatey", false, "Rescuing Katey", "prologue");
                settings.Add("pro_ExitArena", false, "Exit Arena", "prologue");

            settings.Add("zombrex1", false, "Zombrex 1 Splits", "72Hour");
                settings.Add("zo1_AirDuct", false, "Air Duct", "zombrex1");
                settings.Add("zo1_Looters", false, "Looters", "zombrex1");
                settings.Add("zo1_Sullivan", false, "Safehouse", "zombrex1");
                settings.Add("zo1_Katey", false, "Katey", "zombrex1");

            settings.Add("case1", false, "Case 1 Splits", "72Hour");
                settings.Add("c11_Framed", false, "Case 1-1", "case1");

                settings.Add("c12_Rebecca", false, "Case 1-2", "case1");

                settings.Add("c13", false, "Case 1-3 Splits", "case1");
                    settings.Add("c13_Gate", false, "Opening The Gate", "c13");
                    settings.Add("c13_Security", false, "Case 1-3", "c13");

                settings.Add("c14_Alliance", false, "Case 1-4", "case1");

            settings.Add("case2", false, "Case 2 Splits", "72Hour");
                settings.Add("c21_StaceySeesSomething", false, "Case 2-1", "case2");
                settings.Add("c22_SnowflackeBattle", false, "Snowflake Intro Battle", "case2");
                settings.Add("c22_TrainDock", false, "Train Platform", "case2");
                settings.Add("c22_TrainBattle", false, "Train Battle", "case2");
                settings.Add("c22_OnBoard", false, "Chuck on Board", "case2");
                settings.Add("c22_TrainDefeated", false, "Case 2-2", "case2");
            
            settings.Add("zombrex2", false, "Zombrex 2", "72Hour");

            settings.Add("case3", false, "Case 3 Splits", "72Hour");
                settings.Add("case3-1", false, "Case 3-1", "case3");
                    settings.Add("c31_explosion", false, "Explosion", "case3-1");
                    settings.Add("c31_queenWasps", false, "Queen Wasps", "case3-1");

                settings.Add("c32_Thwarted", false, "Case 3-2", "case3");

            settings.Add("case4", false, "Case 4 Splits", "72Hour");
                settings.Add("c41_twinsBossIntro", false, "Twins Battle Intro", "case4");
                settings.Add("c41_AmbersDeath", false, " Case 4-1 Amber's Death", "case4");
                settings.Add("c41_CrystalsDeath", false, "Case 4-1 Crystal's Death", "case4");

            settings.Add("zombrex3", false, "Zombrex 3", "72Hour");

            settings.Add("case5", false, "Case 5 Splits", "72Hour");
                settings.Add("c51_Gateway", false, "Case 5-1", "case5");
                    
                settings.Add("case52", false, "Case 5-2", "case5"); 
                    settings.Add("c52_Militiamen", false, "Militia Men Intro", "case52");
                    settings.Add("c52_HelicopterIntro", false, "Helicopter Battle Intro", "case52");
                    settings.Add("c52_HelicopterDeath", false, "Helicopter Battle End", "case52");
                    settings.Add("c52_TkSafehouse", false, "Case 5-2", "case52");

            settings.Add("zombrex4", false, "Zombrex 4", "72Hour");

            settings.Add("case6", false, "Case 6 Splits", "72Hour");
                settings.Add("c61_all_hell", false, "Case 6-1", "case6");

                settings.Add("case62", false, "Case 6-2", "case6");
                    settings.Add("c62_Baykin_Intro", false, "Sgt Baykin Intro", "case62");
                     settings.Add("c62_Baykin_Death", false, "Sgt Baykin Death", "case62");

                settings.Add("c63_Safehouse_Overrun", false, "Case 6-3", "case6");

                settings.Add("c64_What_Happened", false, "Case 6-4", "case6");

            settings.Add("case7", false, "Case 7 Splits", "72Hour");
                settings.Add("c71_Bigger_than_TK", false, "Case 7-1", "case7");

                settings.Add("case72", false, "Case 7-2", "case7");
                    settings.Add("c72_Sewers", false, "Enter the Sewers", "case72");
                    settings.Add("c72_Queens_Exit", false, "Case 7-2", "case72");

                settings.Add("c73_Facts", false, "Case 7-3", "case7");

            settings.Add("facts", false, "THE FACTS", "72Hour");
                settings.Add("fac_Battle_Start", false, "Sullivan Battle Start", "facts");
                settings.Add("fac_Battle_End", false, "Sullivan Battle End", "facts");

            settings.Add("endings", false, "ENDING A Splits", "72Hour");
                settings.Add("ending_a", false, "ENDING A for timeskip", "endings");
                settings.Add("ending_b", false, "ENDING A for timeskip", "endings");

    // Max Level
        settings.Add("maxLevel", false, "Max Level", "splits");
            for (int level = 5; level <= 50; level += 5)
            {
                settings.Add("level" + level.ToString(), false, "Level " + level.ToString(), "maxLevel");
            }

    // Zombie Genocide Master
        settings.Add("zombieGenocider", false, "Zombie Genocide Master", "splits");
            vars.GenociderKills = new List<int> {2500, 5000, 7500, 10000, 10719, 12500, 15000, 17500, 20000, 21438, 22500, 25000, 27500, 30000, 32157, 32500, 35000, 37500, 40000, 42500, 42876, 45000, 47500, 50000, 52500, 53594};
            foreach(int count in vars.GenociderKills)
            {
                settings.Add("kills" + count.ToString(), false, String.Format("{0:n0}", count) + " kills", "zombieGenocider");
            };
}

init
{
    // Keep track of hit splits 
    vars.Splits = new HashSet<string>();

    vars.Cutscenes = new Dictionary<string, string>
    {
        {"006_",  "pro_TIRVictory"},
        {"009_",  "pro_LockerRoomElevator"},
        {"012_",  "pro_RescueKatey"},
        {"013_",  "pro_ExitArena"},
        {"017_",  "zo1_AirDuct"},
        {"020_",  "zo1_Looters"},
        {"021_",  "zo1_Sullivan"},
        {"023_",  "zo1_Katey"},
        {"024_",  "c11_Framed"},
        {"025_",  "c12_Rebecca"},
        {"025a",  "c13_Gate"},
        {"026_",  "c13_Security"},
        {"028_",  "c14_Alliance"},
        {"029_",  "c21_StaceySeesSomething"},
        {"030_",  "c22_TrainDock"},
        {"031_",  "c22_TrainBattle"},
        {"032_",  "c22_OnBoard"},
        {"033_",  "c22_TrainDefeated"},
        {"034_",  "zombrex2"},
        {"035_",  "c31_queenWasps"},
        {"036_",  "c31_explosion"},
        {"037_",  "c32_Thwarted"},
        {"039_",  "c41_twinsBossIntro"},
        {"041_",  "c41_CrystalsDeath"},
        {"041a",  "c41_AmbersDeath"},
        {"042_",  "zombrex3"},
        {"043_",  "c51_Gateway"},
        {"045_",  "c52_HelicopterIntro"},
        {"046_",  "c52_HelicopterDeath"},
        {"048a",  "c52_TkSafehouse"},
        {"049_",  "zombrex4"},
        {"051_",  "c61_all_hell"},
        {"052_",  "c62_Baykin_Intro"},
        {"053_",  "c62_Baykin_Death"},
        {"054a",  "c63_Safehouse_Overrun"},
        {"055a",  "c64_What_Happened"},
        {"057_",  "c71_Bigger_than_TK"},
        {"057a",  "c72_Sewers"},
        {"059_",  "c72_Queens_Exit"},
        {"060_",  "c73_Facts"},
        {"060a",  "fac_Battle_Start"},
        {"062_",  "fac_Battle_End"},
        {"066_",  "ot_TK_Intro"},
        {"067_",  "ot_TK_Death"},
        {"070_",  "ending_b"},
        {"077_",  "psy_Chef_Antoine"},
        {"079_",  "psy_Leon_Bell"},
        {"081_",  "psy_Randy_Virgin"},
        {"083_",  "psy_Bibi_Love_1"},
        {"083a",  "psy_Bibi_Love_2"},
        {"085_",  "psy_Reed_Roger"},
        {"086_",  "psy_Slappy"},
        {"088_",  "c52_Militiamen"},
        {"090_",  "psy_Carl_Mailman"},
        {"092_",  "psy_Brandon_Cure"},
        {"094_",  "psy_Security_Gard"},
        {"095_",  "c22_SnowflackeBattle"},
        {"095a",  "psy_Ted_Death"},
        {"096_",  "psy_Snowflacke_Joins"}
    };

    vars.Rooms = new Dictionary<int, string>
    {
        {67,   "PAM"},  // Palissade Mall
        {87,   "SAF"},  // Safehouse
        {114,  "FCA"},  // Fortune City Arena
        {138,  "FCE"},  // Fortune City Exterior
        {148,  "RFP"},  // Royal Flush Plaza
        {190,  "SRC"},  // Slot Ranch Casion
        {208,  "FCH"},  // Fortune City Hotel
        {220,  "YUC"},  // Yucatan Casino
    };

    vars.CurrentRoomId = 0;
}

update 
{

}

start 
{
    return old.CutsceneId == "003_" && current.CutsceneId != "003_";
}

reset 
{
    return old.CutsceneId != "001_" && current.CutsceneId == "001_";
}

isLoading
{
    return current.IsLoading || current.IsCutsceneRunning;
}

split
{
    // Cutscene Split
    if (vars.Cutscenes.ContainsKey(current.CutsceneId) && !vars.Splits.Contains(vars.Cutscenes[current.CutsceneId]))
    {
        vars.Splits.Add(vars.Cutscenes[current.CutsceneId]);
        return settings[vars.Cutscenes[current.CutsceneId]];
    }

    // Max Level
    if (settings["maxLevel"] && current.PlayerLevel != old.PlayerLevel)
    {
        return settings["level" + current.PlayerLevel.ToString()];
    }

    // Zombie Genocide Master
    if (settings["zombieGenocider"] && current.ZombiesKilled != old.ZombiesKilled)
    {
        foreach(int count in vars.GenociderKills)
        {
            if (old.ZombiesKilled < count && count <= current.ZombiesKilled)
            {
                return settings["kills" + count.ToString()];
            }
        }
    }
}