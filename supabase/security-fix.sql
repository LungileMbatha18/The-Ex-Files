-- The Ex Files: prevent ordinary users from changing their own role.
-- Run this once in Supabase SQL Editor after the original schema.sql.

create or replace function public.prevent_non_admin_role_change()
returns trigger
language plpgsql
security definer
set search_path=public
as $$
begin
  if auth.uid() = old.id and not public.is_admin() and new.role is distinct from old.role then
    raise exception 'Only an administrator can change account roles';
  end if;
  return new;
end;
$$;

drop trigger if exists protect_user_role on public.user_profiles;
create trigger protect_user_role
before update of role on public.user_profiles
for each row execute procedure public.prevent_non_admin_role_change();
