require_relative "../app/models/question"
require_relative "../app/models/user"

["users", "questions", "releases"].each do |table_name|
  ActiveRecord::Base.connection.execute("TRUNCATE #{table_name} RESTART IDENTITY")
end

User.create([
  {
    username: "naxuu", 
    is_admin:true, 
    email: "naxuu@example.com", 
    password: "password",
    password_confirmation: "password",
    user_image: File.open(Rails.root.join 'db/images/naxuu.png')
  }, {
    username: "mintcake",
     is_admin:true, 
     email: "mintcake@example.com", 
     password: "password",
     password_confirmation: "password",
     user_image: File.open(Rails.root.join 'db/images/mintcake.jpg')
  }])

Question.create([
  { content: "Where is jazz?", creator_id: 1 },
  { content: "What form did it take?", creator_id: 1 },
  { content: "How can you play it without touching it?", creator_id: 1 },
  { content: "How is the internet helping?", creator_id: 1 },
  { content: "Saxophone solo?", creator_id: 1 },
  { content: "What if chords died after you used them?", creator_id: 1, response_id: 2 },
  { content: "What has amplification ever done for you?", creator_id: 1 },
  { content: "Writing about music is like?", creator_id: 1, response_id: 4 },
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
  { content:  "Why don’t you look at the sun more often?", creator_id: 2, response_id: 7 },
  { content:  "So you like music? Can you even name three music?", creator_id: 2 },
  { content:  "Do the rules of harmony reveal to us the inner workings of the universe?", creator_id: 2 },
  { content:  "Can one perform something that does not exist?", creator_id: 2, response_id: 9 },
  { content:  "Do you remember the 90’s?", creator_id: 2 },
  { content:  "How many chords are there (show your work)?", creator_id: 2 }
]);

