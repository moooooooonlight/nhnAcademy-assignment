CREATE TABLE `TagType` (
	`id`	int	NOT NULL,
	`name`	varchar(20)	NOT NULL
);

CREATE TABLE `User` (
	`id`	int	NOT NULL,
	`email`	varchar(255)	NOT NULL,
	`password`	varchar(255)	NOT NULL,
	`nickname`	varchar(20)	NOT NULL,
	`created_at`	datetime	NOT NULL,
	`deleted_at`	datetime	NULL
);

CREATE TABLE `Comment` (
	`id`	int	NOT NULL,
	`author_id`	int	NOT NULL,
	`post_id`	int	NOT NULL,
	`content`	text	NOT NULL,
	`likes`	int	NOT NULL,
	`is_hidden`	boolean	NOT NULL,
	`created_at`	datetime	NOT NULL,
	`deleted_at`	datetime	NULL,
	`parent_comment_id`	int	NULL
);

CREATE TABLE `Tag` (
	`id`	int	NOT NULL,
	`type_id`	int	NOT NULL,
	`name`	varchar(20)	NULL
);

CREATE TABLE `Category` (
	`id`	int	NOT NULL,
	`name`	varchar(20)	NOT NULL
);

CREATE TABLE `Movie` (
	`id`	int	NOT NULL,
	`platform_id`	int	NOT NULL,
	`tag_id`	int	NOT NULL,
	`title`	varchar(255)	NOT NULL,
	`director`	varchar(255)	NOT NULL,
	`genre`	varchar(20)	NULL,
	`release_date`	date	NOT NULL,
	`poster_url`	varchar(2048)	NULL
);

CREATE TABLE `Message` (
	`id`	int	NOT NULL,
	`receiver_id`	int	NOT NULL,
	`sender_id`	int	NOT NULL,
	`title`	varchar(255)	NOT NULL,
	`content`	text	NOT NULL,
	`created_at`	datetime	NOT NULL
);

CREATE TABLE `Brand` (
	`id`	int	NOT NULL,
	`tag_id`	int	NOT NULL,
	`name`	varchar(255)	NOT NULL,
	`logo_url`	varchar(2048)	NULL
);

CREATE TABLE `Platform` (
	`id`	int	NOT NULL,
	`tag_id`	int	NOT NULL,
	`name`	varchar(20)	NOT NULL,
	`logo_url`	varchar(2048)	NULL
);

CREATE TABLE `TempPost` (
	`id`	int	NOT NULL,
	`board_id`	int	NOT NULL,
	`author_id`	int	NOT NULL,
	`title`	varchar(255)	NOT NULL,
	`content`	text	NOT NULL
);

CREATE TABLE `Subscribe` (
	`id`	int	NOT NULL,
	`subscriber_id`	int	NOT NULL,
	`subscribed_to_id`	int	NOT NULL
);

CREATE TABLE `Board` (
	`id`	int	NOT NULL,
	`category_id`	int	NOT NULL,
	`name`	varchar(20)	NOT NULL,
	`is_thumbnail_required`	boolean	NOT NULL
);

CREATE TABLE `PostTags` (
	`id`	int	NOT NULL,
	`tag_id`	int	NOT NULL,
	`post_id`	int	NOT NULL
);

CREATE TABLE `BoardTagTypes` (
	`id`	int	NOT NULL,
	`tag_type_id`	int	NOT NULL,
	`board_id`	int	NOT NULL
);

CREATE TABLE `Scrap` (
	`id`	int	NOT NULL,
	`user_id`	int	NOT NULL,
	`post_id`	int	NOT NULL
);

CREATE TABLE `Post` (
	`id`	int	NOT NULL,
	`author_id`	int	NOT NULL,
	`board_id`	int	NOT NULL,
	`title`	varchar(255)	NOT NULL,
	`content`	text	NOT NULL,
	`hit`	int	NOT NULL,
	`likes`	int	NOT NULL,
	`thumbnail_url`	varchar(2048)	NULL,
	`created_at`	datetime	NOT NULL,
	`deleted_at`	datetime	NULL
);

ALTER TABLE `TagType` ADD CONSTRAINT `PK_TAGTYPE` PRIMARY KEY (
	`id`
);

ALTER TABLE `User` ADD CONSTRAINT `PK_USER` PRIMARY KEY (
	`id`
);

ALTER TABLE `Comment` ADD CONSTRAINT `PK_COMMENT` PRIMARY KEY (
	`id`,
	`author_id`,
	`post_id`
);

ALTER TABLE `Tag` ADD CONSTRAINT `PK_TAG` PRIMARY KEY (
	`id`,
	`type_id`
);

ALTER TABLE `Category` ADD CONSTRAINT `PK_CATEGORY` PRIMARY KEY (
	`id`
);

ALTER TABLE `Movie` ADD CONSTRAINT `PK_MOVIE` PRIMARY KEY (
	`id`,
	`platform_id`,
	`tag_id`
);

ALTER TABLE `Message` ADD CONSTRAINT `PK_MESSAGE` PRIMARY KEY (
	`id`,
	`receiver_id`
);

ALTER TABLE `Brand` ADD CONSTRAINT `PK_BRAND` PRIMARY KEY (
	`id`,
	`tag_id`
);

ALTER TABLE `Platform` ADD CONSTRAINT `PK_PLATFORM` PRIMARY KEY (
	`id`,
	`tag_id`
);

ALTER TABLE `TempPost` ADD CONSTRAINT `PK_TEMPPOST` PRIMARY KEY (
	`id`,
	`board_id`,
	`author_id`
);

