# Rewind free hosting setup

## 1. Create the Supabase database

1. Create a free project at Supabase.
2. Open **SQL Editor**.
3. Run all contents of [`supabase-schema.sql`](supabase-schema.sql).
4. In **Authentication → URL Configuration**, add your deployed site URL to the allowed redirect URLs.

## 2. Configure Rewind

Open [`Rewind.html`](Rewind.html) and set these constants near the top of the script:

```js
const SUPABASE_URL = 'https://YOUR_PROJECT.supabase.co';
const SUPABASE_ANON_KEY = 'YOUR_SUPABASE_ANON_KEY';
```

Use the Supabase project URL and the browser-safe **anon/public** key. Do not use a service-role key.

If these values remain empty, Rewind continues working with browser-local storage.

## 3. Deploy the page

1. Create a GitHub repository.
2. Rename [`Rewind.html`](Rewind.html) to `index.html`.
3. Upload `index.html` and [`supabase-schema.sql`](supabase-schema.sql).
4. Enable **GitHub Pages** in repository settings using the main branch and root folder.
5. Add the resulting GitHub Pages URL to Supabase's allowed redirect URLs.

Cloudflare Pages is an equivalent free hosting option.

## 4. Sign in and migrate existing data

Open the deployed app and click **Sign in**. Use the magic link sent to your email. If that account has no cloud records and the browser already contains a local library, Rewind uploads the local library automatically.

The app keeps local storage as an offline fallback. Export the library to Excel before changing browsers or clearing site data.

## Notes

- Supabase Row Level Security restricts each user to their own records.
- OMDb searches still use the browser-visible key currently in the HTML. For a public deployment, move OMDb requests behind a serverless function and rotate that key if it has been exposed.
- The mobile layout activates at 768px and changes navigation, cards, filters, modals, and controls for phone-sized screens. Desktop styling remains unchanged above that breakpoint.
