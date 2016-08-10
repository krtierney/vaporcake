# Vaporcake

"Ephemera" is a funny word. In the loosest sense, it simply refers to that which is fleeting— any item designed not to last, to fill a temporary space. It occasionally takes on connotations of worthlessness, a brief life for something that deserves no better. In another, more classical, sense, ephemera is anything that lasts for no more than a day: a mayfly, early television broadcasts, or the _Selenicereus grandiflorus_ blooming one night and withering before morning.

[Vaporcake](https://vaporcake.bandcamp.com) is a record label specialising in digital ephemera. Albums are released only online, and restricted to an ultra-limited number of downloads before transitioning to "out of print" status. A collaboration between experimental artists [Vapor Lanes](http://vaporlanes.bandcamp.com) and [The Kendal Mintcake](http://thekendalmintcake.bandcamp.com), Vaporcake toys with the idea of ephemera—a genre of memorabilia usually associated with faded newsprint or tear-stained letters—and juxtaposes this against the confusing nature of ephemera online. Even as online piracy reduces intellectual property concerns to a farcical game of cat-and-mouse, much of the web is still inherently ephemeral, stretching beyond the grasp of any internet archivist.  

![screen shot splash](https://cloud.githubusercontent.com/assets/2197306/17551743/bf4195ca-5ef3-11e6-9334-06ff7ac0274d.png) 


## Planning
The website for the Vaporcake label is more of an experience than a destination. After logging in, users are presented with a single question. An input box below encourages them to respond with a question of their own. This exchange kicks off an endless loop of questions and responses, probing the nature of consciousness, exploring musical perception, or crossing over into absurdity. Each response the user provides is added to the database of potential questions to be served to all users. The questions a user creates or answers are assigned to them and form an odd sort of user profile. As the user participates in the question loop, the questions asked of them, the questions they create, and any questions created by concurrently signed in users are all displayed in the background of the page. This text is layered and visually glitched into abstraction with Unicode combining characters.

This structure allows questions within the database to belong to users in two possible ways: as creators of that question, or as respondents of that question. In order to track these relationships, the database makes use of join tables and a has and belongs to many relationship with foreign keys connecting the user to their questions. Carefully planning this database structure was the crucial first step to success.

Once that puzzle was solved, I moved on to mapping out the user’s journey within the site, creating wireframes with Balsamiq. Users are immediately directed to log in or register upon accessing the site, but information about Vaporcake releases (the label's discography) does not require authorisation to access. Users have permission to edit their personal information or their question-responses. Administrators have additional privileges to edit or delete any question, regardless of creator. A simple CMS allows administrators to add, edit, or delete album releases in the discography. Administrators can also assign the admin role to other users.

![screen shot wireframes](https://cloud.githubusercontent.com/assets/2197306/17551741/bf3eeea6-5ef3-11e6-84af-d4f3c3c89248.png) 

### Project Requirements
This project was created for General Assembly’s Web Development Immersive, which includes two weeks of instruction on Ruby language as part of the 12-week course. Project #2 consolidates students’ knowledge of Ruby through the construction of a complete Rails application. The requirements of the project include:

* At least two data models, including one user model
* User registration and log in functionality with encrypted passwords and an authorisation flow
* RESTful routes for one of the resources
* Utilise an ORM to create a relational database

The third WDI project is a group project, so students are encouraged to practice utilising collaborative project management software throughout the course. Good version control etiquette is also an important ongoing practice: I made frequent commits to GitHub during the course of this project, with an emphasis on meaningful, descriptive commit messages scoped to specific feature implementations or bug fixes. I used Trello for task-management.

![screen shot Trello](https://cloud.githubusercontent.com/assets/2197306/17551744/bf47524e-5ef3-11e6-9303-fdfcaa5d96b9.png)
 
## Build
The application was built with Ruby on Rails (version 5.0.0) and uses a PostgreSQL database. Authentication is done using the Devise gem (4.2.0). Image uploading, for user images and album art, uses Carrierwave and RMagick. The release CMS accepts Markdown markup, which is rendered into HTML using Redcarpet.

I’ve also utilised some Javascript/jQuery for DOM manipulation to handle automatic resizing of text areas, and manipulation of text for the glitch/Zalgo effect. The movement of glitched text was accomplished using layered CSS keyframes animations.

![screen shot index](https://cloud.githubusercontent.com/assets/2197306/17551742/bf40b330-5ef3-11e6-87eb-b9fc8ac3df0a.png)

### Future plans
* Incorporate glitched images of current users into the main page above and below the Zalgo’d text.
* Determine which additional functionality Vaporcake would like to have: in-platform messaging? Adding user Twitter handles? Serving album downloads directly from the site? 

### Unsolved Problems
* __Testing__: This is an area the WDI course covers far too briefly for my taste. I spent one entire project day reading documentation and trying to implement testing, but came up short. I’m quite keen to learn more about how to configure testing environments, write effective tests, and track test coverage.

## Credits
Coding is made more joyful through a collaborative practice, but I firmly believe in giving credit where due. Credit for the interactive construct goes to Vaporcake, whose concept I’ve rendered to the best of my current ability. The Zalgofy.js script has been adapted from [eemo.net](https://eeemo.net) by tchouky, from which I’ve extracted the Unicode character tables and a portion of the logic, and refactored it into jQuery. Thanks also to pretty much everyone on Stack Overflow for their enduring contributions (which I hope to repay in kind sometime soon). The team at General Assembly have all been invaluable as well, with thanks due especially to instructors Mike Hayden and Alex Chin and teaching assistants Chanse Campbell, Rosanna Rossington, and Rane Gowan.