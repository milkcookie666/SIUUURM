-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: suuuiv20
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `manager_user`
--

DROP TABLE IF EXISTS `manager_user`;
/*!50001 DROP VIEW IF EXISTS `manager_user`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `manager_user` AS SELECT 
 1 AS `manager_id`,
 1 AS `login`,
 1 AS `user_password`,
 1 AS `user_type`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `clients_information`
--

DROP TABLE IF EXISTS `clients_information`;
/*!50001 DROP VIEW IF EXISTS `clients_information`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `clients_information` AS SELECT 
 1 AS `id клиента`,
 1 AS `название колонки`,
 1 AS `значение колонки`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `manager_client`
--

DROP TABLE IF EXISTS `manager_client`;
/*!50001 DROP VIEW IF EXISTS `manager_client`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `manager_client` AS SELECT 
 1 AS `manager_id`,
 1 AS `client_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `order_information`
--

DROP TABLE IF EXISTS `order_information`;
/*!50001 DROP VIEW IF EXISTS `order_information`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `order_information` AS SELECT 
 1 AS `id заказа`,
 1 AS `id клиента`,
 1 AS `позиция`,
 1 AS `категория товара`,
 1 AS `цена товара за шт.`,
 1 AS `итоговая сумма заказа`,
 1 AS `количество товара`,
 1 AS `количество позиций`,
 1 AS `имя поставщика`,
 1 AS `дата заказа`,
 1 AS `длительность доставки в днях`,
 1 AS `id менеджера`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `manager_user`
--

/*!50001 DROP VIEW IF EXISTS `manager_user`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `manager_user` AS select `managers`.`manager_id` AS `manager_id`,`users`.`login` AS `login`,`users`.`user_password` AS `user_password`,`user_type`.`user_type` AS `user_type`,`managers`.`first_name` AS `first_name`,`managers`.`last_name` AS `last_name`,`managers`.`email` AS `email` from ((`users` join `managers` on((`managers`.`manager_id` = `users`.`id_manager`))) join `user_type` on((`users`.`id_user_type` = `user_type`.`id_user_type`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `clients_information`
--

/*!50001 DROP VIEW IF EXISTS `clients_information`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `clients_information` AS select `client_client_info`.`client_id` AS `id клиента`,`client_info`.`column_name` AS `название колонки`,`client_client_info`.`client_value` AS `значение колонки` from ((`client_info` join `client_client_info` on((`client_info`.`id_column_name` = `client_client_info`.`id_column_name`))) join `clients` on((`client_client_info`.`client_id` = `clients`.`client_id`))) order by `client_client_info`.`client_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `manager_client`
--

/*!50001 DROP VIEW IF EXISTS `manager_client`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `manager_client` AS select `orders`.`manager_id` AS `manager_id`,`orders`.`client_id` AS `client_id` from `orders` order by `orders`.`manager_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_information`
--

/*!50001 DROP VIEW IF EXISTS `order_information`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_information` AS select `orders`.`order_id` AS `id заказа`,`orders`.`client_id` AS `id клиента`,`products`.`product_name` AS `позиция`,`product_groups`.`group_name` AS `категория товара`,`products`.`product_price` AS `цена товара за шт.`,`orders`.`order_amount` AS `итоговая сумма заказа`,`order_details`.`quantity` AS `количество товара`,`orders`.`items_quantity` AS `количество позиций`,`supplier`.`supplier_name` AS `имя поставщика`,`orders`.`order_date` AS `дата заказа`,`products`.`delivery_time` AS `длительность доставки в днях`,`orders`.`manager_id` AS `id менеджера` from ((((`products` join `order_details` on((`order_details`.`products_product_id` = `products`.`product_id`))) join `orders` on((`orders`.`order_id` = `order_details`.`orders_order_id`))) join `supplier` on((`products`.`supplier_id` = `supplier`.`supplier_id`))) join `product_groups` on((`products`.`product_group_id` = `product_groups`.`product_group_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-27 10:56:37
