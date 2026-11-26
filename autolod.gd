extends Node

const plzwork = "user://items.wav"

var config = ConfigFile.new()

var init_data = {
	"skip_cutscen": 0
}

var itens = {
	"_hidden": 0,
	"water_bottel": 0,
	"glock_19": 0,
	"_placeholder": 0
}
func save_game():
	for key in init_data:
		config.set_value("init", key, init_data[key])
		
	for key in itens:
		config.set_value("items", key, itens[key])
	var err = config.save(plzwork)
	if err == OK:
		_comentario_foda()
		print("saved @ %s" % ProjectSettings.globalize_path(plzwork))
	else:
		print("error. @compiling.me on slack for fixing it. error log: %s" % err)
	
func load_game():
	var err = config.load(plzwork)
	if err != OK:
		save_game()
		return
	
	for key in init_data:
		init_data[key] = config.get_value("init", key, init_data[key])
	for key in itens:
		itens[key] = config.get_value("items", key, itens[key])

#por aq chega ne
# ah sim, easter ovos
func _comentario_foda():
	pass
		
