-
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `submitted_by`, `comment`) VALUES
(1, 1, 'SOLAR VERY GOOD!I love electricity,more sun power more better'),
(3, 3, 'I feel so good now that I have clean water. Thank you'),
(4, 2, 'So happy that can see at night and charge phone now');

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `country_name`, `country_code`) VALUES
(1, 'Fiji', 'FJ'),
(3, 'Solomon Islands', 'SB');

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`project_id`, `project_name`, `facebook_pageid`) VALUES
(1, 'Solar Panels Project', NULL),
(2, 'HIV Education', NULL),
(3, 'Water sanitisation', NULL);

--
-- Dumping data for table `project_comments`
--

INSERT INTO `project_comments` (`project_comment_id`, `tag_id`, `picture_id`, `story_id`, `video_id`, `audio_id`, `project_id`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, 1),
(3, NULL, NULL, NULL, NULL, NULL, 3),
(4, NULL, NULL, NULL, NULL, NULL, 1);

--
-- Dumping data for table `project_story`
--

INSERT INTO `project_story` (`story_id`, `story_name`, `project_id`, `village_id`, `latitude`, `longitude`, `submitted_by`, `project_desc`) VALUES
(1, 'Votua Solar PAnels', 1, 1, '-16.6687758', '178.7171101', 2, 'Solar panel project desc'),
(2, 'Vadravadra Water Project', 3, 3, '-17.5127817', '177.6964974', 1, 'Vadravadra Water Project description');

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `facebook_email`) VALUES
(1, 'lauren', 'lauren.baird@gmail.com'),
(2, 'Api', NULL),
(3, 'Vanchar', NULL),
(4, 'Louii', NULL),
(5, 'Dupis', NULL),
(6, 'Vanid', NULL);

--
-- Dumping data for table `village`
--

INSERT INTO `village` (`village_id`, `village_name`, `country_id`, `rank`) VALUES
(1, 'Votua', 3, 0),
(2, 'Atori', 3, 0),
(3, 'Vadravadra', 1, 0),
(4, 'Koroqaqa', 1, 0),
(5, 'Tukuraki', 1, 0);
