/datum/job/hos
	title = "Head of Security"
	flag = HOS
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the captain"
	selection_color = "#ffdddd"
	idtype = /obj/item/weapon/card/id/silver
	req_admin_notify = 1
	access = list(access_security, access_sec_doors, access_brig, access_armory, access_court,
			            access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
			            access_research, access_engine, access_mining, access_medical, access_construction, access_mailsorting,
			            access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_armory, access_court,
			            access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
			            access_research, access_engine, access_mining, access_medical, access_construction, access_mailsorting,
			            access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway)
	minimal_player_age = 14

	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		switch(H.backbag)
			if(2) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/security(H), slot_back)
			if(3) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel_sec(H), slot_back)
			if(4) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
		H.equip_to_slot_or_del(new /obj/item/device/radio/headset/heads/hos(H), slot_l_ear)
//		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/head_of_security(H), slot_w_uniform)
//		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)
//		H.equip_to_slot_or_del(new /obj/item/clothing/gloves/black(H), slot_gloves)
//		H.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(H), slot_wear_mask) //Grab one from the armory you donk
//		H.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/sechud(H), slot_glasses)
		H.equip_to_slot_or_del(new /obj/item/weapon/gun/energy/gun(H), slot_s_store)
		if(H.species.name == "Vox")
			if(H.backbag == 1)
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/vox(H), slot_r_hand)
				H.equip_to_slot_or_del(new /obj/item/weapon/handcuffs(H), slot_l_store)
			else
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/vox(H.back), slot_in_backpack)
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/handcuffs(H.back), slot_in_backpack)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/vox/vox_uniform/sec(H), slot_w_uniform)
			H.equip_to_slot_or_del(new /obj/item/clothing/shoes/magboots/vox(H), slot_shoes)
			H.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/sechud/vox(H), slot_glasses)
			H.equip_to_slot_or_del(new /obj/item/clothing/gloves/black/vox(H), slot_gloves)
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/space/vox/carapace(H.back), slot_in_backpack)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/space/vox/carapace(H.back), slot_in_backpack)
			H.equip_to_slot_or_del(new /obj/item/weapon/tank/nitrogen(H.back), slot_in_backpack)
		else
			H.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/sechud(H), slot_glasses)
			H.equip_to_slot_or_del(new /obj/item/clothing/gloves/black(H), slot_gloves)
			H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/head_of_security(H), slot_w_uniform)
			if(H.backbag == 1)
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H), slot_r_hand)
				H.equip_to_slot_or_del(new /obj/item/weapon/handcuffs(H), slot_l_hand)
			else
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H.back), slot_in_backpack)
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/handcuffs(H.back), slot_in_backpack)
		H.equip_to_slot_or_del(new /obj/item/device/pda/heads/hos(H), slot_belt)
		var/obj/item/weapon/implant/loyalty/L = new/obj/item/weapon/implant/loyalty(H)
		L.imp_in = H
		L.implanted = 1
		H << "As the Head of Security, you are the proud owner of a Loyalty implant. Read more about them <a href=http://http://baystation12.net/wiki/index.php?title=Security_Items#Loyalty_Implant>here</a>"
		var/datum/organ/external/affected = H.organs_by_name["head"]
		affected.implants += L
		L.part = affected
		return 1



/datum/job/warden
	title = "Warden"
	flag = WARDEN
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of security"
	selection_color = "#ffeeee"
	access = list(access_security, access_sec_doors, access_brig, access_armory, access_court, access_maint_tunnels, access_morgue)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_armory, access_court, access_maint_tunnels)
	minimal_player_age = 5

	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_sec(H), slot_l_ear)
		switch(H.backbag)
			if(2) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/security(H), slot_back)
			if(3) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel_sec(H), slot_back)
			if(4) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
//		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/warden(H), slot_w_uniform)
//		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)
//		H.equip_to_slot_or_del(new /obj/item/clothing/gloves/black(H), slot_gloves)
//		H.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/sechud(H), slot_glasses)
//		H.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(H), slot_wear_mask) //Grab one from the armory you donk
		if(H.species.name == "Vox")
			if(H.backbag == 1)
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/vox(H), slot_r_hand)
				H.equip_to_slot_or_del(new /obj/item/weapon/handcuffs(H), slot_l_store)
			else
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/vox(H.back), slot_in_backpack)
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/handcuffs(H.back), slot_in_backpack)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/vox/vox_uniform/sec(H), slot_w_uniform)
			H.equip_to_slot_or_del(new /obj/item/clothing/shoes/magboots/vox(H), slot_shoes)
			H.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/sechud/vox(H), slot_glasses)
			H.equip_to_slot_or_del(new /obj/item/clothing/gloves/black/vox(H), slot_gloves)
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/space/vox/carapace(H.back), slot_in_backpack)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/space/vox/carapace(H.back), slot_in_backpack)
			H.equip_to_slot_or_del(new /obj/item/weapon/tank/nitrogen(H.back), slot_in_backpack)
		else
			H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/warden(H), slot_w_uniform)
			H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)
			H.equip_to_slot_or_del(new /obj/item/clothing/gloves/black(H), slot_gloves)
			H.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/sechud(H), slot_glasses)
		if(H.backbag == 1)
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H), slot_r_hand)
			H.equip_to_slot_or_del(new /obj/item/weapon/handcuffs(H), slot_l_hand)
		else
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H.back), slot_in_backpack)
			H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/handcuffs(H.back), slot_in_backpack)
		H.equip_to_slot_or_del(new /obj/item/device/flash(H), slot_l_store)
		H.equip_to_slot_or_del(new /obj/item/device/pda/warden(H), slot_belt)
		return 1



