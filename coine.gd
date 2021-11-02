extends Area2D



func _on_hamond_body_entered(body):
	body.score += 1
	body.yeet.set_text("hp=" + str(body.health) + " score=" + str(body.score))
	queue_free()
