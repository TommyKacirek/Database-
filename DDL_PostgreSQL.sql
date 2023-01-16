CREATE TABLE IF NOT EXISTS bds."customer_detail" (
  customer_id SERIAL NOT NULL,
  membership_expiration DATE NOT NULL,
  shelve_number INT NOT NULL,
  PRIMARY KEY (customer_id))
;



CREATE TABLE IF NOT EXISTS bds."user" (
  user_id SERIAL NOT NULL,
  given_name VARCHAR(45) NOT NULL,
  family_name VARCHAR(45) NOT NULL,
  email VARCHAR(45) UNIQUE NOT NULL,
  phone_number VARCHAR(45) UNIQUE NOT NULL,
  born DATE NOT NULL,
  customer_detail_customer_id BIGINT,
  PRIMARY KEY (user_id),
  FOREIGN KEY (customer_detail_customer_id)
  REFERENCES bds."customer_detail" (customer_id))
;


CREATE TABLE IF NOT EXISTS bds."role" (
  role_id SERIAL NOT NULL,
  "type" VARCHAR(45) NOT NULL,
  PRIMARY KEY (role_id))
;



CREATE TABLE IF NOT EXISTS bds."borrow_type" (
  borrow_type_id SERIAL NOT NULL,
  type VARCHAR(45) NOT NULL,
  PRIMARY KEY (borrow_type_id))
;



CREATE TABLE IF NOT EXISTS bds."location" (
  location_id SERIAL NOT NULL,
  floor INT NOT NULL,
  location VARCHAR(45) NOT NULL,
  PRIMARY KEY (location_id))
;

CREATE TABLE IF NOT EXISTS bds."lang_name" (
  lang_id SERIAL UNIQUE,
  "name" VARCHAR(45)
);


CREATE TABLE IF NOT EXISTS bds."title" (
  title_id SERIAL NOT NULL,
  title_name VARCHAR(45) NOT NULL,
  publication_year INT NOT NULL,
  availability_present INT NOT NULL,
  availability_absent INT NOT NULL,
  PRIMARY KEY (title_id))
;



CREATE TABLE IF NOT EXISTS bds."copy" (
  copy_id SERIAL NOT NULL,
  type_of_borrow INT NOT NULL,
  release_year INT NOT NULL,
  borrowed BOOLEAN NOT NULL,
  lang_id INT NOT NULL,
  no_of_pages INT NOT NULL,
  height DECIMAL NOT NULL,
  depth DECIMAL NOT NULL,
  width DECIMAL NOT NULL,
  stock_location_mark VARCHAR(45) NOT NULL,
  borrow_type_borrow_type_id BIGINT NOT NULL,
  location_location_id BIGINT,
  title_title_id BIGINT NOT NULL,
  lang_name_lang_name_id BIGINT NOT NULL,
  PRIMARY KEY (copy_id)
  ,

    FOREIGN KEY (borrow_type_borrow_type_id)
    REFERENCES bds."borrow_type" (borrow_type_id)
    ,
    FOREIGN KEY (location_location_id)
    REFERENCES bds."location" (location_id)
    ,
    FOREIGN KEY (title_title_id)
    REFERENCES bds."title" (title_id)
,
    FOREIGN KEY (lang_name_lang_name_id)
    REFERENCES bds."lang_name" (lang_id)
    )
;



CREATE TABLE IF NOT EXISTS bds."borrow" (
  borrow_id SERIAL NOT NULL,
  release_date DATE NOT NULL,
  due_date TIMESTAMP(0) NOT NULL,
  extensions INT NOT NULL,
  user_user_id BIGINT NOT NULL,
  copy_copy_id BIGINT NOT NULL,
  PRIMARY KEY (borrow_id, user_user_id)
  ,
    FOREIGN KEY (user_user_id)
    REFERENCES bds."user" (user_id)
    ,
    FOREIGN KEY (copy_copy_id)
    REFERENCES bds."copy" (copy_id)
    )
;



CREATE TABLE IF NOT EXISTS bds."sign_in" (
  login_id SERIAL NOT NULL,
  login_email VARCHAR(45) NOT NULL,
  salt VARCHAR(45) NOT NULL,
  passwd_hash VARCHAR(100) NOT NULL,
  user_user_id BIGINT NOT NULL,
  PRIMARY KEY (login_id)
  ,
    FOREIGN KEY (user_user_id)
    REFERENCES bds."user" (user_id)
    )
;




CREATE TABLE IF NOT EXISTS bds."borrow_archive" (
  borrow_archive_id SERIAL NOT NULL,
  release_date DATE NOT NULL,
  date_of_return TIMESTAMP(0) NOT NULL,
  extensions INT NOT NULL,
  user_user_id BIGINT NOT NULL,
  copy_copy_id BIGINT NOT NULL,
  PRIMARY KEY (borrow_archive_id)
  ,
    FOREIGN KEY (user_user_id)
    REFERENCES bds."user" (user_id)
    ,
    FOREIGN KEY (copy_copy_id)
    REFERENCES bds."copy" (copy_id)
    )
;


CREATE TABLE IF NOT EXISTS bds."author" (
  author_id SERIAL NOT NULL UNIQUE,
  given_name VARCHAR(45) NOT NULL,
  family_name VARCHAR(45) NULL,
  born INT NOT NULL,
  died INT NULL,
  popularity_rank INT NULL)
;


CREATE TABLE IF NOT EXISTS bds."author_has_title" (
  author_author_id BIGINT NOT NULL,
  title_title_id BIGINT NOT NULL,
  PRIMARY KEY (author_author_id, title_title_id)
  ,
    FOREIGN KEY (author_author_id)
    REFERENCES bds."author" (author_id)
    ,
    FOREIGN KEY (title_title_id)
    REFERENCES bds."title" (title_id)
  )
;



CREATE TABLE IF NOT EXISTS bds."user_has_role" (
  user_user_id BIGINT NOT NULL,
  role_role_id BIGINT NOT NULL,
  PRIMARY KEY (user_user_id, role_role_id)
  ,
    FOREIGN KEY (user_user_id)
    REFERENCES bds."user" (user_id)
    ,
    FOREIGN KEY (role_role_id)
    REFERENCES bds."role" (role_id)
    )
;



CREATE TABLE IF NOT EXISTS bds."genre" (
  title_to_genre_id SERIAL NOT NULL,
  genre VARCHAR(100) NOT NULL,
  PRIMARY KEY (title_to_genre_id))
;



CREATE TABLE IF NOT EXISTS bds."genre_has_title" (
  genre_title_to_genre_id BIGINT NOT NULL,
  title_title_id BIGINT NOT NULL,
  PRIMARY KEY (genre_title_to_genre_id, title_title_id)
  ,
    FOREIGN KEY (genre_title_to_genre_id)
    REFERENCES bds."genre" (title_to_genre_id)
    ,
    FOREIGN KEY (title_title_id)
    REFERENCES bds."title" (title_id)
    )
;

CREATE TABLE IF NOT EXISTS bds.injection_attack (
  id BIGSERIAL NOT NULL UNIQUE,
  name VARCHAR(45) NOT NULL UNIQUE,
  username VARCHAR(45) NOT NULL,
  PRIMARY KEY (id));