/datum/job/detective
	title = "Detective"
	flag = DETECTIVE
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of security"
	selection_color = "#ffeeee"
	alt_titles = list("Forensic Technician")

	access = list(access_security, access_sec_doors, access_forensics_lockers, access_morgue, access_maint_tunnels, access_court)
	minimal_access = list(access_security, access_sec_doors, access_forensics_lockers, access_morgue, access_maint_tunnels, access_court)
	alt_titles = list("Forensic Technician")
	minimal_player_age = 3
	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_sec(H), slot_l_ear)
		switch(H.backbag)
			if(2) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack(H), slot_back)
			if(3) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel_norm(H), slot_back)
			if(4) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
//		H.equip_to_slot_or_del(new /obj/item/clothing/under/det(H), slot_w_uniform)
//		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/brown(H), slot_shoes)
/*		var/obj/item/clothing/mask/cigarette/CIG = new /obj/item/clothing/mask/cigarette(H)
		CIG.light("")
		H.equip_to_slot_or_del(CIG, slot_wear_mask)	*/
//		H.equip_to_slot_or_del(new /obj/item/clothing/gloves/black(H), slot_gloves)
		if(H.species.name == "Vox")
			if(H.backbag == 1)
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/vox(H), slot_r_hand)
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/evidence(H), slot_l_hand)
			else
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/vox(H.back), slot_in_backpack)
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/evidence(H.back), slot_in_backpack)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/vox/vox_uniform/sec(H), slot_w_uniform)
			H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sandal/vox(H), slot_shoes)
			H.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/sechud/vox(H), slot_glasses)
			H.equip_to_slot_or_del(new /obj/item/clothing/gloves/black/vox(H), slot_gloves)
		else
			H.equip_to_slot_or_del(new /obj/item/clothing/under/det(H), slot_w_uniform)
			H.equip_to_slot_or_del(new /obj/item/clothing/shoes/brown(H), slot_shoes)
			H.equip_to_slot_or_del(new /obj/item/clothing/gloves/black(H), slot_gloves)
			if(H.backbag == 1)//Why cant some of these things spawn in his office?
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H), slot_r_hand)
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/evidence(H), slot_l_hand)
			else
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H.back), slot_in_backpack)
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/evidence(H.back), slot_in_backpack)
		if(H.mind.role_alt_title && H.mind.role_alt_title == "Forensic Technician")
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/forensics/blue(H), slot_wear_suit)
		else
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/det_suit(H), slot_wear_suit)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/det_hat(H), slot_head)
		H.equip_to_slot_or_del(new /obj/item/device/pda/detective(H), slot_belt)
		return 1



/datum/job/officer
	title = "Security Officer"
	flag = OFFICER
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 5
	spawn_positions = 5
	supervisors = "the head of security"
	selection_color = "#ffeeee"
	access = list(access_security, access_sec_doors, access_brig, access_court, access_maint_tunnels, access_morgue)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_court, access_maint_tunnels)
	minimal_player_age = 3
	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_sec(H), slot_l_ear)
		switch(H.backbag)
			if(2) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/security(H), slot_back)
			if(3) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel_sec(H), slot_back)
			if(4) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
//		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/security(H), slot_w_uniform)
//		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)
		if(H.species.name == "Vox")
			if(H.backbag == 1)
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/vox(H), slot_r_hand)
				H.equip_to_slot_or_del(new /obj/item/weapon/handcuffs(H), slot_l_store)
			else
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/vox(H.back), slot_in_backpack)
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/handcuffs(H.back), slot_in_backpack)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/vox/vox_uniform/sec(H), slot_w_uniform)
			H.equip_to_slot_or_del(new /obj/item/clothing/shoes/magboots/vox(H), slot_shoes)
			H.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/sechud/vox(H), slot_glasses)
			H.equip_to_slot_or_del(new /obj/item/clothing/gloves/black/vox(H), slot_gloves)
		else
			H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/security(H), slot_w_uniform)
			H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)
			if(H.backbag == 1)
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H), slot_r_hand)
				H.equip_to_slot_or_del(new /obj/item/weapon/handcuffs(H), slot_l_hand)
			else
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H.back), slot_in_backpack)
				H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/handcuffs(H.back), slot_in_backpack)
		H.equip_to_slot_or_del(new /obj/item/device/pda/security(H), slot_belt)
		H.equip_to_slot_or_del(new /obj/item/weapon/handcuffs(H), slot_s_store)
		H.equip_to_slot_or_del(new /obj/item/device/flash(H), slot_l_store)
		return 1
