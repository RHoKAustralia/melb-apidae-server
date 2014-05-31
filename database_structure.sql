-- --------------------------------------------------------

--
-- Table structure for table `audio`
--

CREATE TABLE IF NOT EXISTS `audio` (
  `audio_id` int(11) NOT NULL AUTO_INCREMENT,
  `audio_title` varchar(45) DEFAULT NULL,
  `audio_desc` varchar(500) DEFAULT NULL,
  `audio` blob,
  PRIMARY KEY (`audio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(500) NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `country_id` int(3) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(250) DEFAULT NULL,
  `country_code` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `picture`
--

CREATE TABLE IF NOT EXISTS `picture` (
  `picture_id` int(11) NOT NULL AUTO_INCREMENT,
  `picture_title` varchar(45) DEFAULT NULL,
  `picture_desc` varchar(500) DEFAULT NULL,
  `picture` blob,
  `flickr_id` int(100) DEFAULT NULL,
  PRIMARY KEY (`picture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(250) NOT NULL,
  `facebook_pageid` int(100) DEFAULT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_comments`
--

CREATE TABLE IF NOT EXISTS `project_comments` (
  `project_comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) DEFAULT NULL,
  `picture_id` int(11) DEFAULT NULL,
  `story_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL,
  `audio_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`project_comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_story`
--

CREATE TABLE IF NOT EXISTS `project_story` (
  `story_id` int(11) NOT NULL AUTO_INCREMENT,
  `story_name` varchar(250) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `village_id` int(11) NOT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `submitted_by` int(11) DEFAULT NULL,
  `project_desc` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`story_id`),
  KEY `village_id_fk` (`village_id`),
  KEY `project_id_fk` (`project_id`),
  KEY `submitted_by_fk` (`submitted_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_story_audio`
--

CREATE TABLE IF NOT EXISTS `project_story_audio` (
  `audio_id` int(11) NOT NULL,
  `story_id` varchar(45) NOT NULL,
  PRIMARY KEY (`audio_id`,`story_id`),
  KEY `projct_story_audio_fk` (`audio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project_story_picture`
--

CREATE TABLE IF NOT EXISTS `project_story_picture` (
  `picture_id` int(11) NOT NULL,
  `story_id` varchar(45) NOT NULL,
  PRIMARY KEY (`picture_id`,`story_id`),
  KEY `project_story_pic_picfk` (`picture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project_story_video`
--

CREATE TABLE IF NOT EXISTS `project_story_video` (
  `video_id` int(11) NOT NULL,
  `story_id` varchar(45) NOT NULL,
  PRIMARY KEY (`video_id`,`story_id`),
  KEY `project_story_pic_picfk` (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project_tags`
--

CREATE TABLE IF NOT EXISTS `project_tags` (
  `project_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) DEFAULT NULL,
  `picture_id` int(11) DEFAULT NULL,
  `story_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL,
  `audio_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`project_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `facebook_email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE IF NOT EXISTS `video` (
  `video_id` int(11) NOT NULL AUTO_INCREMENT,
  `video_title` varchar(45) DEFAULT NULL,
  `video_desc` varchar(500) DEFAULT NULL,
  `youtube_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `village`
--

CREATE TABLE IF NOT EXISTS `village` (
  `village_id` int(11) NOT NULL AUTO_INCREMENT,
  `village_name` varchar(45) DEFAULT NULL,
  `country_id` int(3) DEFAULT NULL,
  `rank` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`village_id`),
  KEY `country_id_fk` (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `project_story`
--
ALTER TABLE `project_story`
  ADD CONSTRAINT `project_id_fk` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `submitted_by_fk` FOREIGN KEY (`submitted_by`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `village_id_fk` FOREIGN KEY (`village_id`) REFERENCES `village` (`village_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `project_story_audio`
--
ALTER TABLE `project_story_audio`
  ADD CONSTRAINT `projct_story_audio_fk` FOREIGN KEY (`audio_id`) REFERENCES `audio` (`audio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `project_story_picture`
--
ALTER TABLE `project_story_picture`
  ADD CONSTRAINT `project_story_pic_picfk` FOREIGN KEY (`picture_id`) REFERENCES `picture` (`picture_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `project_story_video`
--
ALTER TABLE `project_story_video`
  ADD CONSTRAINT `project_story_pic_videofk0` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `village`
--
ALTER TABLE `village`
  ADD CONSTRAINT `country_id_fk` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
