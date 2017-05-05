# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
	
	geoff = User.create(username: 'Geoff', email: 'geoff@geoff.geoff', password: 'geoff1', password_confirmation: 'geoff1')
	amanda = User.create(username: 'Amanda', email: 'amanda@geoff.geoff', password: 'geoff1', password_confirmation: 'geoff1')
	blake = User.create(username: 'Blake', email: 'blake@geoff.geoff', password: 'geoff1', password_confirmation: 'geoff1')
	rob = User.create(username: 'Rob', email: 'rob@geoff.geoff', password: 'geoff1', password_confirmation: 'geoff1')




	roads_bridges_and_canals = Department.create(name: 'Roads, Bridges, and Canals', email: '311@miamidade.gov', phone: '3055923116', organization: 'Transportation and Public Works')
	traffic_signals_and_signs = Department.create(name: 'Traffic Signals and Signs', email: 'ts&s@miamidade.gov', phone: '', organization: 'Transportation and Public Works')
	road_debris = Department.create(name: 'FDOT Road Debris', email: 'Fdot.mtleg@dot.state.fl.us', phone: '8504144100', organization: 'Florida Department of Transportation')
	general_fdot = Department.create(name: 'FDOT General', email: 'Fdot.pio@dot.state.fl.us', phone: '8504144100', organization: 'Florida Department of Transportation')
	north_fdot = Department.create(name: 'FDOT North Maintenance Office', email: 'Fdot.pio@dot.state.fl.us', phone: '3056407197', organization: 'Florida Department of Transportation')
	south_fdot = Department.create(name: 'FDOT South Maintenance Office', email: 'Fdot.pio@dot.state.fl.us', phone: '3056407200', organization: 'Florida Department of Transportation')
	expressway_authority = Department.create(name: 'Miami Dade Expressway Authority', email: 'publiccomm@mdxway.com', phone: '', organization: '')
	tegus_fish_and_wildlife = Department.create(name: 'Florida Fish and Wildlife Conservation Commission', email: '311@miamidade.gov', phone: '18884834681', organization: '')
	gator_fish_and_wildlife = Department.create(name: 'Nuisance Alligator', email: '', phone: '8663924286', organization: 'Florida Fish and Wildlife Conservation Commission')
	mosquito_control = Department.create(name: 'Miami Dade Mosquito Control', email: '311@miamidade.gov', phone: '', organization: 'Solid Waste Management')
	animal_services = Department.create(name: 'Miami Dade Animal Services', email: 'pets@miamidade.gov', phone: '', organization: '')
	adoption = Department.create(name: 'Pet Adoption and Protection Center', email: 'pets@miamidade.gov', phone: '3058841101', organization: 'Miami Dade Animal Services')
	health = Department.create(name: 'Florida Department of Health', email: 'health@flhealth.gov', phone: '8502454444', organization: '')
	power_and_light = Department.create(name: 'Florida Power and Light', email: '', phone: '18004688243', organization: '')
	water_and_sewer = Department.create(name: 'Miami Dade Water and Sewer Department', email: '311@miamidade.gov', phone: '3052749272', organization: '')
	stormwater_utility = Department.create(name: 'Stormwater Utility', email: 'EnvtlComplaints@miamidade.gov', phone: '3053726688', organization: 'Department of Environmental Resources Management')
	public_info_turnpike = Department.create(name: 'Public Information Office for the Florida Turnpike', email: '', phone: '18007497453', organization: '')
	environmental_resources = Department.create(name: 'Department of Environmental Resources Management', email: 'EnvtlComplaints@miamidade.gov', phone: '3053726955', organization: '')

	Issue.create(description: 'Missing/Broken Water Cover', department: water_and_sewer)
	Issue.create(description: 'Water Main Break', department: water_and_sewer)
	Issue.create(description: 'Natural Flooding', department: stormwater_utility)
	Issue.create(description: 'Freshwater', department: water_and_sewer)
	Issue.create(description: 'Saltwater Intrusion', department: water_and_sewer)
	Issue.create(description: 'Disease', department: water_and_sewer)
	Issue.create(description: 'Standing Water', department: mosquito_control)
	Issue.create(description: 'General Waste Water', department: water_and_sewer)
	Issue.create(description: 'Spills/Overflows', department: environmental_resources)
	Issue.create(description: 'Trim Trees on Canal Bank', department: roads_bridges_and_canals)
	Issue.create(description: 'Blocked Canal', department: roads_bridges_and_canals)
	Issue.create(description: 'Canal Culvert Blocked', department: roads_bridges_and_canals)
	Issue.create(description: 'Canal Bank Needs Mowing', department: roads_bridges_and_canals)
	Issue.create(description: 'Canal Needs Cleaning', department: roads_bridges_and_canals)
	Issue.create(description: 'Traffic Signs', department: roads_bridges_and_canals)
	Issue.create(description: 'Street Sign Name Issue', department: roads_bridges_and_canals)
	Issue.create(description: 'Stop Sign Issue', department: roads_bridges_and_canals)
	Issue.create(description: 'Pothole', department: roads_bridges_and_canals)
	Issue.create(description: 'Damaged Sidewalk', department: roads_bridges_and_canals)
	Issue.create(description: 'US-1, SR-441, FL Turnpike', department: general_fdot)
	Issue.create(description: 'SR 113 (Airport Expressway), SR 836 (East-West Dolphin Expressway), SR 874 (Snapper Creek Expressway), SR 924 (Gratigny Parkway)', department: expressway_authority)
	Issue.create(description: 'Other', department: roads_bridges_and_canals)
	Issue.create(description: 'Palm Tree Frond Removal', department: road_debris)
	Issue.create(description: 'Traffic Lights', department: traffic_signals_and_signs)
	Issue.create(description: 'Street Lights', department: power_and_light)
	Issue.create(description: 'Power Lines Down', department: power_and_light)
	Issue.create(description: 'Leaning Pole', department: power_and_light)
	Issue.create(description: 'Deteriorated Pole', department: power_and_light)
	Issue.create(description: 'Power Blackout/Outage/Surge', department: power_and_light)
	Issue.create(description: 'Lost Animal', department: adoption)
	Issue.create(description: 'US-1, Kendall Drive, Bird Road, Tamiami Trail, expressways', department: general_fdot)
	Issue.create(description: 'State Road North of NW 54th st', department: north_fdot)
	Issue.create(description: 'State Road South of NW 54th st', department: south_fdot)
	Issue.create(description: 'Florida Turnpike, Sawgrass Expressway, and Homestead Extension', department: public_info_turnpike)
	Issue.create(description: 'In Public Waters', department: roads_bridges_and_canals)
	Issue.create(description: 'Large Scale Fish Kills or Duck Kills', department: animal_services) #health
	Issue.create(description: 'Animal Bite', department: animal_services)
	Issue.create(description: 'Crocodile/Alligator', department: gator_fish_and_wildlife)
	Issue.create(description: 'Mosquitos', department: mosquito_control)	
	tl = Issue.create(description: 'Tegus', department: tegus_fish_and_wildlife)



	Report.create(description: 'this is a description of the issue', user: amanda, picture_link: 'pic.jpg', latitude: 22.9, longitude: 31.2,  issue: tl)



