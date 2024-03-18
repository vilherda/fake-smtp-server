CREATE TABLE email (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY,
    from_address VARCHAR(255) NOT NULL,
    to_address VARCHAR(255) NOT NULL,
    subject CLOB NOT NULL,
    received_on TIMESTAMP NOT NULL,
    raw_data CLOB NOT NULL,
    message_id VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE email_content (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY,
    email BIGINT NOT NULL,
    content_type varchar(32) NOT NULL,
    data CLOB NOT NULL,
    PRIMARY KEY (id)
);
ALTER TABLE email_content ADD FOREIGN KEY (email) REFERENCES email(id) ON DELETE CASCADE;

CREATE TABLE email_attachment (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY,
    email BIGINT NOT NULL,
    filename varchar(1024) NOT NULL,
    data BLOB NOT NULL,
    PRIMARY KEY (id)
);
ALTER TABLE email_attachment ADD FOREIGN KEY (email) REFERENCES email(id) ON DELETE CASCADE;

CREATE TABLE email_inline_image (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY,
    email BIGINT NOT NULL,
    content_id varchar(255) NOT NULL,
    content_type varchar(255) NOT NULL,
    data CLOB NOT NULL,
    PRIMARY KEY (id)
);
ALTER TABLE email_inline_image ADD FOREIGN KEY (email) REFERENCES email(id) ON DELETE CASCADE;

CREATE SEQUENCE email_sequence START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE email_content_sequence START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE email_attachment_sequence START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE email_inline_image_sequence START WITH 1 INCREMENT BY 1;