ALTER TABLE `Subscribe` ADD CONSTRAINT `PK_SUBSCRIBE` PRIMARY KEY (
	`id`,
	`subscriber_id`
);

ALTER TABLE `Board` ADD CONSTRAINT `PK_BOARD` PRIMARY KEY (
	`id`,
	`category_id`
);

ALTER TABLE `PostTags` ADD CONSTRAINT `PK_POSTTAGS` PRIMARY KEY (
	`id`,
	`tag_id`,
	`post_id`
);

ALTER TABLE `BoardTagTypes` ADD CONSTRAINT `PK_BOARDTAGTYPES` PRIMARY KEY (
	`id`,
	`tag_type_id`,
	`board_id`
);

ALTER TABLE `Scrap` ADD CONSTRAINT `PK_SCRAP` PRIMARY KEY (
	`id`,
	`user_id`,
	`post_id`
);

ALTER TABLE `Post` ADD CONSTRAINT `PK_POST` PRIMARY KEY (
	`id`,
	`author_id`,
	`board_id`
);

ALTER TABLE `Comment` ADD CONSTRAINT `FK_User_TO_Comment_1` FOREIGN KEY (
	`author_id`
)
REFERENCES `User` (
	`id`
);

ALTER TABLE `Comment` ADD CONSTRAINT `FK_Post_TO_Comment_1` FOREIGN KEY (
	`post_id`
)
REFERENCES `Post` (
	`id`
);

ALTER TABLE `Comment` ADD CONSTRAINT `FK_Comment_TO_Comment_1` FOREIGN KEY (
	`parent_comment_id`
)
REFERENCES `Comment` (
	`id`
);

ALTER TABLE `Tag` ADD CONSTRAINT `FK_TagType_TO_Tag_1` FOREIGN KEY (
	`type_id`
)
REFERENCES `TagType` (
	`id`
);

ALTER TABLE `Movie` ADD CONSTRAINT `FK_Platform_TO_Movie_1` FOREIGN KEY (
	`platform_id`
)
REFERENCES `Platform` (
	`id`
);

ALTER TABLE `Movie` ADD CONSTRAINT `FK_Tag_TO_Movie_1` FOREIGN KEY (
	`tag_id`
)
REFERENCES `Tag` (
	`id`
);

ALTER TABLE `Message` ADD CONSTRAINT `FK_User_TO_Message_1` FOREIGN KEY (
	`receiver_id`
)
REFERENCES `User` (
	`id`
);

ALTER TABLE `Message` ADD CONSTRAINT `FK_User_TO_Message_2` FOREIGN KEY (
	`sender_id`
)
REFERENCES `User` (
	`id`
);

ALTER TABLE `Brand` ADD CONSTRAINT `FK_Tag_TO_Brand_1` FOREIGN KEY (
	`tag_id`
)
REFERENCES `Tag` (
	`id`
);

ALTER TABLE `Platform` ADD CONSTRAINT `FK_Tag_TO_Platform_1` FOREIGN KEY (
	`tag_id`
)
REFERENCES `Tag` (
	`id`
);

ALTER TABLE `TempPost` ADD CONSTRAINT `FK_Board_TO_TempPost_1` FOREIGN KEY (
	`board_id`
)
REFERENCES `Board` (
	`id`
);

ALTER TABLE `TempPost` ADD CONSTRAINT `FK_User_TO_TempPost_1` FOREIGN KEY (
	`author_id`
)
REFERENCES `User` (
	`id`
);

ALTER TABLE `Subscribe` ADD CONSTRAINT `FK_User_TO_Subscribe_1` FOREIGN KEY (
	`subscriber_id`
)
REFERENCES `User` (
	`id`
);

ALTER TABLE `Subscribe` ADD CONSTRAINT `FK_User_TO_Subscribe_2` FOREIGN KEY (
	`subscribed_to_id`
)
REFERENCES `User` (
	`id`
);

ALTER TABLE `Board` ADD CONSTRAINT `FK_Category_TO_Board_1` FOREIGN KEY (
	`category_id`
)
REFERENCES `Category` (
	`id`
);

ALTER TABLE `PostTags` ADD CONSTRAINT `FK_Tag_TO_PostTags_1` FOREIGN KEY (
	`tag_id`
)
REFERENCES `Tag` (
	`type_id`
);

ALTER TABLE `PostTags` ADD CONSTRAINT `FK_Post_TO_PostTags_1` FOREIGN KEY (
	`post_id`
)
REFERENCES `Post` (
	`id`
);

ALTER TABLE `BoardTagTypes` ADD CONSTRAINT `FK_TagType_TO_BoardTagTypes_1` FOREIGN KEY (
	`tag_type_id`
)
REFERENCES `TagType` (
	`id`
);

ALTER TABLE `BoardTagTypes` ADD CONSTRAINT `FK_Board_TO_BoardTagTypes_1` FOREIGN KEY (
	`board_id`
)
REFERENCES `Board` (
	`id`
);

ALTER TABLE `Scrap` ADD CONSTRAINT `FK_User_TO_Scrap_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `User` (
	`id`
);

ALTER TABLE `Scrap` ADD CONSTRAINT `FK_Post_TO_Scrap_1` FOREIGN KEY (
	`post_id`
)
REFERENCES `Post` (
	`id`
);

ALTER TABLE `Post` ADD CONSTRAINT `FK_User_TO_Post_1` FOREIGN KEY (
	`author_id`
)
REFERENCES `User` (
	`id`
);

ALTER TABLE `Post` ADD CONSTRAINT `FK_Board_TO_Post_1` FOREIGN KEY (
	`board_id`
)
REFERENCES `Board` (
	`category_id`
);

