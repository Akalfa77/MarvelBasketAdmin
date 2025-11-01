--1.admin Table

CREATE TABLE `admin` (
    `admin_id` INT NOT NULL AUTO_INCREMENT,
    `admin_email` VARCHAR(255) NOT NULL UNIQUE,
    `admin_password` VARCHAR(255) NOT NULL,
    `admin_name` VARCHAR(100) NOT NULL,
    `admin_contact` VARCHAR(15) NOT NULL,
    PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--2.seller Table

CREATE TABLE `seller` (
    `seller_id` INT NOT NULL AUTO_INCREMENT,
    `seller_name` VARCHAR(100) NOT NULL,
    `seller_email` VARCHAR(255) NOT NULL UNIQUE,
    `seller_contact` VARCHAR(15) NOT NULL,
    `seller_password` VARCHAR(255) NOT NULL,
    `shop_name` VARCHAR(100) NOT NULL,
    `shop_address` TEXT NOT NULL,
    `seller_status` VARCHAR(20) NOT NULL, -- e.g., REQUESTED, APPROVED, STOPPED
    PRIMARY KEY (`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--3.user Table

CREATE TABLE `user` (
    `user_id` INT NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(100) NOT NULL,
    `last_name` VARCHAR(100) NOT NULL,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `password` VARCHAR(255) NOT NULL,
    `address` TEXT NOT NULL,
    `contact` VARCHAR(15) NOT NULL,
    PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4.category Table

CREATE TABLE `category` (
    `category_id` INT NOT NULL AUTO_INCREMENT,
    `category_name` VARCHAR(100) NOT NULL UNIQUE,
    PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 5.sellercategory Table

CREATE TABLE `sellercategory` (
    `seller_id` INT NOT NULL,
    `category_id` INT NOT NULL,
    PRIMARY KEY (`seller_id`, `category_id`),
    FOREIGN KEY (`seller_id`) REFERENCES `seller`(`seller_id`),
    FOREIGN KEY (`category_id`) REFERENCES `category`(`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--6.event Table

CREATE TABLE `event` (
    `event_id` INT NOT NULL AUTO_INCREMENT,
    `event_name` VARCHAR(255) NOT NULL,
    `event_date` DATE, -- Assuming DATE, might be DATETIME depending on com.bean.Event.getEventDate()
    `user_id` INT NOT NULL,
    PRIMARY KEY (`event_id`),
    FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--7.adminnotification Table

CREATE TABLE `adminnotification` (
    `notification_id` INT NOT NULL AUTO_INCREMENT,
    `from_id` INT NOT NULL,
    `visibility` VARCHAR(50) NOT NULL,
    `description` TEXT NOT NULL,
    `time` DATETIME DEFAULT CURRENT_TIMESTAMP, -- DATETIME is implied by update()
    PRIMARY KEY (`notification_id`),
    FOREIGN KEY (`from_id`) REFERENCES `seller`(`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--8.general Table

CREATE TABLE `general` (
    `product_id` INT NOT NULL AUTO_INCREMENT,
    `product_type` VARCHAR(50) NOT NULL,
    `product_name` VARCHAR(255) NOT NULL,
    `product_brand` VARCHAR(100),
    `product_description` TEXT,
    `product_price` DECIMAL(10, 2) NOT NULL, -- Assuming a decimal type for price
    `product_stock` INT NOT NULL,
    `product_images` TEXT,
    `seller_id` INT NOT NULL,
    `product_status` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`product_id`),
    FOREIGN KEY (`seller_id`) REFERENCES `seller`(`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--9.fashion Table

CREATE TABLE `fashion` (
    `fashion_id` INT NOT NULL AUTO_INCREMENT,
    `fashion_type` VARCHAR(50) NOT NULL,
    `fashion_buyertype` VARCHAR(50) NOT NULL,
    `fashion_name` VARCHAR(255) NOT NULL,
    `fashion_brand` VARCHAR(100),
    `fashion_color` VARCHAR(50),
    `fashion_description` TEXT,
    `fashion_images` TEXT,
    `seller_id` INT NOT NULL,
    `fashion_status` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`fashion_id`),
    FOREIGN KEY (`seller_id`) REFERENCES `seller`(`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--10.subfashion Table

CREATE TABLE `subfashion` (
    `subfashion_id` INT NOT NULL AUTO_INCREMENT,
    `fashion_id` INT NOT NULL,
    `fashion_size` VARCHAR(10) NOT NULL,
    `fashion_stock` INT NOT NULL,
    `fashion_price` DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (`subfashion_id`),
    FOREIGN KEY (`fashion_id`) REFERENCES `fashion`(`fashion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--11.electronic Table

CREATE TABLE `electronic` (
    `electronic_id` INT NOT NULL AUTO_INCREMENT,
    `electronic_type` VARCHAR(50) NOT NULL,
    `electronic_name` VARCHAR(255) NOT NULL,
    `electronic_brand` VARCHAR(100),
    `electronic_description` TEXT,
    `electronic_price` DECIMAL(10, 2) NOT NULL,
    `electronic_stock` INT NOT NULL,
    `electronic_size` VARCHAR(50),
    `electronic_color` VARCHAR(50),
    `electronic_weight` VARCHAR(50),
    `electronic_specification` TEXT,
    `electronic_images` TEXT,
    `seller_id` INT NOT NULL,
    `electronic_status` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`electronic_id`),
    FOREIGN KEY (`seller_id`) REFERENCES `seller`(`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--12.book Table

CREATE TABLE `book` (
    `book_id` INT NOT NULL AUTO_INCREMENT,
    `book_name` VARCHAR(255) NOT NULL,
    `author_name` VARCHAR(100) NOT NULL,
    `book_type` VARCHAR(50) NOT NULL,
    `book_price` DECIMAL(10, 2) NOT NULL,
    `book_stock` INT NOT NULL,
    `book_description` TEXT,
    `book_images` TEXT,
    `seller_id` INT NOT NULL,
    `book_status` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`book_id`),
    FOREIGN KEY (`seller_id`) REFERENCES `seller`(`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;