local OVALE, Ovale = ...
local OvaleScripts = Ovale.OvaleScripts

do
	local name = "icyveins_demonhunter_vengeance"
	local desc = "[7.0] Icy-Veins: DemonHunter Vengeance"
	local code = [[
Include(ovale_common)
Include(ovale_trinkets_mop)
Include(ovale_trinkets_wod)
Include(ovale_demonhunter_spells)

AddCheckBox(opt_interrupt L(interrupt) default specialization=vengeance)
AddCheckBox(opt_melee_range L(not_in_melee_range) specialization=vengeance)

AddFunction VengeanceDefaultShortCDActions
{
	if CheckBoxOn(opt_melee_range) and not target.InRange(shear) Texture(misc_arrowlup help=L(not_in_melee_range))
	if (Pain() >= 20) and not BuffPresent(demon_spikes_buff) Spell(demon_spikes)
}

AddFunction VengeanceDefaultMainActions
{
	Spell(soul_carver)
	if (Pain() > 75 or (HealthPercent() < 50 and Pain() >= 30)) Spell(soul_cleave)
	Spell(immolation_aura)
	Spell(felblade)
	Spell(fel_eruption)
	Spell(sigil_of_flame)
	Spell(shear)
}

AddFunction VengeanceDefaultAoEActions
{
	Spell(soul_carver)
	if (Pain() > 75 or (HealthPercent() < 50 and Pain() >= 30)) Spell(soul_cleave)
	Spell(immolation_aura)
	Spell(felblade)
	if Talent(burning_alive_talent) Spell(fiery_brand)
	Spell(sigil_of_flame)
	Spell(fel_eruption)
	Spell(shear)
}

AddFunction VengeanceDefaultCdActions
{
	VengeanceInterruptActions()
	if IncomingDamage(1.5 magic=1) > 0 Spell(empower_wards)
	Spell(fiery_brand)
	Spell(metamorphosis_veng)
}

AddFunction VengeanceInterruptActions
{
	if CheckBoxOn(opt_interrupt) and not target.IsFriend() and target.IsInterruptible()
	{
		if target.InRange(consume_magic) Spell(consume_magic)
		if not target.Classification(worldboss) Spell(arcane_torrent_dh)
		Spell(sigil_of_silence)
		if not target.Classification(worldboss) Spell(sigil_of_misery)
	}
}

AddIcon help=shortcd specialization=vengeance
{
	VengeanceDefaultShortCDActions()
}

AddIcon enemies=1 help=main specialization=vengeance
{
	VengeanceDefaultMainActions()
}

AddIcon help=aoe specialization=vengeance
{
	VengeanceDefaultAoEActions()
}

AddIcon help=cd specialization=vengeance
{
	#if not InCombat() VengeancePrecombatCdActions()
	VengeanceDefaultCdActions()
}
	]]
	OvaleScripts:RegisterScript("DEMONHUNTER", "vengeance", name, desc, code, "script")
end

do
	local name = "icyveins_demonhunter_havoc"
	local desc = "[7.0] Icy-Veins: DemonHunter Havoc"
	local code = [[

Include(ovale_common)
Include(ovale_trinkets_mop)
Include(ovale_trinkets_wod)
Include(ovale_demonhunter_spells)

AddCheckBox(opt_interrupt L(interrupt) default specialization=havoc)
AddCheckBox(opt_melee_range L(not_in_melee_range) specialization=havoc)

AddFunction HavocDefaultShortCDActions
{
	if CheckBoxOn(opt_melee_range) and not target.InRange(chaos_strike) {
		if Charges(fel_rush)>=1 Spell(fel_rush)
		Spell(throw_glaive)
		Texture(misc_arrowlup help=L(not_in_melee_range))
	}
	if Charges(fel_rush)==2 Spell(fel_rush)
}

AddFunction HavocDefaultMainActions
{
	if Talent(prepared_talent) and target.InRange(chaos_strike) Spell(vengeful_retreat)
	if Talent(fel_mastery_talent) and Fury() <= 70 Spell(fel_rush)
	if Fury() > 70 Spell(chaos_strike)
	if not Talent(demon_blades_talent) Spell(demons_bite)
	Spell(throw_glaive)
}

AddFunction HavocDefaultAoEActions
{
	if Enemies() > 3 and Talent(fel_mastery_talent) and Fury() <= 70 Spell(fel_rush)
	if Talent(prepared_talent) and target.InRange(chaos_strike) Spell(vengeful_retreat)
	Spell(eye_beam)
	if Talent(chaos_cleave_talent) and Enemies() <= 3 Spell(chaos_strike)
	if Enemies() >= 3 Spell(blade_dance)
	if Talent(fel_mastery_talent) and Fury() <= 70 Spell(fel_rush)
	if ((Talent(demon_blades_talent) and Fury() > 60) or Fury() > 70) Spell(chaos_strike)
	if not Talent(demon_blades_talent) Spell(demons_bite)
	Spell(throw_glaive)
}

AddFunction HavocDefaultCdActions
{
	HavocInterruptActions()
	Spell(metamorphosis_havoc)
}


AddFunction HavocInterruptActions
{
	if CheckBoxOn(opt_interrupt) and not target.IsFriend() and target.IsInterruptible()
	{
		if target.InRange(consume_magic) Spell(consume_magic)
		if not target.Classification(worldboss) Spell(arcane_torrent_dh)
	}
}

AddIcon help=shortcd specialization=havoc
{
	HavocDefaultShortCDActions()
}

AddIcon enemies=1 help=main specialization=havoc
{
	HavocDefaultMainActions()
}

AddIcon help=aoe specialization=havoc
{
	HavocDefaultAoEActions()
}

AddIcon help=cd specialization=havoc
{
	#if not InCombat() VengeancePrecombatCdActions()
	HavocDefaultCdActions()
}

	]]
	OvaleScripts:RegisterScript("DEMONHUNTER", "havoc", name, desc, code, "script")
end

-- THE REST OF THIS FILE IS AUTOMATICALLY GENERATED.
-- ANY CHANGES MADE BELOW THIS POINT WILL BE LOST.

