-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 12 2019 г., 19:26
-- Версия сервера: 10.3.13-MariaDB
-- Версия PHP: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `bookshop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `authors`
--

CREATE TABLE `authors` (
  `id_author` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `patronymic` varchar(255) NOT NULL,
  `date_birth` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `books`
--

CREATE TABLE `books` (
  `id_book` int(11) NOT NULL,
  `name_book` varchar(255) NOT NULL,
  `id_section` int(11) NOT NULL,
  `id_author` int(11) NOT NULL,
  `id_provider` int(11) NOT NULL,
  `id_publishing` int(11) NOT NULL,
  `year_publishing` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `date_delivery` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `buyers`
--

CREATE TABLE `buyers` (
  `id_buyer` int(11) NOT NULL,
  `fio` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `number` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id_order` int(11) NOT NULL,
  `id_buyer` int(11) NOT NULL,
  `id_book` int(11) NOT NULL,
  `number_orders` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `sum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `providers`
--

CREATE TABLE `providers` (
  `id_provider` int(11) NOT NULL,
  `number_provider` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `publishing`
--

CREATE TABLE `publishing` (
  `id_publishing` int(11) NOT NULL,
  `name_publishing` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sections`
--

CREATE TABLE `sections` (
  `id_section` int(11) NOT NULL,
  `name_section` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id_author`);

--
-- Индексы таблицы `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id_book`),
  ADD KEY `id_section` (`id_section`,`id_author`,`id_provider`,`id_publishing`),
  ADD KEY `id_author` (`id_author`),
  ADD KEY `id_publishing` (`id_publishing`),
  ADD KEY `id_provider` (`id_provider`);

--
-- Индексы таблицы `buyers`
--
ALTER TABLE `buyers`
  ADD PRIMARY KEY (`id_buyer`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_buyer` (`id_buyer`,`id_book`),
  ADD KEY `id_book` (`id_book`);

--
-- Индексы таблицы `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id_provider`);

--
-- Индексы таблицы `publishing`
--
ALTER TABLE `publishing`
  ADD PRIMARY KEY (`id_publishing`);

--
-- Индексы таблицы `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id_section`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `authors`
--
ALTER TABLE `authors`
  MODIFY `id_author` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `books`
--
ALTER TABLE `books`
  MODIFY `id_book` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `buyers`
--
ALTER TABLE `buyers`
  MODIFY `id_buyer` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `providers`
--
ALTER TABLE `providers`
  MODIFY `id_provider` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `publishing`
--
ALTER TABLE `publishing`
  MODIFY `id_publishing` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `sections`
--
ALTER TABLE `sections`
  MODIFY `id_section` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`id_author`) REFERENCES `authors` (`id_author`),
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`id_publishing`) REFERENCES `publishing` (`id_publishing`),
  ADD CONSTRAINT `books_ibfk_3` FOREIGN KEY (`id_provider`) REFERENCES `providers` (`id_provider`),
  ADD CONSTRAINT `books_ibfk_4` FOREIGN KEY (`id_section`) REFERENCES `sections` (`id_section`);

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `books` (`id_book`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`id_buyer`) REFERENCES `buyers` (`id_buyer`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
