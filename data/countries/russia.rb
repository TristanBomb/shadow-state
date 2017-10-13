$countries.store(:russia, {
    name:		'Soviet Union',		# Short country name
    long_name:	'Union of Soviet Socialist Republics',	# Full country name
    adj:		'Soviet',			# Country adjective
    flag:		'data/flags/russia_ussr.png',		# Directory to flag
    color:		'#800000',			# Map color
	gov_type:	:dictatorship,		# Form of government
	ideology:	:communism,			# Ruling ideology
	leader:		"Josef Stalin",		# Leader name
	popular_ideo: {					# How popular various ideologies are
		communism:		71,
		syndicalism:	6,
		socialism:		11,
		progressivism:	6,
		liberalism:		2,
		conservatism:	1,
		nationalism:	0,
		reactionism:	2,
		fascism:		1
	},
    ethos: 		[10.0, 40.0, 20.0],	# Stored ethos
	diplo:		10.0,				# Stored diplomatic capital
	prestige:	10.0,				# Stored prestige
	cash:		1000.0,				# Stored money
	stability:	0.80,				# How stable the country is (0.00 to 1.00)
	techs: {},						# Technologies developed by this country
	modifiers: {}					# Misc modifiers
})
