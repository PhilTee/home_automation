PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
INSERT INTO schema_migrations VALUES('20250820225744');
INSERT INTO schema_migrations VALUES('20250822154303');
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
INSERT INTO ar_internal_metadata VALUES('environment','development','2025-08-21 20:53:07.972908','2025-08-21 20:53:07.972913');
INSERT INTO ar_internal_metadata VALUES('schema_sha1','57e850ce27ef98443fbb9c71768dcb759e1b7ca5','2025-08-21 20:53:07.980314','2025-08-21 20:53:07.980339');
CREATE TABLE IF NOT EXISTS "locations" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
INSERT INTO locations VALUES(2,'Kallax 1','2025-08-22 20:29:07.222051','2025-08-22 20:29:07.222051');
INSERT INTO locations VALUES(3,'Kallax 2','2025-08-22 20:29:48.941450','2025-08-22 20:29:48.941450');
INSERT INTO locations VALUES(4,'Den Floor','2025-08-22 20:31:01.784451','2025-08-22 20:31:01.784451');
INSERT INTO locations VALUES(5,'Kallax 3','2025-08-22 20:43:00.635550','2025-08-22 20:43:00.635550');
INSERT INTO locations VALUES(6,'Kallax 4','2025-08-22 20:54:49.451097','2025-08-22 20:54:49.451097');
CREATE TABLE IF NOT EXISTS "lego_sets" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar DEFAULT NULL, "theme" varchar DEFAULT NULL, "number" integer DEFAULT NULL, "status" integer DEFAULT NULL, "image_url" varchar DEFAULT NULL, "instructions_url" varchar DEFAULT NULL, "comments" text DEFAULT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "location_id" integer DEFAULT NULL, CONSTRAINT "fk_rails_758e9a9fcf"
FOREIGN KEY ("location_id")
  REFERENCES "locations" ("id")
);
INSERT INTO lego_sets VALUES(3,'Welcome to the Hidden Side','Hidden Side',70427,0,'https://www.lego.com/cdn/product-assets/product.img.pri/70427_Prod.jpg','https://www.lego.com/cdn/product-assets/product.bi.core.pdf/6314455.pdf','','2025-08-21 21:09:00.757768','2025-08-21 21:09:00.757768',NULL);
INSERT INTO lego_sets VALUES(4,'Shrimp Shack Attack','Hidden Side',70422,0,'https://www.lego.com/cdn/product-assets/product.img.pri/70422_Prod.jpg','https://www.lego.com/cdn/product-assets/product.bi.core.pdf/6285611.pdf','Blue car missing','2025-08-21 21:09:33.528677','2025-08-21 21:09:33.528677',NULL);
INSERT INTO lego_sets VALUES(5,'Ghost Train Express','Hidden Side',70424,0,'https://www.lego.com/cdn/product-assets/product.img.pri/70424_Prod.jpg','https://www.lego.com/cdn/product-assets/product.bi.core.pdf/6285636.pdf','','2025-08-21 21:10:06.086268','2025-08-21 21:10:06.086268',NULL);
INSERT INTO lego_sets VALUES(6,'Newbury Abandoned Prison','Hidden Side',70435,0,'https://www.lego.com/cdn/product-assets/product.img.pri/70435_Prod_01.jpg','https://www.lego.com/cdn/product-assets/product.bi.core.pdf/6325315.pdf','','2025-08-21 21:10:51.149441','2025-08-21 21:10:51.149441',NULL);
INSERT INTO lego_sets VALUES(7,'Mystery Castle','Hidden Side',70437,0,'https://www.lego.com/cdn/product-assets/product.img.pri/70437_Prod_01.jpg','https://www.lego.com/cdn/product-assets/product.bi.core.pdf/6325557.pdf','','2025-08-21 21:11:11.930912','2025-08-21 22:40:36.805257',NULL);
INSERT INTO lego_sets VALUES(8,'The Lighthouse of Darkness','Hidden Side',70431,0,'https://www.lego.com/cdn/product-assets/product.img.pri/70431_Prod.jpg','https://www.lego.com/cdn/product-assets/product.bi.core.pdf/6314540.pdf','Jetski missing, slime from lighthouse missing ','2025-08-21 21:11:47.108757','2025-08-21 21:11:47.108757',NULL);
INSERT INTO lego_sets VALUES(11,'Graveyard Mystery','Hidden Side',70420,0,'https://www.lego.com/cdn/product-assets/product.img.pri/70420_Prod.jpg','https://www.lego.com/cdn/product-assets/product.bi.core.pdf/6285629.pdf','Missing green bin with tools ','2025-08-22 00:03:04.824976','2025-08-22 20:44:31.116916',4);
INSERT INTO lego_sets VALUES(15,'Lion Legend Beast','Chima',70123,-1,'https://www.lego.com/cdn/product-assets/product.img.pri/70123_prod.jpg','https://www.lego.com/cdn/product-assets/product.bi.core.pdf/6073897.pdf','Test','2025-09-03 23:38:52.390447','2025-09-03 23:38:52.390447',4);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('lego_sets',15);
INSERT INTO sqlite_sequence VALUES('locations',6);
CREATE INDEX "index_lego_sets_on_location_id" ON "lego_sets" ("location_id");
COMMIT;
