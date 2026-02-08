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
INSERT INTO lego_sets VALUES(3,'Welcome to the Hidden Side','Hidden Side',70427,0,'https://www.lego.com/cdn/product-assets/product.img.pri/70427_Prod.jpg','https://www.lego.com/cdn/product-assets/product.bi.core.pdf/6314455.pdf','','2025-08-21 21:09:00.757768','2026-02-07 17:14:00.363728',4);
INSERT INTO lego_sets VALUES(4,'Shrimp Shack Attack','Hidden Side',70422,0,'https://www.lego.com/cdn/product-assets/product.img.pri/70422_Prod.jpg','https://www.lego.com/cdn/product-assets/product.bi.core.pdf/6285611.pdf','Blue car missing','2025-08-21 21:09:33.528677','2026-02-07 17:13:35.966048',4);
INSERT INTO lego_sets VALUES(5,'Ghost Train Express','Hidden Side',70424,0,'https://www.lego.com/cdn/product-assets/product.img.pri/70424_Prod.jpg','https://www.lego.com/cdn/product-assets/product.bi.core.pdf/6285636.pdf','','2025-08-21 21:10:06.086268','2026-02-07 17:13:47.282593',4);
INSERT INTO lego_sets VALUES(6,'Newbury Abandoned Prison','Hidden Side',70435,0,'https://www.lego.com/cdn/product-assets/product.img.pri/70435_Prod_01.jpg','https://www.lego.com/cdn/product-assets/product.bi.core.pdf/6325315.pdf','','2025-08-21 21:10:51.149441','2026-02-07 17:14:22.104501',4);
INSERT INTO lego_sets VALUES(7,'Mystery Castle','Hidden Side',70437,0,'https://www.lego.com/cdn/product-assets/product.img.pri/70437_Prod_01.jpg','https://www.lego.com/cdn/product-assets/product.bi.core.pdf/6325557.pdf','','2025-08-21 21:11:11.930912','2026-02-07 17:14:37.324749',4);
INSERT INTO lego_sets VALUES(8,'The Lighthouse of Darkness','Hidden Side',70431,0,'https://www.lego.com/cdn/product-assets/product.img.pri/70431_Prod.jpg','https://www.lego.com/cdn/product-assets/product.bi.core.pdf/6314540.pdf','Jetski missing, slime from lighthouse missing ','2025-08-21 21:11:47.108757','2026-02-07 17:14:11.880306',4);
INSERT INTO lego_sets VALUES(11,'Graveyard Mystery','Hidden Side',70420,0,'https://www.lego.com/cdn/product-assets/product.img.pri/70420_Prod.jpg','https://www.lego.com/cdn/product-assets/product.bi.core.pdf/6285629.pdf','Missing green bin with tools ','2025-08-22 00:03:04.824976','2025-08-22 20:44:31.116916',4);
INSERT INTO lego_sets VALUES(15,'Lion Legend Beast','Chima',70123,-1,'https://www.lego.com/cdn/product-assets/product.img.pri/70123_prod.jpg','https://www.lego.com/cdn/product-assets/product.bi.core.pdf/6073897.pdf','Test one','2025-09-03 23:38:52.390447','2026-02-07 17:02:46.158511',4);
INSERT INTO lego_sets VALUES(16,'Pegasus Flying Horse','LEGO DREAMZzz',71457,0,'https://www.lego.com/cdn/product-assets/product.img.pri/71457_Prod.png','https://www.lego.com/cdn/product-assets/product.bi.core.pdf/6490634.pdf','Just the horse, none of the other creatures. White-faced minifigs is also in the bag.','2026-02-07 17:07:01.142297','2026-02-07 17:07:01.142297',4);
INSERT INTO lego_sets VALUES(17,'Zoey and Zian the Cat-Owl','LEGO DREAMZzz',71476,0,'https://www.lego.com/cdn/product-assets/product.img.pri/71476_Prod.png','https://www.lego.com/cdn/product-assets/product.bi.core.pdf/6494358.pdf','No minifigs, red scooter and hammer also not in bag. 2x black creatures present. Flying bat thing also present.','2026-02-07 17:08:44.733524','2026-02-07 17:08:44.733524',4);
INSERT INTO lego_sets VALUES(18,'The Never Witch''s Midnight Raven','LEGO DREAMZzz',71478,0,'https://www.lego.com/cdn/product-assets/product.img.pri/71478_Prod.png','https://www.lego.com/cdn/product-assets/product.bi.core.pdf/6529922.pdf','No yellow faced minifigs','2026-02-07 17:10:18.562208','2026-02-07 17:10:18.562208',4);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('lego_sets',18);
INSERT INTO sqlite_sequence VALUES('locations',6);
CREATE INDEX "index_lego_sets_on_location_id" ON "lego_sets" ("location_id");
COMMIT;