Release.create([
  { 
    title: "steps³ (bonus day)", 
    description: "Recorded, mixed and mastered on October 6th, 2015 at Dr. Pirates Studio. Instruments: guitar, laptop, arturia microbrute, Korg super drums DDM-110. Thanks: Kirstie, PJ Harvey (cat), Broadcast (cat), Vaporcake crew, coffee, Nate for screwing up the date and giving me this bonus day, Adam for the two-hour coffee break outside on a splendid Chicago autumn afternoon. Released November 13, 2015. OUT OF PRINT.",
    artist: "cinchel",
    catalog_number: "vpk007",
    release_art: File.open(Rails.root.join 'db/images/vpk007.jpg')
}, { 
    title: "deep field", 
    description: "Recorded and assembled by Joshua Davison with The Origin of the Cosmos Ensemble at Skylight Heterodyne, 2015. Hi: Vaporcake Massive, Noiselife Slack, FOM, ASD, JPD, JGD. Released October 9, 2015. OUT OF PRINT.",
    artist: "joshua davison with the origin of the cosmos ensemble",
    catalog_number: "vpk006",
    release_art: File.open(Rails.root.join 'db/images/vpk006.jpg')
}, {
    title: "bodily colony", 
    description: "Recorded live in the basement of a former residence in Portland, Oregon, on a recent visit back there. Released May 22, 2015. OUT OF PRINT.",
    artist: "gregg skloff",
    catalog_number: "vpk005",
    release_art: File.open(Rails.root.join 'db/images/vpk005.jpg')
}, {
   title: "plays songs from cardew's treatise", 
   description: "I've loved avant-garde stuff for a long time; when I was a hell of a lot younger, I picked up a copy of John Zorn's 'Cobra' at Newbury Comics during a record shopping trip to Boston (you had to go to Boston to get 'the weird shit'). I was fascinated by it, and spent ages trying to figure out 'what the hell was going on'-- there was really no information about it (or Zorn) generally available, and in the time before the internet, it was a sort of beautiful mystery. I began collecting what I could by oddball composers, and as both CDs (which were cheaper to make) and the internet (which made stuff easier to find) grew, so did my collection. However, it never really occurred to me to try playing any of this stuff; it seemed like a black art, and the musicians seemed like sorcerers, conjuring music out of odd drawings, held signs, and mysterious scrawls. Sometime last year, it occurred to me that I could simply order a score and play it. Why this had never really occurred to me before, I don't know. Maybe the idea of the 'beautiful mystery' was something I thought would be ruined if I actually hunkered down and played some of this stuff, maybe I thought I wasn't 'up to it' musically, or maybe I'm lazy. It's probably the last one. Treatise was composed by Cornelius Cardew from 1963-1967. It's an imposing work, 193 pages in length, it's an entirely graphical score with no notes about instrumentation, or any instructions about how to perform it. While some people have used it as a jumping off point for improvisation, generally speaking, it's used as a score, with performers deciding in advance how to interpret it. Recordings of it are comparatively rare, and 'complete' ones rarer still (even at a zippy minute per page, you're talking three hours), so I wouldn't be overburdened by trying to 'match' a performance, and, by it's very nature, it's something which has no 'definitive' version. Originally, I'd wanted to perform it entirely for solo guitar, but early experiments with that proved mostly unsatisfying-- the score is often too dense for that to seem right to me, though 'Page 83' is a solo acoustic guitar, with no overdubs. I eventually grouped pages into 'songs', and decided to interpret each one as I saw fit, preparing in advance, making a few notes, and then letting the recording process dictate some of the interpretation. I kept to the guitar as the only instrument, adding in an old Califone turntable when I decided that numbers appearing on page 73 would correspond to 'rotations' of a record, and that pages 130-131 were for 'turntable and effects pedals'. This was all recorded onto an 8 track, using overdubs where the score dictated, built up 'in real time' in one at a time layers. It was a slower, more deliberate way of working, with the most dense pieces (page 3, pages 7-14) taking hours upon hours to get together. I think the results are 'truer' to the score than I would have got with my initial approach, and 'not faking it' created the dense, knotty and sometimes weirdly intricate music that emerged. It's a document of an interesting set of experiments, and ultimately the fulfillment of an artistic goal. I hope you enjoy the results as much as I enjoyed the process. Released April 3, 2015. OUT OF PRINT.",
   artist: "toaster",
   catalog_number: "vpk004",
   release_art: File.open(Rails.root.join 'db/images/vpk004.jpg')
}, {
    title: "relax its only been like 35 seconds, it could be forever (panic attack at a rave holotape simulation)", 
    description: "Daniel Sharp – known as madeofants in the world of glitch art – is a musician and visual artist who fills the audio spectrum with both light and stillness, taking the primitive building blocks of ambient techno and crafting them into something else entirely. Having spent his formative years as a frequent contributor to the experimental electronic and glitch art scene in Chicago, madeofants now resides in metro Detroit with his wife and two dumb cats. Thanks (in no particular order) - Joshua Sigman, Nick Wilson, Lindsey Sharp, Andrew Horton, Jason Coffman, Aroon Karuna, Mitch Mcconnell, Jason Shanley, the BSOD folks and everyone else who suffers through my knob twiddling. Released May 20, 2016. OUT OF PRINT.",
    artist: "madeofants",
    catalog_number: "vpk009",
    release_art: File.open(Rails.root.join 'db/images/vpk009.jpg')
}, {
    title: "shuffle", 
    description: "The listener is encouraged to fool around with the shuffle function on their player each time they hear this album. All thirteen tracks were created under moonlight, late one night in Auckland. Each time a track was finished the deck was shuffled and a card drawn to get the track name (Ace - King), repeating this step if the card number was already assigned. Source sounds were recorded in Sydney, Melbourne, Seattle, and Dallas: live gigs, field recordings, improv noise, live radio broadcast &c. Thank you to vaporcake for gifting The Doll this precious opportunity for sound exploration. Released March 17, 2016. OUT OF PRINT.",
    artist: "the doll",
    catalog_number: "vpk008",
    release_art: File.open(Rails.root.join 'db/images/vpk008.jpg')
}, {
    title: "queen victoria's mech suit", 
    description: "elizabethveldon.bandcamp.com
    www.facebook.com/pages/Elizabeth-Veldon/105863159517672
    Cover by may sanderson. Released February 20, 2015. OUT OF PRINT.",
    artist: "elizabeth veldon",
    catalog_number: "vpk003",
    release_art: File.open(Rails.root.join 'db/images/vpk003.jpg')
}, {
    title: "the advantage of activism", 
    description: "Shaun Blezard is a composer and improviser working with digital technology. Currently his interest lies in smart technology and his playing is based around an iPhone and iPad. Touch screen technology, accelerometers and wireless technology are opening up so many avenues of exploration in music and it is becoming much more like playing a traditional instrument. Shaun has been working with digital/electronic music for 20 years, starting with basic samplers in the 90’s, through various versions of laptop set ups, fx boards and current smart technology. Starting in the world of ambient dance, he has evolved into a skilled electronic musician, playing a range of styles from sound art installations to full on free improv, pushing for new ways of expression working with new technologies and how they integrate with traditional instrumentation. He has played with range of contemporary artists including Matthew Bourne, Ryoko Akama, Keith Jafratte, Charlie Collins, Shelley Knotts, Kalendar, Anton Hunter, Mick Beck, Martin Archer, Rachel Musson, Julie Kjær, Stephen Grew, Steve Lewis, Seth Bennett, Herve Perez, Susan Matthews and Yoko Miura. Shaun has also been the driving force in many online community projects – He ran one of the early successful net labels, Earth Monkey Productions. Over half a million downloads over 80 releases. Soundonation, a crowd sourced album (Live at The Bombed Out Church) where all sounds used were donated by the online community. World wide remix projects, the last being Cumbria Remixed which focused on the artists reworking the sounds of Cumbria. This model of community working has led to Shaun investigating online streaming of performances and ways to engage with other musicians – Shaun is currently researching this with fellow Hugs Bison and award winning digital technician Phil Powell. They are looking at ways for online performances to be a way of artists to get new audiences but also for artists to get paid, and for better ways for artists to collaborate online. Shaun made a series of field recording broadcasts over 3G from rural Cumbria as part of his mental health project A Safe Space, these included a library, a church and various fields. Released January 30, 2015. OUT OF PRINT.",
    artist: "shaun blezard",
    catalog_number: "vpk002",
    release_art: File.open(Rails.root.join 'db/images/vpk002.jpg')
}, {
    title: "(split)", 
    description: "Strictly limited to 10 downloads only. Released January 2, 2015. OUT OF PRINT.",
    artist: "vapor lanes / the kendal mintcake",
    catalog_number: "vpk001",
    release_art: File.open(Rails.root.join 'db/images/vpk001.jpg')
}])

