-- comment out once we have successful seed
DROP TABLE IF EXISTS service_posts;
DROP TABLE IF EXISTS services;
DROP TABLE IF EXISTS users;

CREATE TYPE us_state AS ENUM (
    'AL',
    'AK',
    'AZ',
    'AR',
    'CA',
    'CO',
    'CT',
    'DE',
    'DC',
    'FL',
    'GA',
    'HI',
    'ID',
    'IL',
    'IN',
    'IA',
    'KS',
    'KY',
    'LA',
    'ME',
    'MD',
    'MA',
    'MI',
    'MN',
    'MS',
    'MO',
    'MT',
    'NE',
    'NV',
    'NH',
    'NJ',
    'NM',
    'NY',
    'NC',
    'ND',
    'OH',
    'OK',
    'OR',
    'PA',
    'RI',
    'SC',
    'SD',
    'TN',
    'TX',
    'UT',
    'VT',
    'VA',
    'WA',
    'WV',
    'WI',
    'WY'
);

CREATE TABLE users (
    id serial PRIMARY KEY,
    username text UNIQUE NOT NULL,
    password text NOT NULL,
    role text NOT NULL,
    login_count integer NOT NULL DEFAULT 0
);

CREATE TABLE services (
    id serial PRIMARY KEY,
    name text UNIQUE NOT NULL,
    description text 
);

CREATE TABLE service_posts (
    id serial PRIMARY KEY,
    service_id integer NOT NULL REFERENCES services(id) ON DELETE CASCADE,
    user_id integer NOT NULL REFERENCES services(id) ON DELETE CASCADE,
    state us_state NOT NULL,
    zip_code text NOT NULL CHECK (zip_code ~ '^\d{5}(-\d{4})?$'),
    car_make text NOT NULL,
    car_model text NOT NULL,
    car_year text NOT NULL,
    quoted_cost integer CHECK (quoted_cost >= 0),
    cost integer NOT NULL CHECK (cost >= 0),
    date_serviced date NOT NULL,
    shop_type text,
    flagged_count integer NOT NULL DEFAULT 0,
    status text,
    source text NOT NULL,
    created_at date NOT NULL DEFAULT now()
);


