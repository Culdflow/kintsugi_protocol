extends interractableObject
class_name limbRemover

enum limbs
{
	LEFT_LEG, RIGHT_LEG, LEFT_ARM, RIGHT_ARM
}

@export var limb_asked: limbs
var limb_accepted: BodyPart

func _interract(player: Player_sc):
	if limb_asked == limbs.LEFT_LEG:
		limb_accepted = player.leftLeg
	if (limb_asked == limbs.RIGHT_LEG):
		limb_accepted = player.rightLeg
	if (limb_asked == limbs.LEFT_ARM):
		limb_accepted = player.leftArm
	if (limb_asked == limbs.RIGHT_ARM):
		limb_accepted = player.rightArm
	if (limb_accepted == null):
		print("you do not have this limb")
	else:
		player._lose_limb(limb_accepted)
