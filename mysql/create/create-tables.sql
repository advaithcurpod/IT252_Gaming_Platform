use gaming_platform;

create table User (
	user_id int primary key,
    user_name varchar(50) not null unique,
    password varchar(50) not null
);

create table Player (
	player_id int,
    coins int default 0,
    
    -- not sure if account level should be int or string or like BASIC, SILVER, GOLD or float.
    account_level int default 0,
    
    primary key (player_id),
    foreign key (player_id) references User(user_id)
);

create table Developer (
	dev_id int,
    dev_role varchar(50) not null,
    cash_earned int default 0,
    
    -- assuming all ratings to be out of 5
    skill_rating float default 3.5,
    
    primary key (dev_id),
    foreign key (dev_id) references Player(player_id)
);

create table Chats (
	player1_id int not null,
    player2_id int not null,
    message varchar(10000),
    primary key (player1_id, player2_id),
    foreign key (player1_id) references Player (player_id),
    foreign key (player2_id) references Player (player_id),
    constraint diff_players check(player1_id <> player2_id)
);

create table DevTeam (
	team_id int,
    team_name varchar(50) not null,
    primary key (team_id)
);

create table Game (
	game_id int,
    game_name varchar(50) not null unique,
    game_price float not null,
    description varchar(200) not null,
    tags varchar(50) not null,
    primary key (game_id),
    constraint valid_price check(game_price>=0)
);
