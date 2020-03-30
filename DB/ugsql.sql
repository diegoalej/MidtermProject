-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema urbangardendb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `urbangardendb` ;

-- -----------------------------------------------------
-- Schema urbangardendb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `urbangardendb` DEFAULT CHARACTER SET utf8 ;
USE `urbangardendb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(65) NOT NULL,
  `last_name` VARCHAR(65) NOT NULL,
  `username` VARCHAR(100) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `enabled` TINYINT NOT NULL DEFAULT 1,
  `role` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NULL,
  `image_url` VARCHAR(5000) NULL,
  `address_id` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(250) NULL,
  `street2` VARCHAR(250) NULL,
  `zip_code` INT NULL,
  `city` VARCHAR(100) NULL,
  `state` VARCHAR(100) NULL,
  `country` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `garden_store_front`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `garden_store_front` ;

CREATE TABLE IF NOT EXISTS `garden_store_front` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `size` DOUBLE NOT NULL,
  `organic` TINYINT NOT NULL COMMENT 'THIS SUPPOSED TO BE A BOOLEAN!!!!!',
  `name_of_garden` VARCHAR(100) NOT NULL,
  `user_id` INT NOT NULL,
  `active` TINYINT NOT NULL DEFAULT 1,
  `description` VARCHAR(300) NULL,
  `fk_garden_address_id` INT NULL,
  `garden_url` VARCHAR(5000) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_garden_address_id`
    FOREIGN KEY (`fk_garden_address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_garden_store_front_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `product` ;

CREATE TABLE IF NOT EXISTS `product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `type` VARCHAR(100) NOT NULL,
  `description` VARCHAR(5000) NOT NULL,
  `size_of_product` ENUM('small', 'medium', 'large', 'extralarge') NULL,
  `image_url` VARCHAR(5000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `garden_produce`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `garden_produce` ;

CREATE TABLE IF NOT EXISTS `garden_produce` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `garden_id` INT NOT NULL,
  `produce_id` INT NOT NULL,
  `amount` INT NOT NULL,
  `active` TINYINT NOT NULL DEFAULT 1,
  `date_expected_available` DATE NULL,
  `date_harvested` DATE NULL,
  `date_expires` DATE NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_garden_produce_garden_id`
    FOREIGN KEY (`garden_id`)
    REFERENCES `garden_store_front` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_garden_produce_produce_id`
    FOREIGN KEY (`produce_id`)
    REFERENCES `product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trade_transaction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trade_transaction` ;

CREATE TABLE IF NOT EXISTS `trade_transaction` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `seller_id` INT NOT NULL,
  `buyer_id` INT NOT NULL,
  `enum_approved_rejected_waiting` ENUM('accpeted', 'rejected', 'waiting') NOT NULL DEFAULT 'waiting',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `line_item_recepit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `line_item_recepit` ;

CREATE TABLE IF NOT EXISTS `line_item_recepit` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `produce_id_traded` INT NOT NULL,
  `user_id` INT NOT NULL,
  `trade_transaction_id` INT NOT NULL,
  `boolean_was_seller` TINYINT NOT NULL,
  `amount_traded` INT NOT NULL,
  `comment` VARCHAR(200) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gardern_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gardern_rating` ;

CREATE TABLE IF NOT EXISTS `gardern_rating` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `garden_id` INT NOT NULL,
  `rating` INT NOT NULL,
  `comment` VARCHAR(250) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trade_request`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trade_request` ;

CREATE TABLE IF NOT EXISTS `trade_request` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `buyer_garden_id_request` INT NOT NULL,
  `seller_garden_id_request` INT NOT NULL,
  `buyer_produce_id` INT NOT NULL,
  `seller_produce_id` INT NOT NULL,
  `requested_amount_from_seller` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `offer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `offer` ;

CREATE TABLE IF NOT EXISTS `offer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `offer_date` DATETIME NOT NULL,
  `garden_produce_id` INT NOT NULL,
  `offered_produce_id` INT NOT NULL,
  `accepted_rejected` TINYINT NULL,
  `comment` VARCHAR(250) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_offer_give_garden_produce_id`
    FOREIGN KEY (`offered_produce_id`)
    REFERENCES `garden_produce` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_offer_receive_garden_produce_id`
    FOREIGN KEY (`garden_produce_id`)
    REFERENCES `garden_produce` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trade` ;

CREATE TABLE IF NOT EXISTS `trade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `trade_date` DATETIME NOT NULL,
  `offer_id` INT NOT NULL,
  `comment_by_buyer` VARCHAR(250) NULL,
  `rating_by_buyer` INT NULL,
  `comment_by_seller` VARCHAR(250) NULL,
  `rating_by_seller` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_trade_offer_id`
    FOREIGN KEY (`offer_id`)
    REFERENCES `offer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS gardenuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'gardenuser'@'localhost' IDENTIFIED BY 'gardenuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'gardenuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `urbangardendb`;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `enabled`, `role`, `phone_number`, `image_url`, `address_id`) VALUES (1, 'JJ', 'Smith', 'jjsmith', 'jjsmithpassword', 1, 'admin', NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `urbangardendb`;
INSERT INTO `address` (`id`, `street`, `street2`, `zip_code`, `city`, `state`, `country`) VALUES (1, '2345 Random Street', NULL, 80111, 'Denver', 'Colorado', 'United States');

COMMIT;


-- -----------------------------------------------------
-- Data for table `garden_store_front`
-- -----------------------------------------------------
START TRANSACTION;
USE `urbangardendb`;
INSERT INTO `garden_store_front` (`id`, `size`, `organic`, `name_of_garden`, `user_id`, `active`, `description`, `fk_garden_address_id`, `garden_url`) VALUES (1, 100, 1, 'Marge\'s Place', 1, DEFAULT, 'The best tomatoes you\'ve ever had. Also, I have honey.', 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `product`
-- -----------------------------------------------------
START TRANSACTION;
USE `urbangardendb`;
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (1, 'Tomatoes', 'Cherokee Purple', 'Large, Purple, Heirloom tomato', 'Large', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (2, 'Melon', 'Watermelon', 'Large, green, sweet melon', 'extralarge', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (3, 'Tomatoes', 'Generic', 'Tomatoes are America’s favorite garden vegetable. (Yes, we technically eat the fruit of the tomato plant, but it\'s used as a vegetable in eating and cooking and, thus, usually categorized in vegetables.) This vine plant is fairly easy to grow and will produce a bumper crop with proper care. Its uses are versatile, however, tomatoes are susceptible to a range of pests and diseases.', 'medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (4, 'Basil', 'Generic', 'Basil is a leafy, fragrant annual with a bushy appearance. The most common type of basil is sweet basil; other types include purple basil (less sweet than common basil), Lemon basil (lemon flavor), and Thai basil (licorice flavor). Basil is easy to grow and works well in Italian dishes, but it only grows in the summer, so plan accordingly.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (5, 'Lettuce', 'Generic', 'This is a half-hardy vegetable that you can keep growing all season long by planting one small crop at a time. Days to maturity tend to be short. Garden lettuce is far superior, in both taste and vitamin A content, to supermarket brands.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (6, 'Carrots', 'Generic', 'Carrots are a popular root vegetable that are easy to grow in sandy soil. They are resistant to most pests and diseases, and are a good late season crop that can tolerate frost. Not all carrots are orange; varieties vary in color from purple to white.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (7, 'Asparagus', 'Generic', 'Asparagus is a perennial bulb and stem vegetable that greets us every spring. It may take 2 to 3 years to get started and produce, so patience is needed! But then the plant can be productive up to 20 years, so we think it\'s worth the wait. Asparagus has male and female plants, with the female plants producing berries. Regions with cool winters are best for this cool-season crop.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (8, 'Beans', 'Generic', 'Pole and bush beans (more commonly called green beans) are a tender vegetable and a great addition to any garden, great eaten fresh off the plant or incorporated into a recipe. Bush beans require less maintenance, so they are easier to grow.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (9, 'Beets', 'Generic', 'Beets are a cool season vegetable crop. This root veggie grows quickly and has many different varieties which showcase deep red, yellow or white bulbs of different shapes. They can survive frost and almost freezing temperatures, which makes them a good choice for northern gardeners and an excellent long-season crop.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (10, 'Broccoli', 'Generic', 'Broccoli is a cool-season crop that, like spinach, can be grown in the spring or fall. In fact, you may be able to get a continual harvest throughout both seasons if you time planting correctly. A member of the cabbage family, broccoli is rich in vitamins.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (11, 'Brussels Sprouts', 'Generic', 'Brussels Sprouts are a member of the cabbage family, and an excellent source of protein and vitamins. They have a long growing season, and are generally more successful when grown for a fall harvest, as they only increase in flavor after a light frost or two.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (12, 'Cabbage', 'Generic', 'Cabbage is a hardy, leafy vegetable full of vitamins. It can be difficult to grow; it only likes cool temperatures, and it can be a magnet for some type of pests. By planning your growing season and providing diligent care, you may have two successful crops in one year, both spring and fall. Many varieties are available to suit both your growing conditions and taste preferences.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (13, 'Cauliflower', 'Generic', 'Cauliflower is a cool-season crop and a descendant of the common cabbage. It is more difficult to than its relatives because it does not tolerate the heat or cold as well. For this reason, cauliflower is usually grown commercially. If you plan to attempt growing cauliflower in the home garden, it requires consistently cool temperatures with temperatures in the 60s. Otherwise, it prematurely “button”—form small button-size heads—rather than forming one, nice white head.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (14, 'Celery', 'Generic', 'Celery is a long-season crop that can be tricky to grow, some might say, the trickiest of all. It likes fertile soil, cool temperatures, and constant moisture. It will not tolerate heat and can be hard to transplant. Summer crops in the north and winter crops in the south make celery a year-round producer. All the work is worth it when you harvest crunchy, green stalks.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (15, 'Chives', 'Generic', 'Chives are a perennial member of the onion family that sport beautiful purple flowers. Chives are cool-season, cold-tolerant perennials that are planted in early spring. Be mindful when planting this herb, as it will take over your garden if the flowers are left to ripen (the flowers scatter the seeds). However, this plant is easy to dig up and move if it overwhelms your garden.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (16, 'Collard Greens', 'Generic', 'Collard Greens are a hardy, cool-season green that are part of the cabbage family. They grow best in the spring and fall and can tolerate all fall frosts.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (17, 'Cucumbers', 'Generic', 'Cucumbers are a warm-season vegetable planted outside in the ground no earlier than 2 weeks after last spring frost date. Most varieties will grow in any amount of space, thanks to the plant\'s ability to climb. The most common varieties of slicing cucumbers have sprawling vines with large green leaves and curling tendrils. The growth of these plants is fast, and the crop yield is abundant if you care for them properly.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (18, 'Sweet Corn', 'Generic', 'Sweet corn is an annual with yellow, white, and bi-colored ears. A long, frost-free growing season is necessary after planting. Sweet corn is wind-pollinated, so it should be planted in blocks, rather than in single rows. Early, mid, and late-season varieties extend the harvest. If you miss the optimal harvest time, corn will go downhill fast as sugars convert to starch.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (19, 'Eggplant', 'Generic', 'Eggplants are short-lived perennial vegetables, but are usually cultivated as annuals. Also known as aubergines, eggplants differ mainly in size, shape and color of the fruits. Eggplants are tropical and subtropical, requiring relatively high temperatures. Related crop include tomatoes, potatoes and peppers.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (20, 'Onion', 'Generic', 'Onions are a cold-season crop, easy to grow because of their hardiness. We recommend using onion sets, which can be planted without worry of frost damage and have a higher success rate than direct seed or transplants. Onions grow well on raised beds or raised rows at least 4 inches high.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (21, 'Garlic', 'Generic', 'Garlic is easy to grow and produces numerous bulbs after a long growing season. It is frost tolerant. Beyond its intense flavor and culinary uses, “the stinking rose” is good in the garden as an insect repellent and has been used for centuries as a home remedy.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (22, 'Kale', 'Generic', 'Kale is a hardy, cool-season green that is part of the cabbage family. It grows best in the spring and fall and can tolerate all fall frosts. Kale can be used in salads or as a garnish and is rich in minerals and vitamins A and C.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (23, 'Cantaloupe', 'Generic', 'What we commonly refer to as ‘cantaloupe’ is actually not true cantaloupe, rather, a type of muskmelon. (True cantaloupe has a rough, warty rind and is not widely grown or commercially available in the US.) Muskmelons are a heat-loving fruit with a long growing season. Their cultural and growing requirements are very similar to other melons. They have a net-like, tan rind, and sweet orange flesh. The names muskmelon and cantaloupe are used interchangeably. We will use the name cantaloupe for this page to avoid confusion.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (24, 'Parsnips', 'Generic', 'Parsnips, popular with ancient Greeks and Romans, were brought over to the Americas with the first colonists. Although parsnips are biennials, they are usually grown as an annual vegetable. Parsnips are a hardy, cool-season crop that is best harvested after a hard frost. Parsnips are not only tasty in soups and stews, but can also be enjoyed by themselves.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (25, 'Peas', 'Generic', 'Peas are a cool-season crop, now coming in three separate varieties to suit your garden and cooking needs. They are: Pisum savitum, which includes both garden peas (sweet pea, inedible pod) and snow peas (edible flat pod with small peas inside) and Pisum macrocarpon, snap peas (edible pod with full-size peas). They are easy to grow, but with a very limited growing season. Furthermore, they do not stay fresh long after harvest, so enjoy them while you can!', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (26, 'Bell Peppers', 'Generic', 'Peppers are a tender, warm-season crop. They resist most pests and offer something for everyone: spicy, sweet or hot, and a variety of colors, shapes and sizes. For this page, we will focus on sweet bell peppers.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (27, 'Potatoes', 'Generic', 'This half hardy vegetable is a culinary staple, and yet is overlooked by many backyard gardeners. The taste and texture of home-grown potatoes are far superior to store bought, especially the early varieties. They need a cool climate, and also need to be watched to prevent sunburn. Potatoes can be grown as a winter crop in warmer climate zones.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (28, 'Pumpkins', 'Generic', 'Whether you use them for carving or cooking, pumpkins do not disappoint. Note that pumpkins do require a lot of food and a long growing season (generally from 75 to 100 frost-free days) so you need to plant them by late May in northern locations to early July in extremely southern states. Do not plant this tender vegetable until all danger of frost has passed and the soil is warmed as the seedlings will be injured or rot. (See the Almanac.com/Gardening page for frost dates.) That said, pumpkins are easy to maintain if you have the space.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (29, 'Radishes', 'Generic', 'Radishes are a hardy, cool-season vegetable that can produce many crops each season due to its rapid days to maturity. Radishes can be planted in both the spring and the fall, but growing should be suspended in the warmer months. They are a very easy vegetable to grow.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (30, 'Rhubarb', 'Generic', 'Rhubarb is a perennial vegetable, though it is generally used as a fruit in desserts and jams. You only eat the stalks, which have a rich tart flavor. The leaves of this plant are poisonous, so be sure that they are not ingested. Rhubarb is easy to grow, but needs cool weather to thrive.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (31, 'Spinach', 'Generic', 'This super-cold-hardy vegetable is a tender crop that can be planted in very early spring as well as fall and winter. Spinach has similar growing conditions and requirements as lettuce, but it is more versatile in both its nutrition and its ability to be eaten raw or cooked. It is higher in iron, calcium, and vitamins than most cultivated greens, and one of the best sources of vitamins A, B, and C.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (32, 'Summer Squash', 'Generic', 'Squash is a seasonal vegetable. It is very susceptible to frost and heat damage, but with proper care it will produce a bumper crop with very few plants. There are many varieties of summer squash to choose from, including zucchini. The main difference between winter and summer varieties is their harvest time; the longer growing period gives winter squash a tougher, inedible skin', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (33, 'Chard', 'Generic', 'Chard is a member of the beet family that does well in both cool and warm temperatures. It can be cooked or used raw in salads and is high in vitamins A and C.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (34, 'Turnips', 'Generic', 'Turnips are biennials usually grown as annuals. Although turnips are more of a staple in European kitchens, many southern gardeners like to grow them for their greens. Turnips take up to two months to mature. Turnips grow best in a temperate climate but can endure light frost. Fall crops are usually sweeter and more tender than spring crops—and pests are less of a problem.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (35, 'Watermelon', 'Generic', 'Everyone seems to love juicy watermelon in the summertime. Native to Africa, melons need warm temperatures (up to 80 degrees during the day) and a long growing season. Gardeners in colder climates can still have success in growing watermelon by starting seeds indoors and choosing short-season varieties. Days to maturity range from 70 to 90, depending on the variety.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (36, 'Winter Squash', 'Generic', 'Squash is a seasonal vegetable. It is very susceptible to frost and heat damage, but with proper care it will produce a bumper crop with very few plants. There are many varieties of summer squash to choose from, including zucchini. The main difference between winter and summer varieties is their harvest time; the longer growing period gives winter squash a tougher, inedible skin', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (37, 'Thyme', 'Generic', 'Thyme is a small perennial shrub with lots of branches and light purple to pink flowers. It\'s aromatic and has a pleasant, pungent, clover flavor. There are over fifty varieties used in cooking and gardening. English thyme is used most often in cooking.\n', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (38, 'Oregano', 'Generic', 'Oregano is a perennial with rose-purple or white flowers and a taste reminiscent of thyme. Its taste is zesty and strong and is commonly used in Italian dishes. Oregano is a hardy plant and makes a good ground cover.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (39, 'Rosemary', 'Generic', 'Rosemary is a perennial evergreen shrub with blue flowers. It is a pungent and distinctive plant with a sweet, resinous flavor. Rosemary is ideal for a rock garden or the top of a dry wall. It is used for poultry, lamb, stews, and soups.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (40, 'Cilantro', 'Generic', 'Coriander/cilantro is a fast-growing, aromatic herb that grows in the cooler weather of spring and fall. This herb is used to flavor many recipes and the entire plant is edible. The leaves are called cilantro and the seeds are called coriander.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (41, 'Parsley', 'Generic', 'Parsley is a biennial plant with bright green, featherlike leaves and is in the same family as dill. This herb is used in soups, sauces, and salads, and it lessens the need for salt in soups. Not only is it the perfect garnish, but also it is healthy; it’s rich in iron and vitamins A and C.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (42, 'Mint', 'Generic', 'Mint is a perennial with very fragrant, toothed leaves and tiny purple, pink, or white flowers. It has a fruity, aromatic taste. There are many varieties of mint—all fragrant, whether shiny or fuzzy, smooth or crinkled, bright green or variegated. However, you can always tell a member of the mint family by its square stem. Rolling it between your fingers, you’ll notice a pungent scent and think of candy, sweet teas, or maybe even mint juleps.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (43, 'Sage', 'Generic', 'Sage is a hardy perennial with soft, grayish green leaves. Its flower colors vary; they can be purple, pink, blue, or white. Common sage is used most commonly for cooking; it\'s a classic in stuffing.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (44, 'Tarragon', 'Generic', 'Tarragon is a perennial herb with long, light green leaves and tiny greenish or yellowish white flowers. For cooking, use French tarragon. Russian tarragon can easily be mistaken for French, but Russian tarragon is coarser and less flavorful than French tarragon.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (45, 'Okra', 'Generic', 'Okra is traditionally a southern U.S. plant that thrives in warm weather. It is easy to grow and use and looks great throughout the growing season due to its beautiful flowers. Okra is also rich in vitamin A and low in calories.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (46, 'Sweet Potato', 'Generic', 'The sweet potato is a warm-season, spreading vegetable of tropical origin. It is a good choice for a garden because it is easy to grow, is drought- / heat-tolerant, and has few pests or diseases. The sweet potato is also very nutritious and low in calories.', 'Medium', NULL);
INSERT INTO `product` (`id`, `name`, `type`, `description`, `size_of_product`, `image_url`) VALUES (47, 'Dill', 'Generic', 'Dill is an annual, self-seeding plant with feathery green leaves. It is used most commonly in soups, stews, and for pickling. Dill is easy to grow and attracts beneficial insects to your garden, such as wasps and other predatory insects.', 'Medium', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `garden_produce`
-- -----------------------------------------------------
START TRANSACTION;
USE `urbangardendb`;
INSERT INTO `garden_produce` (`id`, `garden_id`, `produce_id`, `amount`, `active`, `date_expected_available`, `date_harvested`, `date_expires`) VALUES (1, 1, 1, 12, 1, '2020-10-10', '2020-10-11', '2020-11-11');
INSERT INTO `garden_produce` (`id`, `garden_id`, `produce_id`, `amount`, `active`, `date_expected_available`, `date_harvested`, `date_expires`) VALUES (2, 1, 2, 1, 1, '2020-09-30', '2020-10-01', '2020-11-01');

COMMIT;


-- -----------------------------------------------------
-- Data for table `offer`
-- -----------------------------------------------------
START TRANSACTION;
USE `urbangardendb`;
INSERT INTO `offer` (`id`, `offer_date`, `garden_produce_id`, `offered_produce_id`, `accepted_rejected`, `comment`) VALUES (1, '2020-06-30', 1, 2, 1, 'We love your tomatoes');
INSERT INTO `offer` (`id`, `offer_date`, `garden_produce_id`, `offered_produce_id`, `accepted_rejected`, `comment`) VALUES (2, '2020-07-15', 2, 1, NULL, 'Your Melons make me happy');

COMMIT;


-- -----------------------------------------------------
-- Data for table `trade`
-- -----------------------------------------------------
START TRANSACTION;
USE `urbangardendb`;
INSERT INTO `trade` (`id`, `trade_date`, `offer_id`, `comment_by_buyer`, `rating_by_buyer`, `comment_by_seller`, `rating_by_seller`) VALUES (1, '2020-06-29', 1, 'Great transaction', 5, 'Great melons. Very juicy', 5);

COMMIT;

