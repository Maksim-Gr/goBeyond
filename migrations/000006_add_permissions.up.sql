CREATE TABLE IF NOT EXISTS persmissions (
    id bigserial PRIMARY KEY ,
    code text NOT NULL
);

CREATE TABLE IF NOT EXISTS user_permissions (
    user_id bigint NOT NULL REFERENCES users ON DELETE CASCADE,
    permissions_id bigint NOT NULL REFERENCES persmissions ON DELETE CASCADE,
    PRIMARY KEY (user_id, permissions_id)
);

INSERT INTO persmissions(code)
VALUES ('movies:read'), ('movies:write');