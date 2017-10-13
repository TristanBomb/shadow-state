$ideologies = {}

$ideologies.store(:centrism, {
	name: 'Centrism',   # Name of the ideology
	adj: 'Centrist',	# Adjective form of the ideology
	color: '#88a795',   # Associated display color
	group: :unaligned,  # Grouping of ideologies; by default these correspond to ethos, but they don't have to
	ethos: [1.0, 1.0, 1.0],	# Ethos generation from this ideology - [Society, Liberty, Authority]
	effects: {}			# Other modifiers from this ideology
})

$ideologies.store(:communism, {
	name: 'Communism',
	adj: 'Communist',
	color: '#811313',
	group: :society,
	ethos: [2.0, 0.0, 1.0],
	effects: {}
})

$ideologies.store(:syndicalism, {
	name: 'Syndicalism',
	adj: 'Syndicalist',
	color: '#f94931',
	group: :society,
	ethos: [3.0, 0.0, 0.0],
	effects: {}
})

$ideologies.store(:socialism, {
	name: 'Socialism',
	adj: 'Socialist',
	color: '#f48fb1',
	group: :society,
	ethos: [2.0, 1.0, 0.0],
	effects: {}
})

$ideologies.store(:progressivism, {
	name: 'Progressivism',
	adj: 'Progressive',
	color: '#7fd13c',
	group: :liberty,
	ethos: [1.0, 2.0, 0.0],
	effects: {}
})

$ideologies.store(:liberalism, {
	name: 'Liberalism',
	adj: 'Liberal',
	color: '#ffd217',
	group: :liberty,
	ethos: [0.0, 3.0, 0.0],
	effects: {}
})

$ideologies.store(:conservatism, {
	name: 'Conservatism',
	adj: 'Conservative',
	color: '#00b7d4',
	group: :liberty,
	ethos: [0.0, 2.0, 1.0],
	effects: {}
})

$ideologies.store(:nationalism, {
	name: 'Nationalism',
	adj: 'Nationalist',
	color: '#3f64b5',
	group: :authority,
	ethos: [0.0, 1.0, 2.0],
	effects: {}
})

$ideologies.store(:reactionism, {
	name: 'Reactionism',
	adj: 'Reactionary',
	color: '#762c95',
	group: :authority,
	ethos: [0.0, 0.0, 3.0],
	effects: {}
})

$ideologies.store(:fascism, {
	name: 'Fascism',
	adj: 'Fascist',
	color: '#37474f',
	group: :authority,
	ethos: [1.0, 0.0, 2.0],
	effects: {}
})
