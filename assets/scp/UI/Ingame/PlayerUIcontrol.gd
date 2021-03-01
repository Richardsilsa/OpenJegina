extends CanvasLayer

var life = int()
var maxlife = int()
var coins = int()

const lbar_show = "cornertab/cornerhit/lifebar/value"
const lbar_anm = "cornertab/cornerhit/Coins/anim"
const coin_val = "cornertab/cornerhit/Coins/Value"

func coinupdate():
	get_node(coin_val).text = str(coins)
	if coins < 0 :
		coins = 0
		print("coins < 0 ,fixing")
	if coins > 99 :
		lifeop(1)
		print("too many coins ,take one life")

func coinsop(vl):
	coins += vl

func updatelife():
	if maxlife > 8 :
		maxlife = 8
	if life > 8 :
		life = 8
	get_node(lbar_show).play(str(maxlife))
	get_node(lbar_anm).play(str(life))
	if life > maxlife :
		life = maxlife
		print("life > max ,fixing")
	if life <= 0 :
		life = 0
		get_parent().die()
	if maxlife > 8 :
		maxlife = 8
		print("life > 8 ,fixing")
	if maxlife <= 0 :
		maxlife = 1
		print("maxlife <= 0 ,fixing")

#make an operation with life
func lifeop(op):
	life += op
	updatelife()

#force life into an value
func lifeforce(vl):
	life = vl
	updatelife()

#make an operation with maxlife
func maxlifeop(op):
	maxlife += op
	updatelife()

#force maxlife into an value
func maxlifeforce(vl):
	maxlife = vl
	updatelife()
