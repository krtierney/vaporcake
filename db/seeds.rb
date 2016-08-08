require_relative "../app/models/question"
require_relative "../app/models/user"

["users", "questions"].each do |table_name|
  ActiveRecord::Base.connection.execute("TRUNCATE #{table_name} RESTART IDENTITY")
end

user1 = User.create(username: 'naxuu', is_admin:true, email: 'naxuu@example.com', password: 'password')
             
user2 = User.create(username: 'mintcake' is_admin:true, email: 'naxuu@example.com', password: 'password')

Question.create([
  { content: "Where is jazz?", creator_id: 1 },
  { content: "What form did it take?", creator_id: 1 },
  { content: "How can you play it without touching it?", creator_id: 1 },
  { content: "How is the internet helping?", creator_id: 1 },
  { content: "Saxophone solo?", creator_id: 1 },
  { content: "What if chords died after you used them?", creator_id: 1 },
  { content: "What has amplification ever done for you?", creator_id: 1 },
  { content: "Writing about music is like?", creator_id: 1 },
  { content: "Did you hear that?", creator_id: 1 },
  { content: "Who owns sounds?", creator_id: 1 },
  { content: "Is composition inherently more important than improvisation? ", creator_id: 1 },
  { content: "Why doesn't sharing it ruin it? Does it?", creator_id: 1 },
  { content:  "What do you think about when you listen to bluegrass?", creator_id: 2 },
  { content:  "As a concept, is punk dead?", creator_id: 2 },
  { content:  "Does music have charms to soothe a savage breast, soften rocks, or bend a knotted oak?", creator_id: 2 },
  { content:  "Are emojis a valid form of expression?", creator_id: 2 },
  { content:  "What’s wrong with millenials?", creator_id: 2 },
  { content:  "What do rap and country have in common?", creator_id: 2 },
  { content:  "Why don’t you look at the sun more often?", creator_id: 2 },
  { content:  "So you like music? Can you even name three music?", creator_id: 2 },
  { content:  "Do the rules of harmony reveal to us the inner workings of the universe?", creator_id: 2 },
  { content:  "Can one perform something that does not exist?", creator_id: 2 },
  { content:  "Do you remember the 90’s?", creator_id: 2 },
  { content:  "How many chords are there (show your work)?", creator_id: 2 }
]);