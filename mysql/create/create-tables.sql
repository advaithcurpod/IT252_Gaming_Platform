use gaming_platform;
create table User (
    user_id int primary key auto_increment,
    user_name varchar(50) not null unique,
    password varchar(50) not null
);
create table Player (
    player_id int primary key,
    coins int default 0,
    account_level enum('noob', 'beginner', 'pro', 'legend') default 'noob',
    foreign key (player_id) references User(user_id),
    check(coins >= 0),
    check(player_id >= 0)
);
create table Developer (
    dev_id int primary key,
    dev_role varchar(50) not null,
    cash_earned int default 0,
    skill_rating float default 0.0,
    foreign key (dev_id) references Player(player_id),
    check(cash_earned >= 0)
);
create table Chats (
    player1_id int not null,
    player2_id int not null,
    message varchar(10000),
    primary key (player1_id, player2_id),
    foreign key (player1_id) references Player (player_id),
    foreign key (player2_id) references Player (player_id),
    check(player1_id <> player2_id)
);
create table DevTeam (
    team_id int,
    team_name varchar(50) not null,
    primary key (team_id)
);
create table Game (
    game_id int primary key,
    game_name varchar(50) not null unique,
    game_price float not null,
    description text not null,
    tags text not null,
    team_id int,
    foreign key (team_id) references DevTeam(team_id),
    check(game_price >= 0)
);
create table Member_of (
    team_id int,
    dev_id int,
    primary key(team_id, dev_id),
    foreign key (team_id) references DevTeam(team_id),
    foreign key (dev_id) references Developer(dev_id)
);
create table Review (
    user_id int,
    game_id int,
    stars float,
    review_text text,
    date_time datetime default CURRENT_TIMESTAMP,
    primary key (user_id, game_id),
    foreign key (user_id) references User (user_id),
    foreign key (game_id) references Game (game_id)
);
create table Plays (
	user_id int not null,
    game_id int not null,
    score int default 0,
    play_time time default (cast("00:00:00" as time)),
    primary key (user_id, game_id),
    foreign key (user_id) references User (user_id),
    foreign key (game_id) references Game (game_id),
    check(score >= 0)
);
create table Transactions (
    tx_id int primary key,
    payer int not null,
    id int not null,
    id_type ENUM('USER', 'GAME', 'ITEM') not null,
    tx_amt float not null,
    tx_time datetime default CURRENT_TIMESTAMP,
    check (tx_amt > 0)
);
create table Item (
    item_id int primary key,
    item_name varchar(50),
    item_type ENUM('PLATFORM', 'GAME')
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