
drop schema if exists Condensation;
create schema Condensation;
use Condensation;

create table Users
(
	user_id int,
    fname varchar(64),
    lname varchar(64),
    email varchar(128),
    nickname varchar(128),
    account_num int,
    user_name varchar(128),
    primary key (user_id)
);


create table Company 
(
	company_id int,
    company_name varchar(64),
    account_number int, #United States Company Number
    avatar_url varchar(2048),
    primary key (company_id)
);

create table Game 
(
	game_id int not null auto_increment,
    publisher int,
    developer int,
    title varchar(64),
    description varchar(256),
    released date,
    uploader int,
    price double,
    esrb_rating varchar(64),
    esrb_content varchar(128),
    installer_url varchar(2048),
    primary key (game_id),
    foreign key (publisher) references Company(company_id),
    foreign key (developer) references Company(company_id)
);

# Things like links to facebook, twitter, their website.
create table CompanyLinks 
(
	company_id int,
    site varchar(64),
    link varchar(2048),
    primary key (company_id, site),
    foreign key (company_id) references Company(company_id)
);


create table GameGenre
(
	game_id int,
    genre_name varchar(128),
    primary key (game_id, genre_name),
    foreign key (game_id) references Game(game_id)
);


create table GameLanguage
(
	game_id int,
    game_language varchar(128),
    primary key (game_id, game_language),
    foreign key (game_id) references Game(game_id)
);


create table Achievements 
(
    achievement_id int,
    name varchar(128),
    description varchar(256),
    primary key (achievement_id)
);

create table GameAchievements
(
	game_id int,
    achievement_id int,
    primary key (game_id, achievement_id),
    foreign key (game_id) references Game(game_id),
    foreign key (achievement_id) references Achievements(achievement_id)
);
-- ================ Achievements ================

### Users and their constituantcies


create table UserAccount
(
	account_num int,
	user_id int,
	bank_routing_number int,
    bank_account_number int,
    primary key (user_id, account_num),
    foreign key (user_id) references Users(user_id)
);

create table Transactions
(
	transaction_num int auto_increment,
	user_id int not null,
    account_num int not null,
    game_id int not null,
    purchase_date datetime,
    purchase_amnt float,
    primary key (transaction_num)
);

alter table Transactions add
	foreign key (user_id) references Users(user_id);
alter table Transactions add
    foreign key (game_id) references Game(game_id);

create table OwnedGames
(
	user_id int,
    game_id int,
    transaction_num int,
    play_time datetime,
    rating boolean,
    primary key (user_id, game_id),
    foreign key (user_id) references Users(user_id),
    foreign key (game_id) references Game(game_id),
    foreign key (transaction_num) references Transactions(transaction_num)
);

### Marketing tables

create table Featured
(
	game_id int,
    start_date date,
    end_date date,
    primary key (game_id),
    foreign key (game_id) references Game(game_id)
);

create table OnSale
(
	game_id int,
    sale_fraction double,
    start_date date,
    end_date date,
    primary key(game_id),
    foreign key (game_id) references Game(game_id)
);

alter table Transactions add
    foreign key (account_num) references UserAccount(account_num);