CREATE TABLE EntityType (
    EntityTypeID BIGSERIAL NOT NULL PRIMARY KEY,
    TypeName VARCHAR(100) NOT NULL
);

CREATE TABLE Source (
    SourceID BIGSERIAL NOT NULL PRIMARY KEY,
    Name VARCHAR(255),
    URL TEXT
);

CREATE TABLE Account (
    AccountID BIGSERIAL NOT NULL PRIMARY KEY,
    Username VARCHAR(100) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL
);

CREATE TABLE Entity (
    EntityID BIGSERIAL NOT NULL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    EntityTypeID BIGINT REFERENCES EntityType(EntityTypeID)
);

CREATE TABLE Article (
    ArticleID BIGSERIAL NOT NULL PRIMARY KEY,
    Title TEXT,
    Content TEXT,
    SourceID BIGINT REFERENCES Source(SourceID),
	DatePublished DATE
);

CREATE TABLE EntityExtraction (
    EntityExtractionID BIGSERIAL NOT NULL PRIMARY KEY,
    ArticleID BIGINT REFERENCES Article(ArticleID),
    EntityID BIGINT REFERENCES Entity(EntityID),
    Position INT,
    Frequency INT
);

CREATE TABLE EntityImportance (
    ImportanceID BIGSERIAL NOT NULL PRIMARY KEY,
    ExtractionID BIGINT REFERENCES EntityExtraction(EntityExtractionID),
    ImportanceScore FLOAT
);

CREATE TABLE RelationshipMap (
    RelationshipID BIGSERIAL NOT NULL PRIMARY KEY,
    ArticleID BIGINT REFERENCES Article(ArticleID),
    EntityA_ID BIGINT REFERENCES Entity(EntityID),
    EntityB_ID BIGINT REFERENCES Entity(EntityID)
);

CREATE TABLE UserArticle (
    UserArticleID BIGSERIAL NOT NULL PRIMARY KEY,
    AccountID BIGINT REFERENCES Account(AccountID),
    ArticleID BIGINT REFERENCES Article(ArticleID),
    DateStored TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Annotation (
    AnnotationID BIGSERIAL NOT NULL PRIMARY KEY,
    AccountID BIGINT REFERENCES Account(AccountID),
    ArticleID BIGINT REFERENCES Article(ArticleID),
    Note VARCHAR(255)
);

CREATE TABLE Summary (
    SummaryID BIGSERIAL NOT NULL PRIMARY KEY,
    AccountID BIGINT REFERENCES Account(AccountID),
    ArticleID BIGINT REFERENCES Article(ArticleID),
    SummaryText TEXT
);