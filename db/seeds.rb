require "open-uri"
require "faker"

puts "To clean the database, run rails db:reset, trying to destroy each model doesn't work"
puts "-----------------"

puts "Seeding users"
pic = 1
9.times do
  User.create!(email: Faker::Internet.email,
               password: "password",
               password_confirmation: "password",
               member_details: { username: Faker::Name.first_name })
end
User.create!(email: "email@email.email",
             password: "password",
             password_confirmation: "password",
             member_details: { username: "William" })
puts "Done"
puts "-----------------"

puts "Attaching profile images"
Member.all.each do |member|
  member.profile_image.attach(io: File.open("#{Rails.root}/app/assets/images/seed-pics/profile-#{pic}.png"), filename: "#{pic}.png", content_type: "image/png")
  pic += 1
end
puts "Done"
puts "-----------------"

puts "Seeding guilds"
guild = Guild.new(name: "Praetorian", owner: User.last.member)
guild.icon.attach(io: File.open("#{Rails.root}/app/assets/images/seed-pics/guild-icon-1.jpg"), filename: "guild-icon-1.png", content_type: "image/jpg")
guild.image.attach(io: File.open("#{Rails.root}/app/assets/images/seed-pics/guild-image-1.jpg"), filename: "guild-image-1.png", content_type: "image/jpg")
guild.save!
puts "Done"

puts "-----------------"

puts "Seeding games"

Guild.all.each do |g|
  Game.new(guild: g)
  destiny = Game.new(guild: g, name: "Destiny 2")
  destiny.game_icon.attach(io: File.open("#{Rails.root}/app/assets/images/seed-pics/destiny.jpg"),
                           filename: "destiny-icon.png",
                           content_type: "image/png")
  destiny.game_banner.attach(io: File.open("#{Rails.root}/app/assets/images/seed-pics/destiny-banner.jpg"),
                             filename: "destiny-banner.jpg",
                             content_type: "image/jpg")
  destiny.save!

  wow = Game.new(guild: g, name: "World of Warcraft")
  wow.game_icon.attach(io: File.open("#{Rails.root}/app/assets/images/seed-pics/wow.png"),
                       filename: "wow-icon.png",
                       content_type: "image/png")
  wow.game_banner.attach(io: File.open("#{Rails.root}/app/assets/images/seed-pics/wow-banner.jpg"),
                         filename: "wow-banner.jpg",
                         content_type: "image/jpg")
  wow.save!

  warframe = Game.new(guild: g, name: "Warframe")
  warframe.game_icon.attach(io: File.open("#{Rails.root}/app/assets/images/seed-pics/warframe.png"),
                            filename: "warframe-icon.png",
                            content_type: "image/png")
  warframe.game_banner.attach(io: File.open("#{Rails.root}/app/assets/images/seed-pics/warframe-banner.jpg"),
                              filename: "warframe-banner.jpg",
                              content_type: "image/jpg")
  warframe.save!

  eso = Game.new(guild: g, name: "Elder Scrolls Online")
  eso.game_icon.attach(io: File.open("#{Rails.root}/app/assets/images/seed-pics/eso.jpg"),
                       filename: "eso-icon.jpg",
                       content_type: "image/jpg")
  eso.game_banner.attach(io: File.open("#{Rails.root}/app/assets/images/seed-pics/eso-banner.jpg"),
                         filename: "eso-banner.jpg",
                         content_type: "image/jpg")
  eso.save!
end
puts "Done"

puts "-----------------"

puts "Seeding events"
Guild.all.each do |g|
  Event.create(name: "Meet and Greet!",
               description: "Let's get to know each other!",
               start: DateTime.tomorrow,
               end: DateTime.tomorrow + 1.hour,
               guild: g)
end
Game.all.each do |game|
  Event.create(name: "Raid night",
               description: "Lets progress!",
               start: DateTime.now + 4.hours,
               end: DateTime.now + 8.hours,
               guild: game.guild,
               game: game)
end
puts "Done"

puts "-----------------"

puts "Adding members to guilds"
Member.all.each do |member|
  member.guild = Guild.first
  member.save
end
puts "Done"

puts "-----------------"

puts "Adding members to games"
names = %w[Darksareth Helmare Clambour Phantom Easydeeps Sullen Theclaw Warskullz Zisa Zephyr
           Adrokable Erosion Audionaut GabbaGoal Narutoes KrypticKiller Popples Sliver SloppyJoe TheDude
           ThickFilA TickleMeElmo VeniBuckets Ceril Duke Exile Mishap Noodlez Rhonin SlickRick
           Aethyric AgentSmith Aranko Bishop DanceMonkey Echozelle FootLoop Goontek Hookpunch Mystrel]
rank = ["Member", "Officer", "Recruit", "Veteran"]
Member.all.each do |member|
  Game.all.each do |game|
    name = names.sample
    GameMember.create(member: member,
                      game: game,
                      member_game_name: name,
                      details: rank.sample)
    names.delete(name)
  end
end
puts "Done"
puts "-----------------"

puts "Adding members to events"
Event.all.each do |event|
  Member.first(8).each do |member|
    EventMember.create(member: member, event: event)
  end
end

puts "Done"
