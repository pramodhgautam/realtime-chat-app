
-- Host: 127.0.0.1
-- Pramod Gautam: 24 Sep 2024
-- MYSQL 8.0.39

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+05:45";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `websocket-chatapp`
--

-- --------------------------------------------------------

--
-- The structure of the 'groups' tabel
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `group_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data into tabel `groups`
--

INSERT INTO `groups` (`id`, `group_name`) VALUES
(100, 'group 1'),
(101, 'group 2');

-- --------------------------------------------------------

--
-- Structure of the `group_members` table
--

CREATE TABLE `group_members` (
  `group_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data into tabel `group_members`
--

INSERT INTO `group_members` (`group_id`, `user_id`) VALUES
(100, 1),
(100, 2),
(100, 3),
(101, 2),
(101, 3),
(101, 4);

-- --------------------------------------------------------

--
-- Structure of the `group_messages` table
--

CREATE TABLE `group_messages` (
  `id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `messages` varchar(255) DEFAULT NULL,
  `created_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data into tabel `group_messages`
--

INSERT INTO `group_messages` (`id`, `group_id`, `user_id`, `messages`, `created_datetime`) VALUES
(41, 100, 3, 'Halo kawan kawan', '2021-08-31 23:50:35'),
(42, 100, 2, 'Halo juga mario', '2021-08-31 23:50:45');

-- --------------------------------------------------------

--
-- Structure of the `messages` table
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `message_text` varchar(255) DEFAULT NULL,
  `message_from` int(11) DEFAULT NULL,
  `message_to` int(11) DEFAULT NULL,
  `created_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data into tabel `messages`
--

INSERT INTO `messages` (`id`, `message_text`, `message_from`, `message_to`, `created_datetime`) VALUES
(125, 'Hi Nelson', 1, 2, '2021-08-31 23:50:02'),
(126, 'Halo Ari, Apa Kabar?', 2, 1, '2021-08-31 23:50:11'),
(127, 'Baik', 1, 2, '2021-08-31 23:50:14'),
(128, 'Halo Mario', 2, 3, '2021-08-31 23:50:19'),
(129, 'Hi Nel', 3, 2, '2021-08-31 23:50:28');

-- --------------------------------------------------------

--
-- Structure of the `users` table
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data into tabel `users`
--

INSERT INTO `users` (`id`, `name`) VALUES
(1, 'Ari'),
(2, 'Nelson'),
(3, 'Mario'),
(4, 'Eliezer');

--
-- Indexes for dumped tables
--

--
-- Index for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Index for table `group_members`
--
ALTER TABLE `group_members`
  ADD KEY `group_id` (`group_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index for table `group_messages`
--
ALTER TABLE `group_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_from` (`message_from`),
  ADD KEY `message_to` (`message_to`);

--
-- Index for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for discarded tables
--

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for tabel `group_messages`
--
ALTER TABLE `group_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for tabel `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for the group_members table
--
ALTER TABLE `group_members`
  ADD CONSTRAINT `group_members_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for the `group_messages` table
--
ALTER TABLE `group_messages`
  ADD CONSTRAINT `group_messages_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `group_messages_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for the `messages` table
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`message_from`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`message_to`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