do
	local name = "simulationcraft_demon_hunter_havoc_t19p"
	local desc = "[7.0] SimulationCraft: Demon_Hunter_Havoc_T19P"
	local code = [[
# Based on SimulationCraft profile "Demon_Hunter_Havoc_T19P".
#	class=demonhunter
#	spec=havoc
#	talents=1130111

Include(ovale_common)
Include(ovale_trinkets_mop)
Include(ovale_trinkets_wod)
Include(ovale_demonhunter_spells)

AddCheckBox(opt_melee_range L(not_in_melee_range) specialization=havoc)

AddFunction HavocUseItemActions
{
	Item(Trinket0Slot usable=1)
	Item(Trinket1Slot usable=1)
}

AddFunction HavocGetInMeleeRange
{
	if CheckBoxOn(opt_melee_range) and not target.InRange(consume_magic) Texture(misc_arrowlup help=L(not_in_melee_range))
}

### actions.default

AddFunction HavocDefaultMainActions
{
	#pick_up_fragment,if=talent.demonic_appetite.enabled&fury.deficit>=30
	if Talent(demonic_appetite_talent) and DemonicFuryDeficit() >= 30 Spell(pick_up_fragment)
	#vengeful_retreat,if=(talent.prepared.enabled|talent.momentum.enabled)&buff.prepared.down&buff.momentum.down
	if { Talent(prepared_talent) or Talent(momentum_talent) } and BuffExpires(prepared_buff) and BuffExpires(momentum_buff) Spell(vengeful_retreat)
	#eye_beam,if=talent.demonic.enabled&buff.metamorphosis.down&(!talent.first_blood.enabled|fury>=80|fury.deficit<30)
	if Talent(demonic_talent) and BuffExpires(metamorphosis_havoc_buff) and { not Talent(first_blood_talent) or DemonicFury() >= 80 or DemonicFuryDeficit() < 30 } Spell(eye_beam)
	#demons_bite,sync=metamorphosis,if=fury.deficit>=25
	if BuffExpires(metamorphosis_havoc_buff) and { not Talent(demonic_talent) or not SpellCooldownDuration(eye_beam) } and { not Talent(chaos_blades_talent) or SpellCooldownDuration(chaos_blades) } and { not Talent(nemesis_talent) or target.DebuffPresent(nemesis_debuff) or SpellCooldownDuration(nemesis) } and Spell(metamorphosis_havoc) and DemonicFuryDeficit() >= 25 Spell(demons_bite)
	#call_action_list,name=cooldown
	HavocCooldownMainActions()

	unless HavocCooldownMainPostConditions()
	{
		#death_sweep,if=death_sweep_worth_using
		if 0 Spell(death_sweep)
		#demons_bite,if=buff.metamorphosis.remains>gcd&cooldown.blade_dance.remains<gcd&fury<70&death_sweep_worth_using
		if BuffRemaining(metamorphosis_havoc_buff) > GCD() and SpellCooldown(blade_dance) < GCD() and DemonicFury() < 70 and 0 Spell(demons_bite)
		#blade_dance,if=blade_dance_worth_using
		if 0 Spell(blade_dance)
		#throw_glaive,if=talent.bloodlet.enabled&spell_targets>=2+talent.chaos_cleave.enabled&(!talent.master_of_the_glaive.enabled|!talent.momentum.enabled|buff.momentum.up)
		if Talent(bloodlet_talent) and Enemies() >= 2 + TalentPoints(chaos_cleave_talent) and { not Talent(master_of_the_glaive_talent) or not Talent(momentum_talent) or BuffPresent(momentum_buff) } Spell(throw_glaive)
		#felblade,if=fury.deficit>=30+buff.prepared.up*8
		if DemonicFuryDeficit() >= 30 + BuffPresent(prepared_buff) * 8 Spell(felblade)
		#annihilation,if=!talent.momentum.enabled|buff.momentum.up|fury.deficit<=30+buff.prepared.up*8|buff.metamorphosis.remains<2
		if not Talent(momentum_talent) or BuffPresent(momentum_buff) or DemonicFuryDeficit() <= 30 + BuffPresent(prepared_buff) * 8 or BuffRemaining(metamorphosis_havoc_buff) < 2 Spell(annihilation)
		#throw_glaive,if=talent.bloodlet.enabled&(!talent.master_of_the_glaive.enabled|!talent.momentum.enabled|buff.momentum.up)
		if Talent(bloodlet_talent) and { not Talent(master_of_the_glaive_talent) or not Talent(momentum_talent) or BuffPresent(momentum_buff) } Spell(throw_glaive)
		#eye_beam,if=!talent.demonic.enabled&(spell_targets.eye_beam_tick>desired_targets|(raid_event.adds.in>45&buff.metamorphosis.down&(artifact.anguish_of_the_deceiver.enabled|active_enemies>1|level=100)))
		if not Talent(demonic_talent) and { Enemies() > Enemies(tagged=1) or 600 > 45 and BuffExpires(metamorphosis_havoc_buff) and { HasArtifactTrait(anguish_of_the_deceiver) or Enemies() > 1 or Level() == 100 } } Spell(eye_beam)
		#demons_bite,if=buff.metamorphosis.down&cooldown.blade_dance.remains<gcd&fury<55&blade_dance_worth_using
		if BuffExpires(metamorphosis_havoc_buff) and SpellCooldown(blade_dance) < GCD() and DemonicFury() < 55 and 0 Spell(demons_bite)
		#demons_bite,if=talent.demonic.enabled&buff.metamorphosis.down&cooldown.eye_beam.remains<gcd&fury.deficit>=20
		if Talent(demonic_talent) and BuffExpires(metamorphosis_havoc_buff) and SpellCooldown(eye_beam) < GCD() and DemonicFuryDeficit() >= 20 Spell(demons_bite)
		#demons_bite,if=talent.demonic.enabled&buff.metamorphosis.down&cooldown.eye_beam.remains<2*gcd&fury.deficit>=45
		if Talent(demonic_talent) and BuffExpires(metamorphosis_havoc_buff) and SpellCooldown(eye_beam) < 2 * GCD() and DemonicFuryDeficit() >= 45 Spell(demons_bite)
		#throw_glaive,if=buff.metamorphosis.down&spell_targets>=3
		if BuffExpires(metamorphosis_havoc_buff) and Enemies() >= 3 Spell(throw_glaive)
		#chaos_strike,if=!talent.momentum.enabled|buff.momentum.up|fury.deficit<=30+buff.prepared.up*8
		if not Talent(momentum_talent) or BuffPresent(momentum_buff) or DemonicFuryDeficit() <= 30 + BuffPresent(prepared_buff) * 8 Spell(chaos_strike)
		#demons_bite
		Spell(demons_bite)
		#throw_glaive
		Spell(throw_glaive)
		#vengeful_retreat,if=movement.distance>15
		if 0 > 15 Spell(vengeful_retreat)
	}
}

AddFunction HavocDefaultMainPostConditions
{
	HavocCooldownMainPostConditions()
}

AddFunction HavocDefaultShortCdActions
{
	#auto_attack
	HavocGetInMeleeRange()

	unless Talent(demonic_appetite_talent) and DemonicFuryDeficit() >= 30 and Spell(pick_up_fragment)
	{
		#consume_magic
		Spell(consume_magic)

		unless { Talent(prepared_talent) or Talent(momentum_talent) } and BuffExpires(prepared_buff) and BuffExpires(momentum_buff) and Spell(vengeful_retreat)
		{
			#fel_rush,animation_cancel=1,if=(talent.momentum.enabled|talent.fel_mastery.enabled)&(!talent.momentum.enabled|(charges=2|cooldown.vengeful_retreat.remains>4)&buff.momentum.down)&(!talent.fel_mastery.enabled|fury.deficit>=25)&raid_event.movement.in>charges*10
			if { Talent(momentum_talent) or Talent(fel_mastery_talent) } and { not Talent(momentum_talent) or { Charges(fel_rush) == 2 or SpellCooldown(vengeful_retreat) > 4 } and BuffExpires(momentum_buff) } and { not Talent(fel_mastery_talent) or DemonicFuryDeficit() >= 25 } and 600 > Charges(fel_rush) * 10 Spell(fel_rush)

			unless Talent(demonic_talent) and BuffExpires(metamorphosis_havoc_buff) and { not Talent(first_blood_talent) or DemonicFury() >= 80 or DemonicFuryDeficit() < 30 } and Spell(eye_beam) or BuffExpires(metamorphosis_havoc_buff) and { not Talent(demonic_talent) or not SpellCooldownDuration(eye_beam) } and { not Talent(chaos_blades_talent) or SpellCooldownDuration(chaos_blades) } and { not Talent(nemesis_talent) or target.DebuffPresent(nemesis_debuff) or SpellCooldownDuration(nemesis) } and Spell(metamorphosis_havoc) and DemonicFuryDeficit() >= 25 and Spell(demons_bite)
			{
				#call_action_list,name=cooldown
				HavocCooldownShortCdActions()

				unless HavocCooldownShortCdPostConditions()
				{
					#fury_of_the_illidari,if=active_enemies>desired_targets|raid_event.adds.in>55
					if Enemies() > Enemies(tagged=1) or 600 > 55 Spell(fury_of_the_illidari)

					unless 0 and Spell(death_sweep) or BuffRemaining(metamorphosis_havoc_buff) > GCD() and SpellCooldown(blade_dance) < GCD() and DemonicFury() < 70 and 0 and Spell(demons_bite) or 0 and Spell(blade_dance)
					{
						#fel_barrage,if=charges>=5&(buff.momentum.up|!talent.momentum.enabled)&(active_enemies>desired_targets|raid_event.adds.in>30)
						if Charges(fel_barrage) >= 5 and { BuffPresent(momentum_buff) or not Talent(momentum_talent) } and { Enemies() > Enemies(tagged=1) or 600 > 30 } Spell(fel_barrage)

						unless Talent(bloodlet_talent) and Enemies() >= 2 + TalentPoints(chaos_cleave_talent) and { not Talent(master_of_the_glaive_talent) or not Talent(momentum_talent) or BuffPresent(momentum_buff) } and Spell(throw_glaive)
						{
							#fel_eruption
							Spell(fel_eruption)

							unless DemonicFuryDeficit() >= 30 + BuffPresent(prepared_buff) * 8 and Spell(felblade) or { not Talent(momentum_talent) or BuffPresent(momentum_buff) or DemonicFuryDeficit() <= 30 + BuffPresent(prepared_buff) * 8 or BuffRemaining(metamorphosis_havoc_buff) < 2 } and Spell(annihilation) or Talent(bloodlet_talent) and { not Talent(master_of_the_glaive_talent) or not Talent(momentum_talent) or BuffPresent(momentum_buff) } and Spell(throw_glaive) or not Talent(demonic_talent) and { Enemies() > Enemies(tagged=1) or 600 > 45 and BuffExpires(metamorphosis_havoc_buff) and { HasArtifactTrait(anguish_of_the_deceiver) or Enemies() > 1 or Level() == 100 } } and Spell(eye_beam) or BuffExpires(metamorphosis_havoc_buff) and SpellCooldown(blade_dance) < GCD() and DemonicFury() < 55 and 0 and Spell(demons_bite) or Talent(demonic_talent) and BuffExpires(metamorphosis_havoc_buff) and SpellCooldown(eye_beam) < GCD() and DemonicFuryDeficit() >= 20 and Spell(demons_bite) or Talent(demonic_talent) and BuffExpires(metamorphosis_havoc_buff) and SpellCooldown(eye_beam) < 2 * GCD() and DemonicFuryDeficit() >= 45 and Spell(demons_bite) or BuffExpires(metamorphosis_havoc_buff) and Enemies() >= 3 and Spell(throw_glaive) or { not Talent(momentum_talent) or BuffPresent(momentum_buff) or DemonicFuryDeficit() <= 30 + BuffPresent(prepared_buff) * 8 } and Spell(chaos_strike)
							{
								#fel_barrage,if=charges=4&buff.metamorphosis.down&(buff.momentum.up|!talent.momentum.enabled)&(active_enemies>desired_targets|raid_event.adds.in>30)
								if Charges(fel_barrage) == 4 and BuffExpires(metamorphosis_havoc_buff) and { BuffPresent(momentum_buff) or not Talent(momentum_talent) } and { Enemies() > Enemies(tagged=1) or 600 > 30 } Spell(fel_barrage)
								#fel_rush,animation_cancel=1,if=!talent.momentum.enabled&raid_event.movement.in>charges*10
								if not Talent(momentum_talent) and 600 > Charges(fel_rush) * 10 Spell(fel_rush)

								unless Spell(demons_bite) or Spell(throw_glaive)
								{
									#fel_rush,if=movement.distance>15|(buff.out_of_range.up&!talent.momentum.enabled)
									if 0 > 15 or BuffPresent(out_of_range_buff) and not Talent(momentum_talent) Spell(fel_rush)
								}
							}
						}
					}
				}
			}
		}
	}
}

AddFunction HavocDefaultShortCdPostConditions
{
	Talent(demonic_appetite_talent) and DemonicFuryDeficit() >= 30 and Spell(pick_up_fragment) or { Talent(prepared_talent) or Talent(momentum_talent) } and BuffExpires(prepared_buff) and BuffExpires(momentum_buff) and Spell(vengeful_retreat) or Talent(demonic_talent) and BuffExpires(metamorphosis_havoc_buff) and { not Talent(first_blood_talent) or DemonicFury() >= 80 or DemonicFuryDeficit() < 30 } and Spell(eye_beam) or BuffExpires(metamorphosis_havoc_buff) and { not Talent(demonic_talent) or not SpellCooldownDuration(eye_beam) } and { not Talent(chaos_blades_talent) or SpellCooldownDuration(chaos_blades) } and { not Talent(nemesis_talent) or target.DebuffPresent(nemesis_debuff) or SpellCooldownDuration(nemesis) } and Spell(metamorphosis_havoc) and DemonicFuryDeficit() >= 25 and Spell(demons_bite) or HavocCooldownShortCdPostConditions() or 0 and Spell(death_sweep) or BuffRemaining(metamorphosis_havoc_buff) > GCD() and SpellCooldown(blade_dance) < GCD() and DemonicFury() < 70 and 0 and Spell(demons_bite) or 0 and Spell(blade_dance) or Talent(bloodlet_talent) and Enemies() >= 2 + TalentPoints(chaos_cleave_talent) and { not Talent(master_of_the_glaive_talent) or not Talent(momentum_talent) or BuffPresent(momentum_buff) } and Spell(throw_glaive) or DemonicFuryDeficit() >= 30 + BuffPresent(prepared_buff) * 8 and Spell(felblade) or { not Talent(momentum_talent) or BuffPresent(momentum_buff) or DemonicFuryDeficit() <= 30 + BuffPresent(prepared_buff) * 8 or BuffRemaining(metamorphosis_havoc_buff) < 2 } and Spell(annihilation) or Talent(bloodlet_talent) and { not Talent(master_of_the_glaive_talent) or not Talent(momentum_talent) or BuffPresent(momentum_buff) } and Spell(throw_glaive) or not Talent(demonic_talent) and { Enemies() > Enemies(tagged=1) or 600 > 45 and BuffExpires(metamorphosis_havoc_buff) and { HasArtifactTrait(anguish_of_the_deceiver) or Enemies() > 1 or Level() == 100 } } and Spell(eye_beam) or BuffExpires(metamorphosis_havoc_buff) and SpellCooldown(blade_dance) < GCD() and DemonicFury() < 55 and 0 and Spell(demons_bite) or Talent(demonic_talent) and BuffExpires(metamorphosis_havoc_buff) and SpellCooldown(eye_beam) < GCD() and DemonicFuryDeficit() >= 20 and Spell(demons_bite) or Talent(demonic_talent) and BuffExpires(metamorphosis_havoc_buff) and SpellCooldown(eye_beam) < 2 * GCD() and DemonicFuryDeficit() >= 45 and Spell(demons_bite) or BuffExpires(metamorphosis_havoc_buff) and Enemies() >= 3 and Spell(throw_glaive) or { not Talent(momentum_talent) or BuffPresent(momentum_buff) or DemonicFuryDeficit() <= 30 + BuffPresent(prepared_buff) * 8 } and Spell(chaos_strike) or Spell(demons_bite) or Spell(throw_glaive) or 0 > 15 and Spell(vengeful_retreat)
}

AddFunction HavocDefaultCdActions
{
	unless Talent(demonic_appetite_talent) and DemonicFuryDeficit() >= 30 and Spell(pick_up_fragment) or { Talent(prepared_talent) or Talent(momentum_talent) } and BuffExpires(prepared_buff) and BuffExpires(momentum_buff) and Spell(vengeful_retreat) or { Talent(momentum_talent) or Talent(fel_mastery_talent) } and { not Talent(momentum_talent) or { Charges(fel_rush) == 2 or SpellCooldown(vengeful_retreat) > 4 } and BuffExpires(momentum_buff) } and { not Talent(fel_mastery_talent) or DemonicFuryDeficit() >= 25 } and 600 > Charges(fel_rush) * 10 and Spell(fel_rush) or Talent(demonic_talent) and BuffExpires(metamorphosis_havoc_buff) and { not Talent(first_blood_talent) or DemonicFury() >= 80 or DemonicFuryDeficit() < 30 } and Spell(eye_beam) or BuffExpires(metamorphosis_havoc_buff) and { not Talent(demonic_talent) or not SpellCooldownDuration(eye_beam) } and { not Talent(chaos_blades_talent) or SpellCooldownDuration(chaos_blades) } and { not Talent(nemesis_talent) or target.DebuffPresent(nemesis_debuff) or SpellCooldownDuration(nemesis) } and Spell(metamorphosis_havoc) and DemonicFuryDeficit() >= 25 and Spell(demons_bite)
	{
		#call_action_list,name=cooldown
		HavocCooldownCdActions()
	}
}

AddFunction HavocDefaultCdPostConditions
{
	Talent(demonic_appetite_talent) and DemonicFuryDeficit() >= 30 and Spell(pick_up_fragment) or { Talent(prepared_talent) or Talent(momentum_talent) } and BuffExpires(prepared_buff) and BuffExpires(momentum_buff) and Spell(vengeful_retreat) or { Talent(momentum_talent) or Talent(fel_mastery_talent) } and { not Talent(momentum_talent) or { Charges(fel_rush) == 2 or SpellCooldown(vengeful_retreat) > 4 } and BuffExpires(momentum_buff) } and { not Talent(fel_mastery_talent) or DemonicFuryDeficit() >= 25 } and 600 > Charges(fel_rush) * 10 and Spell(fel_rush) or Talent(demonic_talent) and BuffExpires(metamorphosis_havoc_buff) and { not Talent(first_blood_talent) or DemonicFury() >= 80 or DemonicFuryDeficit() < 30 } and Spell(eye_beam) or BuffExpires(metamorphosis_havoc_buff) and { not Talent(demonic_talent) or not SpellCooldownDuration(eye_beam) } and { not Talent(chaos_blades_talent) or SpellCooldownDuration(chaos_blades) } and { not Talent(nemesis_talent) or target.DebuffPresent(nemesis_debuff) or SpellCooldownDuration(nemesis) } and Spell(metamorphosis_havoc) and DemonicFuryDeficit() >= 25 and Spell(demons_bite) or HavocCooldownCdPostConditions() or { Enemies() > Enemies(tagged=1) or 600 > 55 } and Spell(fury_of_the_illidari) or 0 and Spell(death_sweep) or BuffRemaining(metamorphosis_havoc_buff) > GCD() and SpellCooldown(blade_dance) < GCD() and DemonicFury() < 70 and 0 and Spell(demons_bite) or 0 and Spell(blade_dance) or Charges(fel_barrage) >= 5 and { BuffPresent(momentum_buff) or not Talent(momentum_talent) } and { Enemies() > Enemies(tagged=1) or 600 > 30 } and Spell(fel_barrage) or Talent(bloodlet_talent) and Enemies() >= 2 + TalentPoints(chaos_cleave_talent) and { not Talent(master_of_the_glaive_talent) or not Talent(momentum_talent) or BuffPresent(momentum_buff) } and Spell(throw_glaive) or Spell(fel_eruption) or DemonicFuryDeficit() >= 30 + BuffPresent(prepared_buff) * 8 and Spell(felblade) or { not Talent(momentum_talent) or BuffPresent(momentum_buff) or DemonicFuryDeficit() <= 30 + BuffPresent(prepared_buff) * 8 or BuffRemaining(metamorphosis_havoc_buff) < 2 } and Spell(annihilation) or Talent(bloodlet_talent) and { not Talent(master_of_the_glaive_talent) or not Talent(momentum_talent) or BuffPresent(momentum_buff) } and Spell(throw_glaive) or not Talent(demonic_talent) and { Enemies() > Enemies(tagged=1) or 600 > 45 and BuffExpires(metamorphosis_havoc_buff) and { HasArtifactTrait(anguish_of_the_deceiver) or Enemies() > 1 or Level() == 100 } } and Spell(eye_beam) or BuffExpires(metamorphosis_havoc_buff) and SpellCooldown(blade_dance) < GCD() and DemonicFury() < 55 and 0 and Spell(demons_bite) or Talent(demonic_talent) and BuffExpires(metamorphosis_havoc_buff) and SpellCooldown(eye_beam) < GCD() and DemonicFuryDeficit() >= 20 and Spell(demons_bite) or Talent(demonic_talent) and BuffExpires(metamorphosis_havoc_buff) and SpellCooldown(eye_beam) < 2 * GCD() and DemonicFuryDeficit() >= 45 and Spell(demons_bite) or BuffExpires(metamorphosis_havoc_buff) and Enemies() >= 3 and Spell(throw_glaive) or { not Talent(momentum_talent) or BuffPresent(momentum_buff) or DemonicFuryDeficit() <= 30 + BuffPresent(prepared_buff) * 8 } and Spell(chaos_strike) or Charges(fel_barrage) == 4 and BuffExpires(metamorphosis_havoc_buff) and { BuffPresent(momentum_buff) or not Talent(momentum_talent) } and { Enemies() > Enemies(tagged=1) or 600 > 30 } and Spell(fel_barrage) or not Talent(momentum_talent) and 600 > Charges(fel_rush) * 10 and Spell(fel_rush) or Spell(demons_bite) or Spell(throw_glaive) or { 0 > 15 or BuffPresent(out_of_range_buff) and not Talent(momentum_talent) } and Spell(fel_rush) or 0 > 15 and Spell(vengeful_retreat)
}

### actions.cooldown

AddFunction HavocCooldownMainActions
{
}

AddFunction HavocCooldownMainPostConditions
{
}

AddFunction HavocCooldownShortCdActions
{
}

AddFunction HavocCooldownShortCdPostConditions
{
}

AddFunction HavocCooldownCdActions
{
	#use_item,slot=trinket2,if=buff.chaos_blades.up|!talent.chaos_blades.enabled
	if BuffPresent(chaos_blades_buff) or not Talent(chaos_blades_talent) HavocUseItemActions()
	#nemesis,target_if=min:target.time_to_die,if=raid_event.adds.exists&debuff.nemesis.down&(active_enemies>desired_targets|raid_event.adds.in>60)
	if False(raid_event_adds_exists) and target.DebuffExpires(nemesis_debuff) and { Enemies() > Enemies(tagged=1) or 600 > 60 } Spell(nemesis)
	#nemesis,if=!raid_event.adds.exists&(cooldown.metamorphosis.remains>100|target.time_to_die<70)
	if not False(raid_event_adds_exists) and { SpellCooldown(metamorphosis_havoc) > 100 or target.TimeToDie() < 70 } Spell(nemesis)
	#nemesis,sync=metamorphosis,if=!raid_event.adds.exists
	if BuffExpires(metamorphosis_havoc_buff) and { not Talent(demonic_talent) or not SpellCooldownDuration(eye_beam) } and { not Talent(chaos_blades_talent) or SpellCooldownDuration(chaos_blades) } and { not Talent(nemesis_talent) or target.DebuffPresent(nemesis_debuff) or SpellCooldownDuration(nemesis) } and Spell(metamorphosis_havoc) and not False(raid_event_adds_exists) Spell(nemesis)
	#chaos_blades,if=buff.metamorphosis.up|cooldown.metamorphosis.remains>100|target.time_to_die<20
	if BuffPresent(metamorphosis_havoc_buff) or SpellCooldown(metamorphosis_havoc) > 100 or target.TimeToDie() < 20 Spell(chaos_blades)
	#metamorphosis,if=buff.metamorphosis.down&(!talent.demonic.enabled|!cooldown.eye_beam.ready)&(!talent.chaos_blades.enabled|cooldown.chaos_blades.ready)&(!talent.nemesis.enabled|debuff.nemesis.up|cooldown.nemesis.ready)
	if BuffExpires(metamorphosis_havoc_buff) and { not Talent(demonic_talent) or not SpellCooldownDuration(eye_beam) } and { not Talent(chaos_blades_talent) or SpellCooldownDuration(chaos_blades) } and { not Talent(nemesis_talent) or target.DebuffPresent(nemesis_debuff) or SpellCooldownDuration(nemesis) } Spell(metamorphosis_havoc)
}

AddFunction HavocCooldownCdPostConditions
{
}

### actions.precombat

AddFunction HavocPrecombatMainActions
{
	#flask,type=flask_of_the_seventh_demon
	#food,type=the_hungry_magister
	#augmentation,type=defiled
	Spell(augmentation)
}

AddFunction HavocPrecombatMainPostConditions
{
}

AddFunction HavocPrecombatShortCdActions
{
}

AddFunction HavocPrecombatShortCdPostConditions
{
	Spell(augmentation)
}

AddFunction HavocPrecombatCdActions
{
}

AddFunction HavocPrecombatCdPostConditions
{
	Spell(augmentation)
}

### Havoc icons.

AddCheckBox(opt_demonhunter_havoc_aoe L(AOE) default specialization=havoc)

AddIcon checkbox=!opt_demonhunter_havoc_aoe enemies=1 help=shortcd specialization=havoc
{
	if not InCombat() HavocPrecombatShortCdActions()
	unless not InCombat() and HavocPrecombatShortCdPostConditions()
	{
		HavocDefaultShortCdActions()
	}
}

AddIcon checkbox=opt_demonhunter_havoc_aoe help=shortcd specialization=havoc
{
	if not InCombat() HavocPrecombatShortCdActions()
	unless not InCombat() and HavocPrecombatShortCdPostConditions()
	{
		HavocDefaultShortCdActions()
	}
}

AddIcon enemies=1 help=main specialization=havoc
{
	if not InCombat() HavocPrecombatMainActions()
	unless not InCombat() and HavocPrecombatMainPostConditions()
	{
		HavocDefaultMainActions()
	}
}

AddIcon checkbox=opt_demonhunter_havoc_aoe help=aoe specialization=havoc
{
	if not InCombat() HavocPrecombatMainActions()
	unless not InCombat() and HavocPrecombatMainPostConditions()
	{
		HavocDefaultMainActions()
	}
}

AddIcon checkbox=!opt_demonhunter_havoc_aoe enemies=1 help=cd specialization=havoc
{
	if not InCombat() HavocPrecombatCdActions()
	unless not InCombat() and HavocPrecombatCdPostConditions()
	{
		HavocDefaultCdActions()
	}
}

AddIcon checkbox=opt_demonhunter_havoc_aoe help=cd specialization=havoc
{
	if not InCombat() HavocPrecombatCdActions()
	unless not InCombat() and HavocPrecombatCdPostConditions()
	{
		HavocDefaultCdActions()
	}
}

### Required symbols
# anguish_of_the_deceiver
# annihilation
# augmentation
# blade_dance
# bloodlet_talent
# chaos_blades
# chaos_blades_buff
# chaos_blades_talent
# chaos_cleave_talent
# chaos_strike
# consume_magic
# death_sweep
# demonic_appetite_talent
# demonic_talent
# demons_bite
# eye_beam
# fel_barrage
# fel_eruption
# fel_mastery_talent
# fel_rush
# felblade
# first_blood_talent
# fury_of_the_illidari
# master_of_the_glaive_talent
# metamorphosis_havoc
# metamorphosis_havoc_buff
# momentum_buff
# momentum_talent
# nemesis
# nemesis_debuff
# nemesis_talent
# out_of_range_buff
# pick_up_fragment
# prepared_buff
# prepared_talent
# throw_glaive
# vengeful_retreat
]]
	OvaleScripts:RegisterScript("DEMONHUNTER", "havoc", name, desc, code, "script")
