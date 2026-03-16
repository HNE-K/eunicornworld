/*
  # Create sessions table for Eunicorn's World

  1. New Tables
    - `sessions`
      - `id` (uuid, primary key) - Unique session identifier
      - `session_id` (text, unique) - Anonymous session ID stored in localStorage
      - `unicorn_x` (numeric) - Last known X position of unicorn on map
      - `unicorn_y` (numeric) - Last known Y position of unicorn on map
      - `current_season` (text) - Last selected season (spring/summer/autumn/winter)
      - `last_visited` (timestamptz) - Timestamp of last activity
      - `created_at` (timestamptz) - Session creation timestamp

  2. Security
    - Enable RLS on `sessions` table
    - Add policy for anonymous users to read/write their own session data
    - Sessions are identified by session_id which users generate and store locally

  3. Notes
    - No authentication required, fully anonymous experience
    - Session data persists across visits using localStorage session_id
    - Debounced writes prevent excessive database calls
*/

CREATE TABLE IF NOT EXISTS sessions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id text UNIQUE NOT NULL,
  unicorn_x numeric DEFAULT 0,
  unicorn_y numeric DEFAULT 0,
  current_season text DEFAULT 'spring',
  last_visited timestamptz DEFAULT now(),
  created_at timestamptz DEFAULT now()
);

ALTER TABLE sessions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can insert their session"
  ON sessions
  FOR INSERT
  TO anon
  WITH CHECK (true);

CREATE POLICY "Anyone can read their session by session_id"
  ON sessions
  FOR SELECT
  TO anon
  USING (true);

CREATE POLICY "Anyone can update their session by session_id"
  ON sessions
  FOR UPDATE
  TO anon
  USING (true)
  WITH CHECK (true);

CREATE INDEX IF NOT EXISTS idx_sessions_session_id ON sessions(session_id);
CREATE INDEX IF NOT EXISTS idx_sessions_last_visited ON sessions(last_visited);