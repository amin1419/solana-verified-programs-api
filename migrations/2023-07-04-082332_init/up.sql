-- Your SQL goes here
CREATE TABLE solana_program_builds (
    id VARCHAR NOT NULL,
    repository VARCHAR NOT NULL,
    commit_hash VARCHAR,
    program_id VARCHAR NOT NULL UNIQUE,
    lib_name VARCHAR,
    created_at TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (id)
);


CREATE TABLE verified_programs (
    id VARCHAR PRIMARY KEY,
    program_id VARCHAR NOT NULL,
    is_verified BOOLEAN NOT NULL DEFAULT FALSE,
    verified_at TIMESTAMP,
    FOREIGN KEY (program_id) REFERENCES solana_program_builds (program_id)
);

-- Create index on verified_programs.program_id
CREATE INDEX verified_programs_program_id_idx ON verified_programs (program_id);