extends Node2D



# Clicking Skills
var foraging = 0
var mining = 0
var farming = 0
var fishing = 0

# Fighting Game Skills
var combat = 0
var catacombs = 0

# Crafting Skills
var alchemy = 0
var carpentry = 0
var runecrafting = 0

# Misc Skills
var enchanting = 0
var luck = 0
var taming = 0
var social = 0

# Misc
var money = Big.new(0)
var rebirthPoints = 0
var superRebirthPoints = 0
var ultraRebirthPoints = 0
var strength = 0
var intelligence = 0
var defense = 0
var health = 0

# Skill Tools
var foragingTool = 1
var miningTool = 1
var farmingTool = 1
var fishingTool = 1

# Skill Toggles
var foragingToggle = false
var miningToggle = false
var farmingToggle = false
var fishingToggle = false

var enchantingToggle = false


# Bar Progresses
var foragingProgress = 0
var miningProgress = 0
var farmingProgress = 0
var fishingProgress = 0
var enchantingProgress = 0

# Money Bar Progresses
var MoneyforagingProgress = 0
var MoneyminingProgress = 0
var MoneyfarmingProgress = 0
var MoneyfishingProgress = 0

var MoneyforagingToggle = false
var MoneyminingToggle = false
var MoneyfarmingToggle = false
var MoneyfishingToggle = false

var MoneyforagingStacks = 1
var MoneyminingStacks = 1
var MoneyfarmingStacks = 1
var MoneyfishingStacks = 1

# Rebirth Upgrades
var foragingRebirthUpgrade = 0
var farmingRebirthUpgrade = 0
var fishingRebirthUpgrade = 0
var miningRebirthUpgrade = 0
var moneyRebirthUpgrade = 0
var skillRebirthUpgrade = 0
var enchantingRebirthUpgrade = 0


# Skill Upgrades
var foragingSkillUpgrade = 0
var farmingSkillUpgrade = 0
var fishingSkillUpgrade = 0
var miningSkillUpgrade = 0
var enchantingSkillUpgrade = 0


# Initialize JSON instance
var json = JSON.new()

func _ready() -> void:
	# Connect the application_exiting signal to your function
	get_tree().set_auto_accept_quit(false)
	# Configuration for SilentWolf
	SilentWolf.configure({
		"api_key": "mgDYwXWgoG4xucRkL4j0M3oDhs5l8SdQ35AcdJEH",
		"game_id": "SnailClicker",
		"log_level": 1
	})
	SilentWolf.configure_scores({
		"open_scene_on_close": "res://scene.tscn"
	})

	
	# Retrieve player data
	#var test = await SilentWolf.Players.get_player_data("TestingPlayer").sw_get_player_data_complete
	# Load data when the game starts
	#load_data()  
	#load_datapt2()

func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		print("Tried Closing")
		await save_datapt2()
		await get_tree().create_timer(0.5).timeout
		get_tree().quit() # default behavior

func save_datapt2() -> void:
	var data = {
			"foraging": foraging,
			"mining": mining,
			"farming": farming,
			"fishing": fishing,
			"combat": combat,
			"catacombs": catacombs,
			"alchemy": alchemy,
			"carpentry": carpentry,
			"runecrafting": runecrafting,
			"enchanting": enchanting,
			"taming": taming,
			"social": social,
			"money": money.toString(),
			"strength": strength,
			"intelligence": intelligence,
			"defense": defense,
			"health": health,
			"foragingTool": foragingTool,
			"miningTool": miningTool,
			"farmingTool": farmingTool,
			"fishingTool": fishingTool,
			"foragingToggle": foragingToggle,
			"miningToggle": miningToggle,
			"farmingToggle": farmingToggle,
			"fishingToggle": fishingToggle,
			"enchantingToggle" : enchantingToggle,
			"foragingProgress": foragingProgress,
			"miningProgress": miningProgress,
			"farmingProgress": farmingProgress,
			"fishingProgress": fishingProgress,
			"rebirthPoints": rebirthPoints,
			"foragingRebirthUpgrade": foragingRebirthUpgrade,
			"farmingRebirthUpgrade": farmingRebirthUpgrade,
			"fishingRebirthUpgrade": fishingRebirthUpgrade,
			"miningRebirthUpgrade": miningRebirthUpgrade,
			"foragingSkillUpgrade": foragingSkillUpgrade,
			"farmingSkillUpgrade": farmingSkillUpgrade,
			"fishingSkillUpgrade": fishingSkillUpgrade,
			"miningSkillUpgrade": miningSkillUpgrade,
			"moneyRebirthUpgrade": moneyRebirthUpgrade,
			"skillRebirthUpgrade": skillRebirthUpgrade,
			"superRebirthPoints": superRebirthPoints,
			"ultraRebirthPoints": ultraRebirthPoints,
			"luck": luck,
			"enchantingProgress": enchantingProgress,
			"enchantingRebirthUpgrade" : enchantingRebirthUpgrade,
			"enchantingSkillUpgrade" : enchantingSkillUpgrade
		}

	# Ensure save is completed before exiting
	await SilentWolf.Players.save_player_data(str(SilentWolf.Auth.logged_in_player), data)
	
	print("Player data saved")
