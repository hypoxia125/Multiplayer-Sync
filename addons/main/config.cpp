class CfgPatches
{
    class MPSync
    {
        name = "MPSync";
        author = "Hypoxic";
        url = "";

        requiredVersion = 2.10;
        requiredAddons[] =
        {
            "A3_Functions_F"
        };
        units[] =
        {

        };
        weapons[] =
        {

        };
    };
};

class CfgFunctions
{
    class MPSync
    {
        class fnc
        {
            file = "h\MPSync\main\functions";
            class allPlayersSpawned {};
            class blankScreen {};
            class getPlayers {};
            class getRespawnConfig {};
            class getTotalSlots {};
            class init {};
            class initPlayer {};
            class initServer {};
            class notification {};
        };

        class modules
        {
            file = "h\MPSync\main\modules";
            class moduleInit {};
        };
    };
};

class CfgVehicles
{
    // Modules
    class Logic;
    class Module_F: Logic
    {
        class AttributesBase
        {
            class Default;
            class Edit;
            class Combo;
            class Checkbox;
            class CheckboxNumber;
            class ModuleDescription;
            class Units;
        };

        class ModuleDescription
        {
            class AnyBrain;
        };
    };

    #include "modules\classes\moduleInit.hpp"
};