-- drop table assistant_coach;
drop table coach;
drop table skill;
-- drop table player_coach;
-- drop table sport;
-- drop table skill_coach;
-- drop table player;
create table skill(
	skillname VARCHAR(50),
    constraint skill_pk primary key (skillname));
create table coach (
	lastname VARCHAR(50),
	firstname VARCHAR(50),
    coachname VARCHAR(50),
    headlineskill VARCHAR(50),
	constraint      coach_pk primary key (coachname),
    constraint coach_fk foreign key (headlineskill)
		references skill (skillname));
create table skill_coach(
coachname VARCHAR(50),
skillname VARCHAR(50),
constraint skill_coach_pk primary key (coachname,skillname),
constraint skill_coach_1 foreign key (coachname) 
	references coach (coachname),
constraint skill_coach_2 foreign key (skillname)
	references skill(skillname));
create table player (
	lastname VARCHAR(50),
	firstname VARCHAR(50),
    playername VARCHAR(50),
    playerNumber int,
    dateOfBirth date,
    dateJoinedClinic date,
	constraint      player_pk primary key (playername, playerNumber));
    
    create table sport (
    sportname VARCHAR(50),
    constraint sport_pk primary key (sportname));
    
    create table player_coach (
    playername VARCHAR(50),
    playerNumber int,
    coachname VARCHAR(50),
    sport VARCHAR(50),
    constraint      player_coach_pk primary key (playername,coachname),
    constraint      player_coaches_01 foreign key (playername, playerNumber)	
                    references player (playername, playerNumber),
	constraint      player_coaches_02 foreign key (coachname)	
                    references coach (coachname),
	constraint      player_coaches_sport foreign key (sport)
					references sport(sportname));
    
    create table assistant_coach (
	lastname VARCHAR(50),
	firstname VARCHAR(50),
    coach   VARCHAR(50),
	constraint      assistant_coach_pk primary key (firstname, lastname),
    constraint      assistant_coach_coach_fk foreign key (coach) 
					references coach(coachname));
    