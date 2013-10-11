class SeedDb
  def self.add_users(num)
    num.times do
      user = User.new( name: Faker::Name.name,
                        email: Faker::Internet.email,
                        password: "test",
                        password_confirmation: "test")  
      user.save
    end 
end 

def self.create_deck(deck_title, cards)
  deck = Deck.new( name: deck_title)

  deck.save

  cards.each do |c|
      card = Card.new( question: c[:q],
                       answer: c[:a] )
      deck.cards << card
  end 
end

end 

cards_urban = [ {q: "When an individual has no affinity for any sex, only love for pomegranates.", a: "Pomosexuality"},
         {q: "Wasting time and energy.  Being generally unproductive even though you have a lot of very important stuff to do.", a: "Congressing"},
         {q: "Someone who routinely does things that would be awesome, if intentional.", a: "Accidental Jedi" },
         {q: "Fear of sobering up.", a: "FOSU"},
         {q: "Unrestricted power to fart at one's own discretion.", a: "Farte Blanche"} ]

SeedDb.create_deck("Urban Dictionary", cards_urban)

cards_onion = [{q: "Justin Bieber's Pet Monkey Quarantined in Germany", a: "Not"},
            {q: "Atlanta-Area Church To Burn Ceremonially Throughout Olympics", a: "Onion"},
            {q: "Chipmunk's Plan For Future Better Crafted Than That Of 8 Out Of 10 Americans", a: "Onion"},
            {q: "Robin Thicke Is Really Sorry To Sue Marvin Gaye's Heirs", a: "Not"},
            {q: "Tyrannical African Despot Installs Suggestion Box", a: "Onion"},
            {q: "Feed-the-Bear Experiment Draws Public-Safety Worry", a: "Not"},
            {q: "Please, no more fried eggs, Death Valley officials say", a: "Not"}]

SeedDb.create_deck("Onion Or Not", cards_onion)

cards_techcrunch = [
                    {q: "n.: (used as a substitute for) speech regarded as meaningless or stupid, or to comment on a foolish or stupid action.", a: "derp"},
                    {q: "n.: fear of missing out: anxiety that an exciting or interesting event may currently be happening elsewhere, often aroused by posts seen on a social media website.", q: "FOMO"},
                    {q: "n.: a proposed development of the Internet in which everyday objects have network connectivity, allowing them to send and receive data.", a: "internet of things"},
                    {q: "n.: a period of time during which a person refrains from using electronic devices such as smartphones or computers, regarded as an opportunity to reduce stress or focus on social interaction in the physical world.", a: "digital detox"},
                    {q: "n.: a digital currency in which transactions can be performed without the need for a central bank.", a: "bitcoin"},
                    {q: "n.: a course of study made available over the Internet without charge to a very large number of people.", a: "MOOC"},
                    {q: "v.: withdraw one's liking or approval of (a web page or posting on a social media website that one has previously liked).", a: "unlike"}
                  ]

SeedDb.create_deck("TechCrunch Dictionary", cards_techcrunch)


# def self.create_game(user_id, deck_id)
  
#     round = Round.create( user_id: user_id, deck_id: deck_id )

#     cards = round.deck.cards


# end 

SeedDb.add_users(10)
