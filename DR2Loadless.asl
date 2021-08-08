state("deadrising2")
{
  bool IsLoading: 0x9DC3F0, 0x38, 0x1C8;
  bool IsCutsceneRunning : 0x9E5C5C, 0xB08, 0x9F8, 0x20;
  string3 CutsceneId : 0x9CB0FC, 0x58, 0x37;
  int ZombiesKilled : 0x9DE9A8, 0x8, 0x38;
}

startup 
{
    // Settings tree
    settings.Add("splits", true, "All Splits");

        settings.Add("72Hour", true, "72 Hour Splits", "splits");
            
            settings.Add("prologue", false, "Prologue Splits", "72Hour");
                settings.Add("chuckVictory", false, "Chuck Victory", "prologue");
                settings.Add("elevator1", false, "Elevator Twins", "prologue");
                settings.Add("chuckRescueKatey", false, "Chuck Rescue Katey", "prologue");
                settings.Add("exitTheStadium", false, "Chuck Rescue Katey", "prologue");

            settings.Add("zombrex1", false, "Zombrex 1 Splits", "72Hour");
                settings.Add("anotherWay1", false, "Another Way", "zombrex1");
                settings.Add("sullivan", false, "Back To Safe House Way", "zombrex1");
                settings.Add("giveKateyZombrex1", false, "Give Katey Zombrex 1", "zombrex1");

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
        {"006",  "chuckVictory"},
        {"009",  "elevator1"},
        {"012",  "chuckRescueKatey"},
        {"013",  "exitTheStadium"},
        {"017",  "anotherWay1"},
        {"021",  "sullivan"},
        {"023",  "giveKateyZombrex1"}
    };
}

update 
{

}

start 
{
    return old.CutsceneId == "001" && current.CutsceneId != "001";
}

reset 
{
    return old.CutsceneId != "001" && current.CutsceneId == "001";
}

isLoading
{
    return current.IsLoading || current.IsCutsceneRunning;
}

split
{
    // 72 Hours

    if (vars.Cutscenes.ContainsKey(current.CutsceneId) && !vars.Splits.Contains(vars.Cutscenes[current.CutsceneId]))
    {
        vars.Splits.Add(vars.Cutscenes[current.CutsceneId]);

        print(current.CutsceneId);

        return settings[vars.Cutscenes[current.CutsceneId]];
    }


    // Zombie Genocide Master
    if (current.ZombiesKilled != old.ZombiesKilled)
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