end

do
	local name = "simulationcraft_demon_hunter_vengeance_t19p"
	local desc = "[7.0] SimulationCraft: Demon_Hunter_Vengeance_T19P"
	local code = [[
# Based on SimulationCraft profile "Demon_Hunter_Vengeance_T19P".
#	class=demonhunter
#	spec=vengeance
#	talents=3323313

Include(ovale_common)
Include(ovale_trinkets_mop)
Include(ovale_trinkets_wod)
Include(ovale_demonhunter_spells)

AddCheckBox(opt_melee_range L(not_in_melee_range) specialization=vengeance)

AddFunction VengeanceGetInMeleeRange
{
	if CheckBoxOn(opt_melee_range) and not target.InRange(consume_magic) Texture(misc_arrowlup help=L(not_in_melee_range))
}

### actions.default

AddFunction VengeanceDefaultMainActions
{
	#infernal_strike,if=!sigil_placed&!in_flight&remains-travel_time-delay<0.3*duration&artifact.fiery_demise.enabled&dot.fiery_brand.ticking
	if not PreviousSpell(sigil_of_flame) and not InFlightToTarget(infernal_strike) and target.DebuffRemaining(infernal_strike_debuff) - TravelTime(infernal_strike) - 0 < 0.3 * BaseDuration(infernal_strike_debuff) and HasArtifactTrait(fiery_demise) and target.DebuffPresent(fiery_brand_debuff) Spell(infernal_strike)
	#infernal_strike,if=!sigil_placed&!in_flight&remains-travel_time-delay<0.3*duration&(!artifact.fiery_demise.enabled|(max_charges-charges_fractional)*recharge_time<cooldown.fiery_brand.remains+5)&(cooldown.sigil_of_flame.remains>7|charges=2)
	if not PreviousSpell(sigil_of_flame) and not InFlightToTarget(infernal_strike) and target.DebuffRemaining(infernal_strike_debuff) - TravelTime(infernal_strike) - 0 < 0.3 * BaseDuration(infernal_strike_debuff) and { not HasArtifactTrait(fiery_demise) or { SpellMaxCharges(infernal_strike) - Charges(infernal_strike count=0) } * SpellChargeCooldown(infernal_strike) < SpellCooldown(fiery_brand) + 5 } and { SpellCooldown(sigil_of_flame) > 7 or Charges(infernal_strike) == 2 } Spell(infernal_strike)
	#spirit_bomb,if=debuff.frailty.down
	if target.DebuffExpires(frailty_debuff) Spell(spirit_bomb)
	#immolation_aura,if=pain<=80
	if Pain() <= 80 Spell(immolation_aura)
	#felblade,if=pain<=70
	if Pain() <= 70 Spell(felblade)
	#soul_barrier
	Spell(soul_barrier)
	#soul_cleave,if=soul_fragments=5
	if BuffStacks(soul_fragments) == 5 Spell(soul_cleave)
	#soul_cleave,if=incoming_damage_5s>=health.max*0.70
	if IncomingDamage(5) >= MaxHealth() * 0.7 Spell(soul_cleave)
	#fracture,if=pain>=80&soul_fragments<4&incoming_damage_4s<=health.max*0.20
	if Pain() >= 80 and BuffStacks(soul_fragments) < 4 and IncomingDamage(4) <= MaxHealth() * 0.2 Spell(fracture)
	#soul_cleave,if=pain>=80
	if Pain() >= 80 Spell(soul_cleave)
	#shear
	Spell(shear)
}

AddFunction VengeanceDefaultMainPostConditions
{
}

AddFunction VengeanceDefaultShortCdActions
{
	#auto_attack
	VengeanceGetInMeleeRange()
	#fiery_brand,if=buff.demon_spikes.down&buff.metamorphosis.down
	if BuffExpires(demon_spikes_buff) and BuffExpires(metamorphosis_veng_buff) Spell(fiery_brand)
	#demon_spikes,if=charges=2|buff.demon_spikes.down&!dot.fiery_brand.ticking&buff.metamorphosis.down
	if Charges(demon_spikes) == 2 or BuffExpires(demon_spikes_buff) and not target.DebuffPresent(fiery_brand_debuff) and BuffExpires(metamorphosis_veng_buff) Spell(demon_spikes)
	#empower_wards,if=debuff.casting.up
	if target.DebuffPresent(casting_debuff) Spell(empower_wards)

	unless not PreviousSpell(sigil_of_flame) and not InFlightToTarget(infernal_strike) and target.DebuffRemaining(infernal_strike_debuff) - TravelTime(infernal_strike) - 0 < 0.3 * BaseDuration(infernal_strike_debuff) and HasArtifactTrait(fiery_demise) and target.DebuffPresent(fiery_brand_debuff) and Spell(infernal_strike) or not PreviousSpell(sigil_of_flame) and not InFlightToTarget(infernal_strike) and target.DebuffRemaining(infernal_strike_debuff) - TravelTime(infernal_strike) - 0 < 0.3 * BaseDuration(infernal_strike_debuff) and { not HasArtifactTrait(fiery_demise) or { SpellMaxCharges(infernal_strike) - Charges(infernal_strike count=0) } * SpellChargeCooldown(infernal_strike) < SpellCooldown(fiery_brand) + 5 } and { SpellCooldown(sigil_of_flame) > 7 or Charges(infernal_strike) == 2 } and Spell(infernal_strike) or target.DebuffExpires(frailty_debuff) and Spell(spirit_bomb)
	{
		#soul_carver,if=dot.fiery_brand.ticking
		if target.DebuffPresent(fiery_brand_debuff) Spell(soul_carver)

		unless Pain() <= 80 and Spell(immolation_aura) or Pain() <= 70 and Spell(felblade) or Spell(soul_barrier) or BuffStacks(soul_fragments) == 5 and Spell(soul_cleave)
		{
			#fel_devastation,if=incoming_damage_5s>health.max*0.70
			if IncomingDamage(5) > MaxHealth() * 0.7 Spell(fel_devastation)

			unless IncomingDamage(5) >= MaxHealth() * 0.7 and Spell(soul_cleave)
			{
				#fel_eruption
				Spell(fel_eruption)
				#sigil_of_flame,if=remains-delay<=0.3*duration
				if target.DebuffRemaining(sigil_of_flame_debuff) - 0 <= 0.3 * BaseDuration(sigil_of_flame_debuff) Spell(sigil_of_flame)
			}
		}
	}
}

AddFunction VengeanceDefaultShortCdPostConditions
{
	not PreviousSpell(sigil_of_flame) and not InFlightToTarget(infernal_strike) and target.DebuffRemaining(infernal_strike_debuff) - TravelTime(infernal_strike) - 0 < 0.3 * BaseDuration(infernal_strike_debuff) and HasArtifactTrait(fiery_demise) and target.DebuffPresent(fiery_brand_debuff) and Spell(infernal_strike) or not PreviousSpell(sigil_of_flame) and not InFlightToTarget(infernal_strike) and target.DebuffRemaining(infernal_strike_debuff) - TravelTime(infernal_strike) - 0 < 0.3 * BaseDuration(infernal_strike_debuff) and { not HasArtifactTrait(fiery_demise) or { SpellMaxCharges(infernal_strike) - Charges(infernal_strike count=0) } * SpellChargeCooldown(infernal_strike) < SpellCooldown(fiery_brand) + 5 } and { SpellCooldown(sigil_of_flame) > 7 or Charges(infernal_strike) == 2 } and Spell(infernal_strike) or target.DebuffExpires(frailty_debuff) and Spell(spirit_bomb) or Pain() <= 80 and Spell(immolation_aura) or Pain() <= 70 and Spell(felblade) or Spell(soul_barrier) or BuffStacks(soul_fragments) == 5 and Spell(soul_cleave) or IncomingDamage(5) >= MaxHealth() * 0.7 and Spell(soul_cleave) or Pain() >= 80 and BuffStacks(soul_fragments) < 4 and IncomingDamage(4) <= MaxHealth() * 0.2 and Spell(fracture) or Pain() >= 80 and Spell(soul_cleave) or Spell(shear)
}

AddFunction VengeanceDefaultCdActions
{
	unless not PreviousSpell(sigil_of_flame) and not InFlightToTarget(infernal_strike) and target.DebuffRemaining(infernal_strike_debuff) - TravelTime(infernal_strike) - 0 < 0.3 * BaseDuration(infernal_strike_debuff) and HasArtifactTrait(fiery_demise) and target.DebuffPresent(fiery_brand_debuff) and Spell(infernal_strike) or not PreviousSpell(sigil_of_flame) and not InFlightToTarget(infernal_strike) and target.DebuffRemaining(infernal_strike_debuff) - TravelTime(infernal_strike) - 0 < 0.3 * BaseDuration(infernal_strike_debuff) and { not HasArtifactTrait(fiery_demise) or { SpellMaxCharges(infernal_strike) - Charges(infernal_strike count=0) } * SpellChargeCooldown(infernal_strike) < SpellCooldown(fiery_brand) + 5 } and { SpellCooldown(sigil_of_flame) > 7 or Charges(infernal_strike) == 2 } and Spell(infernal_strike) or target.DebuffExpires(frailty_debuff) and Spell(spirit_bomb) or target.DebuffPresent(fiery_brand_debuff) and Spell(soul_carver) or Pain() <= 80 and Spell(immolation_aura) or Pain() <= 70 and Spell(felblade) or Spell(soul_barrier) or BuffStacks(soul_fragments) == 5 and Spell(soul_cleave)
	{
		#metamorphosis,if=buff.demon_spikes.down&!dot.fiery_brand.ticking&buff.metamorphosis.down&incoming_damage_5s>health.max*0.70
		if BuffExpires(demon_spikes_buff) and not target.DebuffPresent(fiery_brand_debuff) and BuffExpires(metamorphosis_veng_buff) and IncomingDamage(5) > MaxHealth() * 0.7 Spell(metamorphosis_veng)
	}
}

AddFunction VengeanceDefaultCdPostConditions
{
	not PreviousSpell(sigil_of_flame) and not InFlightToTarget(infernal_strike) and target.DebuffRemaining(infernal_strike_debuff) - TravelTime(infernal_strike) - 0 < 0.3 * BaseDuration(infernal_strike_debuff) and HasArtifactTrait(fiery_demise) and target.DebuffPresent(fiery_brand_debuff) and Spell(infernal_strike) or not PreviousSpell(sigil_of_flame) and not InFlightToTarget(infernal_strike) and target.DebuffRemaining(infernal_strike_debuff) - TravelTime(infernal_strike) - 0 < 0.3 * BaseDuration(infernal_strike_debuff) and { not HasArtifactTrait(fiery_demise) or { SpellMaxCharges(infernal_strike) - Charges(infernal_strike count=0) } * SpellChargeCooldown(infernal_strike) < SpellCooldown(fiery_brand) + 5 } and { SpellCooldown(sigil_of_flame) > 7 or Charges(infernal_strike) == 2 } and Spell(infernal_strike) or target.DebuffExpires(frailty_debuff) and Spell(spirit_bomb) or target.DebuffPresent(fiery_brand_debuff) and Spell(soul_carver) or Pain() <= 80 and Spell(immolation_aura) or Pain() <= 70 and Spell(felblade) or Spell(soul_barrier) or BuffStacks(soul_fragments) == 5 and Spell(soul_cleave) or IncomingDamage(5) > MaxHealth() * 0.7 and Spell(fel_devastation) or IncomingDamage(5) >= MaxHealth() * 0.7 and Spell(soul_cleave) or Spell(fel_eruption) or target.DebuffRemaining(sigil_of_flame_debuff) - 0 <= 0.3 * BaseDuration(sigil_of_flame_debuff) and Spell(sigil_of_flame) or Pain() >= 80 and BuffStacks(soul_fragments) < 4 and IncomingDamage(4) <= MaxHealth() * 0.2 and Spell(fracture) or Pain() >= 80 and Spell(soul_cleave) or Spell(shear)
}

### actions.precombat

AddFunction VengeancePrecombatMainActions
{
	#flask,type=flask_of_the_seventh_demon
	#food,type=the_hungry_magister
	#augmentation,type=defiled
	Spell(augmentation)
}

AddFunction VengeancePrecombatMainPostConditions
{
}

AddFunction VengeancePrecombatShortCdActions
{
}

AddFunction VengeancePrecombatShortCdPostConditions
{
	Spell(augmentation)
}

AddFunction VengeancePrecombatCdActions
{
}

AddFunction VengeancePrecombatCdPostConditions
{
	Spell(augmentation)
}

### Vengeance icons.

AddCheckBox(opt_demonhunter_vengeance_aoe L(AOE) default specialization=vengeance)

AddIcon checkbox=!opt_demonhunter_vengeance_aoe enemies=1 help=shortcd specialization=vengeance
{
	if not InCombat() VengeancePrecombatShortCdActions()
	unless not InCombat() and VengeancePrecombatShortCdPostConditions()
	{
		VengeanceDefaultShortCdActions()
	}
}

AddIcon checkbox=opt_demonhunter_vengeance_aoe help=shortcd specialization=vengeance
{
	if not InCombat() VengeancePrecombatShortCdActions()
	unless not InCombat() and VengeancePrecombatShortCdPostConditions()
	{
		VengeanceDefaultShortCdActions()
	}
}

AddIcon enemies=1 help=main specialization=vengeance
{
	if not InCombat() VengeancePrecombatMainActions()
	unless not InCombat() and VengeancePrecombatMainPostConditions()
	{
		VengeanceDefaultMainActions()
	}
}

AddIcon checkbox=opt_demonhunter_vengeance_aoe help=aoe specialization=vengeance
{
	if not InCombat() VengeancePrecombatMainActions()
	unless not InCombat() and VengeancePrecombatMainPostConditions()
	{
		VengeanceDefaultMainActions()
	}
}

AddIcon checkbox=!opt_demonhunter_vengeance_aoe enemies=1 help=cd specialization=vengeance
{
	if not InCombat() VengeancePrecombatCdActions()
	unless not InCombat() and VengeancePrecombatCdPostConditions()
	{
		VengeanceDefaultCdActions()
	}
}

AddIcon checkbox=opt_demonhunter_vengeance_aoe help=cd specialization=vengeance
{
	if not InCombat() VengeancePrecombatCdActions()
	unless not InCombat() and VengeancePrecombatCdPostConditions()
	{
		VengeanceDefaultCdActions()
	}
}

### Required symbols
# augmentation
# casting_debuff
# consume_magic
# demon_spikes
# demon_spikes_buff
# empower_wards
# fel_devastation
# fel_eruption
# felblade
# fiery_brand
# fiery_brand_debuff
# fiery_demise
# fracture
# frailty_debuff
# immolation_aura
# infernal_strike
# infernal_strike_debuff
# metamorphosis_veng
# metamorphosis_veng_buff
# shear
# sigil_of_flame
# sigil_of_flame_debuff
# soul_barrier
# soul_carver
# soul_cleave
# spirit_bomb
]]
	OvaleScripts:RegisterScript("DEMONHUNTER", "vengeance", name, desc, code, "script")
end
