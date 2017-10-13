$countries.store(:russia, {
    name:		'United States',		# Short country name
    long_name:	'United States of America',	# Full country name
    adj:		'American',			# Country adjective
    flag:		'data/flags/usa.png',	# Directory to flag
    color:		'#37abc8',			# Map color
	gov_type:	:presidency,		# Form of government
	ideology:	:liberalism,		# Ruling ideology
	leader:		"Harry S. Truman",	# Leader name
	popular_ideo: {					# How popular various ideologies are
		communism:		1,
		syndicalism:	2,
		socialism:		6,
		progressivism:	18,
		liberalism:		30,
		conservatism:	25,
		nationalism:	11,
		reactionism:	5,
		fascism:		2
	},
    ethos: 		[10.0, 50.0, 10.0],	# Stored ethos
	diplo:		10.0,				# Stored diplomatic capital
	prestige:	10.0,				# Stored prestige
	cash:		1000.0,				# Stored money
	stability:	0.80,				# How stable the country is (0.00 to 1.00)
	techs: {						# Technologies developed by this country
		atomic_bomb: true
	},
	modifiers: {}					# Misc modifiers
})
