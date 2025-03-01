CREATE TABLE MotionPicture (
    id INT,
    name VARCHAR(64),
    rating FLOAT,
    production VARCHAR(64),
    budget INT,
    PRIMARY KEY (id),
    CHECK (rating>=0 AND rating <= 10),
    CHECK (budget > 0)
);

CREATE TABLE Users (
    email VARCHAR(64),
    name VARCHAR(32),
    age INT,
    PRIMARY KEY (email)
);

CREATE TABLE Likes (
    uemail VARCHAR(64),
    mpid INT,
    PRIMARY KEY (uemail, mpid),
    FOREIGN KEY (uemail) REFERENCES Users (email) ON DELETE CASCADE,
    FOREIGN KEY (mpid) REFERENCES MotionPicture (id) ON DELETE CASCADE
);

CREATE TABLE Movie (
    mpid INT,
    boxoffice_collection FLOAT,
    PRIMARY KEY (mpid),
    FOREIGN KEY (mpid) REFERENCES MotionPicture (id) ON DELETE CASCADE,
    CHECK (boxoffice_collection >= 0)
);

CREATE TABLE Series (
    mpid INT,
    season_count INT,
    PRIMARY KEY (mpid),
    FOREIGN KEY (mpid) REFERENCES MotionPicture (id) ON DELETE CASCADE,
    CHECK (season_count >= 1)
);

CREATE TABLE People (
    id INT,
    name VARCHAR(64),
    nationality VARCHAR(16),
    dob DATE,
    gender ENUM('M', 'F'),
    PRIMARY KEY (id)
);

CREATE TABLE Role (
    mpid INT,
    pid INT,
    role_name VARCHAR(16),
    PRIMARY KEY (mpid, pid, role_name),
    FOREIGN KEY (mpid) REFERENCES MotionPicture (id) ON DELETE CASCADE,
    FOREIGN KEY (pid) REFERENCES People (id) ON DELETE CASCADE
);

CREATE TABLE Award (
    mpid INT,
    pid INT,
    award_name VARCHAR(16),
    award_year YEAR,
    PRIMARY KEY (mpid, pid, award_name, award_year),
    FOREIGN KEY (mpid) REFERENCES MotionPicture (id) ON DELETE CASCADE,
    FOREIGN KEY (pid) REFERENCES People (id) ON DELETE CASCADE
);

CREATE TABLE Genre (
    mpid INT,
    genre_name VARCHAR(16),
    PRIMARY KEY (mpid, genre_name),
    FOREIGN KEY (mpid) REFERENCES MotionPicture (id) ON DELETE CASCADE
);

CREATE TABLE Location (
    mpid INT,
    zip CHAR(10),
    city VARCHAR(16),
    country VARCHAR(16),
    PRIMARY KEY(mpid, zip),
    FOREIGN KEY (mpid) REFERENCES MotionPicture (id) ON DELETE CASCADE
);