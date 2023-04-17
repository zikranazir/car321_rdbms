CREATE TABLE "users" (
  "user_id" biginteger UNIQUE PRIMARY KEY,
  "name" varchar(100),
  "contact" int,
  "email" varchar(60),
  "address" varchar(100),
  "location_id" [PK]
);

CREATE TABLE "advertisements" (
  "ads_id" biginteger UNIQUE PRIMARY KEY,
  "title" varchar(100),
  "brand" varchar(30),
  "model" varchar(30),
  "body_type" varchar(30),
  "engine_capacity" int,
  "manufacturing_year" int,
  "mileage" int,
  "transmission_type" varchar(10),
  "color" varchar(30),
  "price" int,
  "date_post" datetime,
  "date_update" datetime,
  "is_bid_allow" bool,
  "ads_status" varchar(10),
  "user_id" [FK],
  "location_id" [FK]
);

CREATE TABLE "locations" (
  "location_id" biginteger UNIQUE PRIMARY KEY,
  "region" varchar(60),
  "city" varchar(60),
  "latitude" deciman(10,8),
  "longitude" decicam(11,8)
);

CREATE TABLE "bids" (
  "bid_id" biginteger UNIQUE PRIMARY KEY,
  "bid_status" varchar(10),
  "bid_price" int,
  "ads_id" [FK],
  "user_id" [FK]
);

ALTER TABLE "locations" ADD FOREIGN KEY ("location_id") REFERENCES "users" ("location_id");

ALTER TABLE "users" ADD FOREIGN KEY ("user_id") REFERENCES "advertisements" ("user_id");

ALTER TABLE "locations" ADD FOREIGN KEY ("location_id") REFERENCES "advertisements" ("location_id");

ALTER TABLE "users" ADD FOREIGN KEY ("user_id") REFERENCES "bids" ("user_id");

ALTER TABLE "advertisements" ADD FOREIGN KEY ("ads_id") REFERENCES "bids" ("ads_id");
