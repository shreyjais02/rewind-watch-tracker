create table if not exists public.watch_library (
  user_id uuid not null references auth.users(id) on delete cascade,
  imdb_id text not null,
  item jsonb not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  primary key (user_id, imdb_id)
);

alter table public.watch_library enable row level security;

drop policy if exists "Users can read their own watch library" on public.watch_library;
create policy "Users can read their own watch library"
  on public.watch_library for select using (auth.uid() = user_id);

drop policy if exists "Users can manage their own watch library" on public.watch_library;
create policy "Users can manage their own watch library"
  on public.watch_library for all using (auth.uid() = user_id) with check (auth.uid() = user_id);