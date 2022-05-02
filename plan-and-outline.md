# Transations Table
Add current "timestamp" as an attribute, add type attribute, change "payee" to "id" (could be the game id or the item id)
Keeping track of which player owns which item

# Triggers
1. "account level" in PLAYER gets updated based on the score in PLAYS table
2. when "stars" attribute in REVIEW table is updated, manipulate cash_earned and skill_rating in developer table
3. whenever a tx is added, create a trigger to credit the appropriate entity (this could be split into multiple procedures)

# Procedures
1. start_playing_game() -> start the game
2. stop_playing_game() -> stop playing game
play time could determine the coins earned by the player

create a temp table to store the same
3. view all the Tx made by the user, on a particular day, to a game and stuff like that..
4. order the games by "stars" and that will be storred in a view
5. create a function to compute the average rating of each game (each rating is taken from the review)
6. find all the users, a particular user has chatted with
7. find all the items in a particular game
8. find the items owned by a player by looking at the Tx table
9. find amount of money spent by an individual user from Tx table.

# View
1. ordering the top players
2. ordering the top games
3. ordering the top developers
4. a view which shows which teams made which games
