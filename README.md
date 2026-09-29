# The Ex Files MVP

Vercel-ready vanilla HTML/CSS/JavaScript frontend with Supabase Auth, Postgres and RLS.

## Setup
1. Create a Supabase project.
2. Run `supabase/schema.sql` in Supabase SQL Editor.
3. Copy `config.js.example` to `config.js` and add the Supabase project URL and anon key.
4. Serve locally with `python3 -m http.server 3000` or `npx serve .`.
5. Deploy the folder to Vercel. No build command is required.
6. Create your first account, then make it admin in Supabase:

```sql
update public.user_profiles set role='admin' where email='your-admin@example.com';
```

Never put a Supabase service-role key in the browser.

The MVP intentionally has no fake reviews, fake users, statistics or testimonials.
