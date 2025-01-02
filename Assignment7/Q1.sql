CREATE DATABASE TASK
USE TASK
CREATE SCHEMA Q1
CREATE TABLE Q1.genres
(
	gen_id INT PRIMARY KEY IDENTITY,
	gen_title VARCHAR(20)
)
CREATE TABLE Q1.movie(
	move_id INT PRIMARY KEY IDENTITY,
	move_title VARCHAR(50),
	move_year INT,
	move_time INT,
	move_langi VARCHAR(50),
	move_dt_rel DATE,
	move_rel_country VARCHAR(5)
)
CREATE TABLE Q1.reviewer
(
	rev_id 	INT PRIMARY KEY IDENTITY,
	rev_name VARCHAR(30)
)
CREATE TABLE Q1.actor
(
	act_id INT PRIMARY KEY IDENTITY,
	act_fname VARCHAR(20),
	act_lname VARCHAR(20),
	act_gender VARCHAR(1)
)
CREATE TABLE Q1.director
(
	dir_id INT PRIMARY KEY IDENTITY,
	dir_fname VARCHAR(20),
	dir_lname VARCHAR(20)
)
CREATE TABLE Q1.movie_genres
(
	mov_id INT,
	gen_id INT
	PRIMARY KEY (mov_id , gen_id)
)
CREATE TABLE Q1.rating
(
	move_id INT,
	rev_id INT,
	rev_stars INT,
	num_o_ratings INT,
	FOREIGN KEY (move_id) REFERENCES Q1.movie(move_id) ON DELETE CASCADE ON UPDATE CASCADE ,
	FOREIGN KEY (rev_id) REFERENCES Q1.reviewer(rev_id) ON DELETE CASCADE ON UPDATE CASCADE, 
	PRIMARY KEY (move_id, rev_id)
)
CREATE TABLE Q1.movie_cast
(
	act_id INT,
	move_id INT,
	role VARCHAR(30)
	FOREIGN KEY (move_id) REFERENCES Q1.movie(move_id) ON DELETE CASCADE ON UPDATE CASCADE ,
	FOREIGN KEY (act_id) REFERENCES Q1.actor(act_id) ON DELETE CASCADE ON UPDATE CASCADE ,
	PRIMARY KEY (act_id, move_id)
)
CREATE TABLE Q1.movie_direction
(
	dir_id INT,
	mov_id INT,
	PRIMARY KEY (dir_id , mov_id)
)