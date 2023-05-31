# Add seed data in this file
puts "Seeding spells..."

# these are the spells we want to add to the database
spells = ["acid-arrow", "animal-messenger", "calm-emotions", "charm-person"]

# iterate over each spell 
spells.each do |spell|

    response = RestClient.get "https://www.dnd5eapi.co/api/spells/#{spell}"

    # the response will come back as a JSON-formated string.
    # use JSON.parse to convert this string to a ruby hash:
    spell_hash = JSON.parse(response)

    # create a spell in the database using the data form this hash: 
    Spell.create(
        name: spell_hash["name"],
        level: spell_hash["level"],
        description: spell_hash["desc"][0] #returns an array, so we need to access the first index to get just a string of the description 
    )
end 

puts "Done seeding!"