func load_datapt2() -> void:
	print("Loading player data...")
	
	# Fetch player data from SilentWolf
	var result = await SilentWolf.Players.get_player_data(str(SilentWolf.Auth.logged_in_player)).sw_get_player_data_complete

	# Check if the data retrieval was successful
	if result.success:
		var data = result.player_data 

		# Assign the retrieved values to the respective variables
		foraging = data.get("foraging", 0)
		mining = data.get("mining", 0)
		farming = data.get("farming", 0)
		fishing = data.get("fishing", 0)
		combat = data.get("combat", 0)
		catacombs = data.get("catacombs", 0)
		alchemy = data.get("alchemy", 0)
		carpentry = data.get("carpentry", 0)
		runecrafting = data.get("runecrafting", 0)
		enchanting = data.get("enchanting", 0)
		taming = data.get("taming", 0)
		social = data.get("social", 0)
		money = Big.new(data.get("money", "0"))
		strength = data.get("strength", 0)
		intelligence = data.get("intelligence", 0)
		defense = data.get("defense", 0)
		health = data.get("health", 0)
		luck = data.get("luck", 0)

		foragingTool = data.get("foragingTool", 1)
		miningTool = data.get("miningTool", 1)
		farmingTool = data.get("farmingTool", 1)
		fishingTool = data.get("fishingTool", 1)

		foragingToggle = data.get("foragingToggle", false)
		miningToggle = data.get("miningToggle", false)
		farmingToggle = data.get("farmingToggle", false)
		fishingToggle = data.get("fishingToggle", false)

		foragingProgress = data.get("foragingProgress", 0)
		miningProgress = data.get("miningProgress", 0)
		farmingProgress = data.get("farmingProgress", 0)
		fishingProgress = data.get("fishingProgress", 0)

		rebirthPoints = data.get("rebirthPoints", 0)

		foragingRebirthUpgrade = data.get("foragingRebirthUpgrade", 0)
		farmingRebirthUpgrade = data.get("farmingRebirthUpgrade", 0)
		fishingRebirthUpgrade = data.get("fishingRebirthUpgrade", 0)
		miningRebirthUpgrade = data.get("miningRebirthUpgrade", 0)

		foragingSkillUpgrade = data.get("foragingSkillUpgrade", 0)
		farmingSkillUpgrade = data.get("farmingSkillUpgrade", 0)
		fishingSkillUpgrade = data.get("fishingSkillUpgrade", 0)
		miningSkillUpgrade = data.get("miningSkillUpgrade", 0)
		enchantingSkillUpgrade = data.get("enchantingSkillUpgrade", 0)

		moneyRebirthUpgrade = data.get("moneyRebirthUpgrade", 0)
		skillRebirthUpgrade = data.get("skillRebirthUpgrade", 0)

		superRebirthPoints = data.get("superRebirthPoints", 0)
		ultraRebirthPoints = data.get("ultraRebirthPoints", 0)
		
		enchantingProgress = data.get("enchantingProgress", 0)
		enchantingRebirthUpgrade = data.get("enchantingRebirthUpgrade", 0)
		enchantingToggle = data.get("enchantingToggle", false)

		print("Player data loaded successfully.")
	else:
		print("Failed to load player data: ", result.error_message)
