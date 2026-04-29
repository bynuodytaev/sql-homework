-- 1. Genres
CREATE TABLE IF NOT EXISTS genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- 2. Artists
CREATE TABLE IF NOT EXISTS artists (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- 3. Albums
CREATE TABLE IF NOT EXISTS albums (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    release_year INTEGER CHECK(release_year > 0)
);

-- 4. Compilations
CREATE TABLE IF NOT EXISTS compilations (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    release_year INTEGER CHECK(release_year > 0)
);

-- 5. Tracks
CREATE TABLE IF NOT EXISTS tracks (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    duration INTEGER CHECK(duration > 0),
    albums_id INTEGER NOT NULL REFERENCES albums(id)
);

-- 6. Artists_genres
CREATE TABLE IF NOT EXISTS artists_genres (
    artist_id INTEGER NOT NULL REFERENCES artists(id),
    genres_id INTEGER NOT NULL REFERENCES genres(id),
    PRIMARY KEY (artist_id, genres_id)
);

-- 7. Album_artists
CREATE TABLE IF NOT EXISTS album_artists (
    albums_id INTEGER NOT NULL REFERENCES albums(id),
    artist_id INTEGER NOT NULL REFERENCES artists(id),
    PRIMARY KEY (albums_id, artist_id)
);

-- 8. Compilation_tracks
CREATE TABLE IF NOT EXISTS compilation_tracks (
    compilations_id INTEGER NOT NULL REFERENCES compilations(id),
    track_id INTEGER NOT NULL REFERENCES tracks(id),
    PRIMARY KEY (compilations_id, track_id)
);