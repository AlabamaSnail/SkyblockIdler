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
var taming = 0
var social = 0

# Misc
var money = 1500
var rebirthPoints = 0
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


# Bar Progresses
var foragingProgress = 0
var miningProgress = 0
var farmingProgress = 0
var fishingProgress = 0

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

# Initialize JSON instance
var json = JSON.new()

func _ready() -> void:
	load_data()  # Load the data when the game starts

func _exit_tree() -> void:
	save_data()  # Save the data when the game is about to close

# Function to save skill data
func save_data() -> void:
	var file = FileAccess.open("user://skill_data.json", FileAccess.WRITE)
	if file:
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
			"money": money,
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
			"foragingProgress": foragingProgress,
			"miningProgress": miningProgress,
			"farmingProgress": farmingProgress,
			"fishingProgress": fishingProgress,
			"rebirthPoints": rebirthPoints,
		}
		file.store_string(json.stringify(data))  # Convert dictionary to JSON string
		file.close()

# Function to load skill data
func load_data() -> void:
	var file = FileAccess.open("user://skill_data.json", FileAccess.READ)
	if file:
		var data_string = file.get_as_text()
		var parse_result = json.parse(data_string)
		
		if parse_result == OK:  # Check if there was no error
			var json_data = json.get_data()  # Get the parsed JSON data
			foraging = json_data.get("foraging", 0)
			mining = json_data.get("mining", 0)
			farming = json_data.get("farming", 0)
			fishing = json_data.get("fishing", 0)
			combat = json_data.get("combat", 0)
			catacombs = json_data.get("catacombs", 0)
			alchemy = json_data.get("alchemy", 0)
			carpentry = json_data.get("carpentry", 0)
			runecrafting = json_data.get("runecrafting", 0)
			enchanting = json_data.get("enchanting", 0)
			taming = json_data.get("taming", 0)
			social = json_data.get("social", 0)
			money = json_data.get("money", 0)
			strength = json_data.get("strength", 0)
			intelligence = json_data.get("intelligence", 0)
			defense = json_data.get("defense", 0)
			health = json_data.get("health", 0)
			foragingTool = json_data.get("foragingTool", 1)
			miningTool = json_data.get("miningTool", 1)
			farmingTool = json_data.get("farmingTool", 1)
			fishingTool = json_data.get("fishingTool", 1)
			foragingToggle = json_data.get("foragingToggle", false)
			miningToggle = json_data.get("miningToggle", false)
			farmingToggle = json_data.get("farmingToggle", false)
			fishingToggle = json_data.get("fishingToggle", false)
			foragingProgress = json_data.get("foragingProgress", 0)
			miningProgress = json_data.get("miningProgress", 0)
			fishingProgress = json_data.get("fishingProgress", 0)
			farmingProgress = json_data.get("farmingProgress", 0)
			rebirthPoints = json_data.get("rebirthPoints", 0)
		else:
			print("Error parsing JSON: ", parse_result)  # Print any parsing errors
		file.close()
