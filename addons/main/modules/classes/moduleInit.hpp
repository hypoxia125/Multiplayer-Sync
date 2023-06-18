class MPSync_ModuleInit: Module_F
{
	scope = 2;
	displayName = "$STR_MPSync_Module_DisplayName";
	author = "Hypoxic";
	icon = "h\mpsync\main\data\mpsync-module-icon-128.paa";
	portrait = "h\mpsync\main\data\mpsync-module-icon-128.paa";
	category = "Multiplayer";

	function = "MPSync_fnc_moduleInit";
	functionPriority = 1;
	isGlobal = 1;
	isTriggerActivated = 0;
	isDisposable = 0;
	is3DEN = 0;
	curatorInfoType = "";

	class Attributes: AttributesBase
	{
		class MinPlayers: Edit
		{
			property = "MPSync_ModuleInit_MinPlayers";
			displayName = "$STR_MPSync_Module_MinPlayers_DisplayName";
			tooltip = "$STR_MPSync_Module_MinPlayers_Tooltip";
			typeName = "NUMBER";
			defaultValue = 1;
		};

		class Timeout: Edit
		{
			property = "MPSync_ModuleInit_Timeout";
			displayName = "$STR_MPSync_Module_Timeout_DisplayName";
			tooltip = "$STR_MPSync_Module_Timeout_Tooltip";
			typeName = "NUMBER";
			defaultValue = 60;
		};

		class ModuleDescription: ModuleDescription{};
	};

	class ModuleDescription: ModuleDescription
	{
		description = "$STR_MPSync_ModuleInit_ModuleDescription_Description";
		sync[] = {};
	};
};