-- Esquema opcional para Supabase/PostgreSQL
create table profiles (id uuid primary key references auth.users(id) on delete cascade, display_name text, created_at timestamptz default now());
create table exercises (id bigint generated always as identity primary key, user_id uuid references auth.users(id) on delete cascade, name text not null, muscle_group text, created_at timestamptz default now());
create table routines (id bigint generated always as identity primary key, user_id uuid references auth.users(id) on delete cascade, name text not null, created_at timestamptz default now());
create table routine_exercises (routine_id bigint references routines(id) on delete cascade, exercise_id bigint references exercises(id) on delete cascade, position int not null, primary key(routine_id, exercise_id));
create table workouts (id bigint generated always as identity primary key, user_id uuid references auth.users(id) on delete cascade, name text not null, performed_at timestamptz default now());
create table workout_sets (id bigint generated always as identity primary key, workout_id bigint references workouts(id) on delete cascade, exercise_id bigint references exercises(id) on delete cascade, set_number int not null, weight_kg numeric(7,2), reps int, rpe numeric(3,1));
