ALTER TABLE "uers" RENAME TO "users";
ALTER TABLE "users" DROP CONSTRAINT "uers_role_id_roles_role_id_fk";

DO $$ BEGIN
 ALTER TABLE "users" ADD CONSTRAINT "users_role_id_roles_role_id_fk" FOREIGN KEY ("role_id") REFERENCES "roles"("role_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
