require "open-uri"

puts "To clean the database, run rails db:reset, trying to destroy each model doesn't work"
puts "-----------------"

puts "Seeding users"
User.create(email: "email@email.email", password: "password", password_confirmation: "password", member_details: { username: "Username" })
User.create(email: "another@email.email", password: "password", password_confirmation: "password", member_details: { username: "dlkfjgdlkfghj" })
User.create(email: "and@another.email", password: "password", password_confirmation: "password", member_details: { username: "oesnauiynfodef" })
puts "Done"

puts "-----------------"

puts "Seeding guilds"
Guild.create!(name: "Guild 1", owner: User.first.member)
puts "Done"

puts "-----------------"

puts "Seeding games"
Guild.all.each do |guild|
  3.times do |i|
    g = Game.new(name: "Game #{i}", guild: guild)
    g.game_icon.attach(io: File.open("#{Rails.root}/app/assets/images/50.png"), filename: "default_game_icon.png", content_type: "image/png")
    g.save!
  end
end
puts "Done"

puts "-----------------"

puts "Seeding guild events (1 per guild)"
Guild.all.each do |guild|
  Event.create(name: "Guild event", description: "I am so tired", start: DateTime.now, end: DateTime.now + 1.day, guild: guild)
end
puts "Done"

puts "-----------------"

puts "Seeding game events (2 per game)"
Game.all.each do |game|
  2.times do
    Event.create(name: "Game event", description: "I am so tired", start: DateTime.now, end: DateTime.now + 1.day, guild: game.guild, game: game)
  end
end
puts "Done"

puts "-----------------"

puts "Adding members to guilds"
Member.all.each do |member|
  member.guild = Guild.first
  member.save
end
puts "Done"
