CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "username" varchar,
  "password" varchar,
  "full_name" varchar,
  "dob" date,
  "created_at" timestamp,
  "city" varchar,
  "state" varchar,
  "contact" int,
  "email" varchar,
  "Gender" char,
  "country_code" int,
  "user_id" int
);

CREATE TABLE "member" (
  "id" SERIAL PRIMARY KEY,
  "joining_date" date,
  "end_of_membership" date,
  "membership_id" int,
  "user_id" int
);

CREATE TABLE "instructor" (
  "id" int PRIMARY KEY,
  "level" int,
  "user_id" int
);

CREATE TABLE "admin" (
  "id" int PRIMARY KEY,
  "user_id" int
);

CREATE TABLE "countries" (
  "code" int PRIMARY KEY,
  "name" varchar,
  "continent_name" varchar
);

CREATE TABLE "membership_type" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "membership_amount" int,
  "membership_period" int
);

CREATE TABLE "workout_plan" (
  "id" int PRIMARY KEY,
  "instructor_id" int,
  "member_id" int,
  "workout_id" int,
  "workout_date" date,
  "workout_time" time
);

CREATE TABLE "workout" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "equipment_id" int,
  "description" varchar
);

CREATE TABLE "payment" (
  "id" int PRIMARY KEY,
  "amount" float4,
  "status" varchar,
  "member_id" int,
  "user_id" int,
  "timestamp" datetime
);

CREATE TABLE "equipment" (
  "id" int PRIMARY KEY,
  "amount" float4,
  "stateus" varchar,
  "revival_date" date
);

CREATE TABLE "credit_card" (
  "credicard_id" int PRIMARY KEY,
  "cc_number" varchar,
  "cc_name" varchar,
  "expiry_date" varchar
);

CREATE TABLE "invoice" (
  "id" int PRIMARY KEY,
  "state" varchar,
  "description" varchar,
  "notes" varchar,
  "timestamp" datetime,
  "payment_id" int
);

ALTER TABLE "users" ADD FOREIGN KEY ("country_code") REFERENCES "countries" ("code");

ALTER TABLE "member" ADD FOREIGN KEY ("membership_id") REFERENCES "membership_type" ("id");

ALTER TABLE "member" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "instructor" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "admin" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "payment" ADD FOREIGN KEY ("member_id") REFERENCES "member" ("id");

ALTER TABLE "payment" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "invoice" ADD FOREIGN KEY ("payment_id") REFERENCES "payment" ("id");

ALTER TABLE "workout_plan" ADD FOREIGN KEY ("workout_id") REFERENCES "workout" ("id");

ALTER TABLE "workout_plan" ADD FOREIGN KEY ("member_id") REFERENCES "member" ("id");

ALTER TABLE "workout_plan" ADD FOREIGN KEY ("instructor_id") REFERENCES "instructor" ("id");

ALTER TABLE "workout" ADD FOREIGN KEY ("equipment_id") REFERENCES "equipment" ("id");
