CREATE TABLE IF NOT EXISTS "centers" (
	"center_id" serial PRIMARY KEY NOT NULL,
	"center_name" varchar(200),
	"campus" varchar(200),
	"city_id" integer,
	"location" varchar(300),
	"created_date" timestamp DEFAULT now()
);

DO $$ BEGIN
 ALTER TABLE "centers" ADD CONSTRAINT "centers_city_id_cities_city_id_fk" FOREIGN KEY ("city_id") REFERENCES "cities"("city_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
