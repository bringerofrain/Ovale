Ovale.defaut["HUNTER"] =
[[
#Spells
Define(AIMEDSHOT 19434)
	SpellInfo(AIMEDSHOT cd=10 resetcounter=ss)
Define(ARCANESHOT 3044)
	SpellInfo(ARCANESHOT cd=6 resetcounter=ss)
Define(ASPECTOFTHEFOX 82661)
Define(ASPECTOFTHEHAWK 13165)
Define(BESTIALWRATH 19574)
	SpellInfo(BESTIALWRATH cd=120)
Define(BLACKARROW 3674)
	SpellInfo(BLACKARROW cd=26)
	SpellAddTargetDebuff(BLACKARROW BLACKARROW=15)
Define(CALLOFTHEWILD 53434)
Define(CHIMERASHOT 53209)
	SpellInfo(CHIMERASHOT cd=10 resetcounter=ss)
Define(COBRASHOT 77767)
Define(EXPLOSIVESHOT 53301)
	SpellInfo(EXPLOSIVESHOT cd=6 buffnocd=LOCKANDLOAD)
	SpellAddTargetDebuff(EXPLOSIVESHOT EXPLOSIVESHOT=2)
	SpellAddBuff(EXPLOSIVESHOT LOCKANDLOAD=-1)
Define(FERVOR 82726)
Define(FOCUSFIRE 82692)
Define(KILLCOMMAND 34026)
	SpellInfo(KILLCOMMAND cd=60 resetcounter=ss)
Define(KILLSHOT 53351)
	SpellInfo(KILLSHOT cd=15 resetcounter=ss)
Define(HUNTERSMARK 1130)
	SpellAddTargetDebuff(HUNTERSMARK HUNTERSMARK=300)
Define(MULTISHOT 2643)
Define(RAPIDFIRE 3045)
	SpellAddBuff(RAPIDFIRE RAPIDFIRE=10)
	SpellInfo(RAPIDFIRE cd=300 resetcounter=ss)
Define(READINESS 23989)
Define(SERPENTSTING 1978)
	SpellInfo(SERPENTSTING resetcounter=ss)
	SpellAddTargetDebuff(SERPENTSTING SERPENTSTING=15)
Define(STEADYSHOT 56641)
	SpellInfo(STEADYSHOT inccounter=ss)
Define(SILENCINGSHOT 34490)
	SpellInfo(SILENCINGSHOT resetcounter=ss)

#Buffs
Define(LOCKANDLOAD 56453)
Define(FRENZYEFFECT 19615)
Define(IMPROVEDSTEADYSHOT 53224)
Define(MARKEDFORDEATH 88691)
Define(FIRE 82926)

#Talents
Define(TALENTCHIMSHOT 2135)
Define(TALENTEXPLOSHOT 2145)
Define(TALENTTRACKING 1623)

#Trackings
Define(TRACKBEASTS 1494)
Define(TRACKDEMONS 19878)
Define(TRACKDRAGONKIN 19879)
Define(TRACKELEMENTALS 19880)
Define(TRACKGIANTS 19882)
Define(TRACKHUMANOIDS 19883)
Define(TRACKUNDEAD 19884) 

AddCheckBox(multi SpellName(MULTISHOT))
ScoreSpells(FOCUSFIRE KILLCOMMAND ARCANESHOT KILLSHOT STEADYSHOT SERPENTSTING
			CHIMERASHOT AIMEDSHOT
			BLACKARROW EXPLOSIVESHOT)

AddIcon help=main mastery=1
{
	if Mana(less 40) {Spell(FERVOR) Spell(STEADYSHOT)}
	if TargetBuffPresent(FRENZYEFFECT stacks=5 target=pet) Spell(FOCUSFIRE)
	if TargetDebuffExpires(SERPENTSTING 0 mine=1) and TargetDeadIn(more 8) Spell(SERPENTSTING)
	Spell(KILLCOMMAND)
	Spell(ARCANESHOT)
	if CheckBoxOn(multi) Spell(MULTISHOT)
	if TargetLifePercent(less 20) Spell(KILLSHOT)
	Spell(STEADYSHOT)
}

AddIcon help=main mastery=2
{
    if TargetLifePercent(less 20) Spell(KILLSHOT)
    if TargetDebuffExpires(SERPENTSTING 0 mine=1) and TargetDeadIn(more 8) Spell(SERPENTSTING)
    if TargetDebuffPresent(SERPENTSTING) Spell(CHIMERASHOT)
    if BuffPresent(FIRE) Spell(AIMEDSHOT)
    if Mana(less 44) or Counter(ss equal 1) Spell(STEADYSHOT)
    unless 1.6s before Spell(CHIMERASHOT) Spell(ARCANESHOT)
    if CheckBoxOn(multi) Spell(MULTISHOT)
    if Mana(more 66) Spell(ARCANESHOT)
    unless 0.25s before Spell(CHIMERASHOT) Spell(STEADYSHOT)
}

AddIcon help=main mastery=3
{
	if Mana(less 44) and BuffExpires(LOCKANDLOAD) Spell(STEADYSHOT)
	if Mana(more 44) and TargetDebuffExpires(BLACKARROW 0 mine=1) Spell(BLACKARROW)
	if Mana(more 24) and TargetDebuffExpires(SERPENTSTING 0 mine=1) and TargetDeadIn(more 8) Spell(SERPENTSTING)
	if TargetDebuffExpires(EXPLOSIVESHOT 0 mine=1) Spell(EXPLOSIVESHOT)
	if CheckBoxOn(multi) Spell(MULTISHOT)
	if TargetLifePercent(less 20) Spell(KILLSHOT)
	Spell(KILLCOMMAND)
	unless 1.5s before Spell(EXPLOSIVESHOT) Spell(STEADYSHOT)
}

AddIcon help=cd
{
	unless BuffPresent(ASPECTOFTHEHAWK) Spell(ASPECTOFTHEHAWK)
	if TalentPoints(TALENTTRACKING more 0) and Tracking(TRACKBEASTS no) and Tracking(TRACKDEMONS no) and Tracking(TRACKDRAGONKIN no)
			and Tracking(TRACKELEMENTALS no) and Tracking(TRACKGIANTS no) and Tracking(TRACKHUMANOIDS no) and Tracking(TRACKUNDEAD no)
				Spell(TRACKBEASTS)
	
	if TargetDebuffExpires(HUNTERSMARK 2) and TargetDebuffExpires(MARKEDFORDEATH 0) and TargetDeadIn(more 20) Spell(HUNTERSMARK nored=1)
	Spell(BESTIALWRATH usable=1)
	Item(Trinket0Slot usable=1)
	Item(Trinket1Slot usable=1)
	Spell(CALLOFTHEWILD usable=1)
	Spell(RAPIDFIRE)
	Spell(READINESS)
}
]]
