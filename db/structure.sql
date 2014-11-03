CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "people" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "ci" varchar(255), "first_name" varchar(255), "last_name" varchar(255), "last_name2" varchar(255), "alias" varchar(255), "birth_date" date, "originative" varchar(255), "genre" varchar(255), "record" boolean, "profession" varchar(255), "observations" text, "status_id" varchar(255), "registered_from" varchar(255), "searchable" text, "visible" boolean, "hide_reason" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "username" varchar(255), "active" boolean, "admin" boolean, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "email" varchar(255) DEFAULT '' NOT NULL, "encrypted_password" varchar(255) DEFAULT '' NOT NULL, "reset_password_token" varchar(255), "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0 NOT NULL, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar(255), "last_sign_in_ip" varchar(255));
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE UNIQUE INDEX "index_users_on_username" ON "users" ("username");
CREATE TABLE "roles" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_roles_on_name" ON "roles" ("name");
CREATE TABLE "permissions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "role_id" integer, "name" varchar(255), "resource" varchar(255), "condition" varchar(255), "cannot" boolean, "priority" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_permissions_on_name" ON "permissions" ("name");
CREATE INDEX "index_permissions_on_role_id_and_name" ON "permissions" ("role_id", "name");
CREATE TABLE "assignments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "user_type" varchar(255), "role_id" integer);
CREATE INDEX "index_assignments_on_user_id_and_user_type" ON "assignments" ("user_id", "user_type");
CREATE TABLE "vehicles" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "brand" varchar(255), "line" varchar(255), "model" integer, "plate" varchar(255), "serial_number" varchar(255), "color" varchar(255), "stolen" boolean, "status" varchar(255), "person_id" integer, "registered_from" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "crimes" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "description" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "townships" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "description" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "localities" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "description" varchar(255), "township_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO schema_migrations (version) VALUES ('20140827164803');

INSERT INTO schema_migrations (version) VALUES ('20140827172542');

INSERT INTO schema_migrations (version) VALUES ('20140827174417');

INSERT INTO schema_migrations (version) VALUES ('20140828174610');

INSERT INTO schema_migrations (version) VALUES ('20140902183813');

INSERT INTO schema_migrations (version) VALUES ('20140902222301');

INSERT INTO schema_migrations (version) VALUES ('20140903161724');

INSERT INTO schema_migrations (version) VALUES ('20140903164025');