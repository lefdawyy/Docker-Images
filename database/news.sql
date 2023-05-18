CREATE DATABASE IF NOT EXISTS newsdb;
USE newsdb;

CREATE TABLE IF NOT EXISTS News (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO News (title, content)
VALUES
('Real Madrid wins Champions League', 'In an exciting match, Real Madrid secured their victory in the Champions League.'),
('Sergio Ramos leaves Real Madrid', 'In a shocking move, Sergio Ramos leaves Real Madrid to pursue opportunities elsewhere.'),
('Real Madrid signs new player', 'Real Madrid strengthens their roster by signing a new forward.'),
("Real Madrid's outstanding season", 'The team had an impressive performance this season, topping the league charts.'),
('Injury updates from Real Madrid', 'Several key players from Real Madrid are reported injured post last match.'),
("Real Madrid's new coach", 'Real Madrid announces their new coach for the upcoming season.'),
('Real Madrid secures top spot', 'After their latest win, Real Madrid secures the top spot in the league.'),
('New sponsorship for Real Madrid', 'Real Madrid has landed a lucrative new sponsorship deal.'),
("Real Madrid's training camp updates", "Latest updates from Real Madrid's pre-season training camp."),
("Real Madrid player wins Ballon d\'Or", "A star player from Real Madrid wins the prestigious Ballon d\'Or."),
("Real Madrid's unbeaten run continues", 'Real Madrid continues their unbeaten streak with another victory.'),
('Fans celebrate Real Madrid victory', "Fans around the world celebrate after Real Madrid\'s big win."),
('New stadium plans for Real Madrid', 'Real Madrid announces plans for a new state-of-the-art stadium.'),
('Real Madrid to host charity match', 'Real Madrid will host a charity football match to raise funds for local charities.'),
('Ex-Real Madrid player retires', 'An ex-Real Madrid player announces retirement from professional football.'),
('Real Madrid youth academy success', "Real Madrid's youth academy sees a successful year with many players moving to the main team."),
('Record-breaking season for Real Madrid', 'Real Madrid breaks records with their performance this season.'),
('Real Madrid player tests positive for COVID-19', 'A Real Madrid player has tested positive for COVID-19 and is in quarantine.'),
("Real Madrid's strategies for next season", "Real Madrid reveals their strategies for the upcoming football season."),
("Real Madrid's celebration parade", "The city hosted a grand parade to celebrate Real Madrid's championship victory.");
