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

create table Member_of (
    team_id int,
    dev_id int,

    foreign key (team_id) references DevTeam(team_id),
    foreign key (dev_id) references Developer(dev_id)
);

create table Review (
    user_id int,
    game_id int,
    stars float,
    review_text text,
    date_time datetime default CURRENT_TIMESTAMP,

    foreign key (user_id) references User (user_id),
    foreign key (game_id) references Game (game_id)
);

create table Plays (
    user_id int,
    game_id int,
    score int,
    play_time time,

    foreign key (user_id) references User (user_id),
    foreign key (game_id) references Game (game_id)
);

create table Transactions (
    tx_id int,
    payer int,
    id int,
    id_type ENUM('USER', 'GAME', 'ITEM'),
    tx_amt float,
    tx_time datetime default CURRENT_TIMESTAMP,

    primary key (tx_id),
    check (tx_amt > 0)
);

create table Item (
    item_id int,
    item_name varchar(50),
    item_type ENUM('PLATFORM', 'GAME'),

    primary key (item_id)
);

create table PlatformItem (
    item_id int,
    item_cost float,
    item_creator int,

    foreign key (item_id) references Item (item_id),
    foreign key (item_creator) references User (user_id),
    check (item_cost >= 0)
);

create table GameItem (
    item_id int,
    quantity int,
    item_worth float,
    game_id int,

    foreign key (item_id) references Item (item_id),
    foreign key (game_id) references Game (game_id),
    check (quantity >= 0),
    check (item_worth >= 0)
);
