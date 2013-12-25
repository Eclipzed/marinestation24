/obj/item/projectile/bullet //50-cal rounds
	name = "bullet"
	icon_state = "bullet"
	damage = 60
	stun = 35
	weaken = 25
	damage_type = BRUTE
	nodamage = 0
	flag = "bullet"
	embed = 1

	on_hit(var/atom/target, var/blocked = 0)
		if (..(target, blocked))
			var/mob/living/L = target
			shake_camera(L, 3, 2)

/obj/item/projectile/bullet/weakbullet // "rubber" bullets
	damage = 10
	stun = 5
	weaken = 5
	embed = 0


/obj/item/projectile/bullet/midbullet // Small Arms e.g. 9mm
	damage = 25
	stun = 5
	weaken = 5

/obj/item/projectile/bullet/midbullet2 // Small arms e.g. 357/45
	damage = 35
	stun = 10
	weaken = 10

/obj/item/projectile/bullet/suffocationbullet//How does this even work?
	name = "co bullet"
	damage = 35
	stun = 0
	weaken = 0
	damage_type = OXY


/obj/item/projectile/bullet/cyanideround
	name = "poison bullet"
	damage = 35
	stun = 0
	weaken = 0
	damage_type = TOX


/obj/item/projectile/bullet/burstbullet//I think this one needs something for the on hit
	name = "exploding bullet"
	damage = 20
	stun = 0
	weaken = 0


/obj/item/projectile/bullet/stunshot
	name = "stunshot"
	damage = 5
	stun = 25
	weaken = 25
	stutter = 15
	embed = 0

/obj/item/projectile/bullet/a762 // Rifle Rounds and the like
	damage = 45
	stun = 25
	weaken = 15