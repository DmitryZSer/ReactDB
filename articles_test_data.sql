-- ----------------------------
-- Table structure for table roles
-- ----------------------------
CREATE TABLE roles (
    id   SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

-- ----------------------------
-- Dumping data for table roles
-- ----------------------------
INSERT INTO roles (id, name) VALUES
  (1, 'Администратор'),
  (2, 'Модератор'),
  (3, 'Пользователь'),
  (4, 'Забаненный');

-- ----------------------------
-- Table structure for table users
-- ----------------------------
CREATE TABLE users (
    id                SERIAL PRIMARY KEY,
    name              VARCHAR(100) NOT NULL,
    email             VARCHAR(100) NOT NULL UNIQUE,
    password          VARCHAR(1000) NOT NULL,
    date_registration DATE NOT NULL DEFAULT CURRENT_DATE,
    role_id           INTEGER NOT NULL DEFAULT 3  -- по умолчанию "Пользователь"
);

-- ----------------------------
-- Dumping data for table users
-- ----------------------------
INSERT INTO users (id, name, email, password, date_registration, role_id) VALUES
  (1, 'Admin',            'cebotarenkodima@gmail.com', '$2b$10$WWA25AmSE9TOgjd3accXAuI7FsKLcXHNKfVl5IsbCs4kZ5bO8vwbi', '2024-11-12', 1),
  (43,'Иван Петров',      'ivan.petrov@example.com',   '$2b$10$rw8H6ii7Zl6PoVoyEYSe/OLlgJPlVq267DNfT5arJO8EpbIRb2FIC', '2024-11-17', 3),
  (44,'Мария Сидорова',    'maria.sidorova@example.com', '$2b$10$j5NhqfRzKQWNXKkX5/HWE.h18kYq1atOVgINxZCtqswzGz4gi7e8G', '2024-11-17', 3),
  (45,'Алексей Смирнов',   'alexey.smirnov@example.com', '$2b$10$G8w4YwUNmXMVC8sT3anYq.tSSTY8a./aDygWdq/lSV.Ha6PPU9omW', '2024-11-17', 2),
  (48,'Ysell',            'soniaov24@gmail.com',        '$2b$10$CGlqa.3626GkrszGjKKIReQAC2bh7y6PwlbTGqbsNGT/1SErxYcBK', '2024-11-17', 3);

-- ----------------------------
-- Table structure for table tags
-- ----------------------------
CREATE TABLE tags (
    id   SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- ----------------------------
-- Dumping data for table tags
-- ----------------------------
INSERT INTO tags (id, name) VALUES
  (1, 'Программирование'),
  (2, 'Веб-разработка'),
  (3, 'Базы данных'),
  (4, 'DevOps'),
  (5, 'Алгоритмы'),
  (6, 'JavaScript'),
  (7, 'Python'),
  (8, 'React'),
  (9, 'SQL'),
  (10,'Git');

-- ----------------------------
-- Table structure for table articles
-- ----------------------------
CREATE TABLE articles (
    id         SERIAL PRIMARY KEY,
    title      VARCHAR(255) NOT NULL,
    summary    TEXT,
    content    TEXT NOT NULL,
    author_id  INTEGER,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ----------------------------
-- Table structure for table article_tags
-- ----------------------------
CREATE TABLE article_tags (
    article_id INTEGER NOT NULL,
    tag_id     INTEGER NOT NULL,
    PRIMARY KEY (article_id, tag_id)
);

-- ----------------------------
-- Table structure for table comments
-- ----------------------------
CREATE TABLE comments (
    id                SERIAL PRIMARY KEY,
    article_id        INTEGER NOT NULL,
    user_id           INTEGER NOT NULL,
    parent_comment_id INTEGER,
    content           TEXT NOT NULL,
    created_at        TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at        TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ----------------------------
-- Function to auto-update updated_at
-- ----------------------------
CREATE OR REPLACE FUNCTION set_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at := CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- ----------------------------
-- Triggers for auto-updating updated_at
-- ----------------------------
CREATE TRIGGER trg_articles_set_updated_at
BEFORE UPDATE ON articles
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_comments_set_updated_at
BEFORE UPDATE ON comments
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

-- ----------------------------
-- Dumping data for table articles
-- ----------------------------
INSERT INTO articles (id, title, summary, content, author_id, created_at) VALUES
  (1, 'Основы JavaScript', 'Краткий гайд по основам JavaScript', '<h2>Полное руководство...</h2>...', 43, '2024-11-11 18:28:32'),
  (2, 'Создание веб-приложения с React', 'Пошаговый гайд...', 'Детальный разбор...', 44, '2024-11-11 18:28:32'),
  (3, 'Настройка Git и GitHub', 'Учимся работать...', 'Практическое руководство...', 45, '2024-11-11 18:28:32'),
  (4, 'Работа с MySQL', 'Основы работы...', 'Операции CRUD...', 43, '2024-11-11 18:28:32'),
  (5, 'Основы Python для начинающих', 'Краткий гайд...', '<p>Основы Python...</p><p><br></p><p><br></p><pre class="ql-syntax" spellcheck="false"><span class="hljs-keyword">INSERT</span> <span class="hljs-keyword">INTO</span> articles (id, title, summary, content, author_id, created_at) <span class="hljs-keyword">VALUES</span>\n  (<span class="hljs-number">1</span>, <span class="hljs-string">''Основы JavaScript''</span>, <span class="hljs-string">''Краткий гайд по основам JavaScript''</span>, <span class="hljs-string">''&lt;h2&gt;Полное руководство...&lt;/h2&gt;...''</span>, <span class="hljs-number">43</span>, <span class="hljs-string">''2024-11-11 18:28:32''</span>),\n  (<span class="hljs-number">2</span>, <span class="hljs-string">''Создание веб-приложения с React''</span>, <span class="hljs-string">''Пошаговый гайд...''</span>, <span class="hljs-string">''Детальный разбор...''</span>, <span class="hljs-number">44</span>, <span class="hljs-string">''2024-11-11 18:28:32''</span>),\n  (<span class="hljs-number">3</span>, <span class="hljs-string">''Настройка Git и GitHub''</span>, <span class="hljs-string">''Учимся работать...''</span>, <span class="hljs-string">''Практическое руководство...''</span>, <span class="hljs-number">45</span>, <span class="hljs-string">''2024-11-11 18:28:32''</span>),\n  (<span class="hljs-number">4</span>, <span class="hljs-string">''Работа с MySQL''</span>, <span class="hljs-string">''Основы работы...''</span>, <span class="hljs-string">''Операции CRUD...''</span>, <span class="hljs-number">43</span>, <span class="hljs-string">''2024-11-11 18:28:32''</span>),\n  (<span class="hljs-number">5</span>, <span class="hljs-string">''Основы Python для начинающих''</span>, <span class="hljs-string">''Краткий гайд...''</span>, <span class="hljs-string">''&lt;p&gt;Основы Python...&lt;/p&gt;''</span>, <span class="hljs-number">44</span>, <span class="hljs-string">''2024-11-11 18:28:32''</span>),\n  (<span class="hljs-number">6</span>, <span class="hljs-string">''Алгоритмы и структуры данных''</span>, <span class="hljs-string">''Гид по алгоритмам...''</span>, <span class="hljs-string">''Разбираем основные алгоритмы...''</span>, <span class="hljs-number">45</span>, <span class="hljs-string">''2024-11-11 18:28:32''</span>),\n  (<span class="hljs-number">7</span>, <span class="hljs-string">''DevOps: Введение в Docker''</span>, <span class="hljs-string">''Основы Docker...''</span>, <span class="hljs-string">''Объяснение работы Docker...''</span>, <span class="hljs-number">43</span>, <span class="hljs-string">''2024-11-11 18:28:32''</span>),\n  (<span class="hljs-number">8</span>, <span class="hljs-string">''Пишем SQL-запросы''</span>, <span class="hljs-string">''Гайд по написанию...''</span>, <span class="hljs-string">''Полное руководство...''</span>, <span class="hljs-number">44</span>, <span class="hljs-string">''2024-11-11 18:28:32''</span>),\n  (<span class="hljs-number">9</span>, <span class="hljs-string">''Создание REST API на Node.js''</span>, <span class="hljs-string">''Создаем API...''</span>, <span class="hljs-string">''Подробное руководство...''</span>, <span class="hljs-number">45</span>, <span class="hljs-string">''2024-11-11 18:28:32''</span>),\n  (<span class="hljs-number">10</span>,<span class="hljs-string">''Тестирование кода на JavaScript''</span>,<span class="hljs-string">''Гид по тестированию...''</span>,<span class="hljs-string">''Пошаговое руководство...''</span>,<span class="hljs-number">43</span>,<span class="hljs-string">''2024-11-11 18:28:32''</span>);\n</pre><p><br></p><p>Список: </p><ol><li>Один</li><li>Два</li><li>Три</li></ol>', 44, '2024-11-11 18:28:32'),
  (6, 'Алгоритмы и структуры данных', 'Гид по алгоритмам...', 'Разбираем основные алгоритмы...', 45, '2024-11-11 18:28:32'),
  (7, 'DevOps: Введение в Docker', 'Основы Docker...', 'Объяснение работы Docker...', 43, '2024-11-11 18:28:32'),
  (8, 'Пишем SQL-запросы', 'Гайд по написанию...', 'Полное руководство...', 44, '2024-11-11 18:28:32'),
  (9, 'Создание REST API на Node.js', 'Создаем API...', 'Подробное руководство...', 45, '2024-11-11 18:28:32'),
  (10,'Тестирование кода на JavaScript','Гид по тестированию...','Пошаговое руководство...',43,'2024-11-11 18:28:32');

-- ----------------------------
-- Dumping data for table article_tags
-- ----------------------------
INSERT INTO article_tags (article_id, tag_id) VALUES
  (1,4),(1,5),(1,6),
  (2,2),(2,8),
  (3,2),(3,10),
  (4,3),(4,9),
  (5,1),(5,7),
  (6,1),(6,5),
  (7,2),(7,4),
  (8,3),(8,9),
  (9,2),(9,6),
  (10,2),(10,6);

-- ----------------------------
-- Dumping data for table comments
-- ----------------------------
INSERT INTO comments (id, article_id, user_id, parent_comment_id, content, created_at) VALUES
(21, 3, 1, NULL, 'dsad', '2024-11-16 20:53:21'),
(22, 3, 1, NULL, 'asd', '2024-11-16 20:53:22'),
(35, 1, 48, NULL, 'Ты тоже', '2024-11-16 21:30:22'),
(54, 1, 1, 35, 'тветат', '2024-11-16 22:26:26');

-- ----------------------------
-- Foreign key constraints
-- ----------------------------
ALTER TABLE users
  ADD CONSTRAINT fk_users_role
    FOREIGN KEY (role_id) REFERENCES roles (id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE articles
  ADD CONSTRAINT fk_articles_author
    FOREIGN KEY (author_id) REFERENCES users (id) ON DELETE SET NULL;

ALTER TABLE article_tags
  ADD CONSTRAINT fk_article_tags_article
    FOREIGN KEY (article_id) REFERENCES articles (id) ON DELETE CASCADE,
  ADD CONSTRAINT fk_article_tags_tag
    FOREIGN KEY (tag_id) REFERENCES tags (id) ON DELETE CASCADE;

ALTER TABLE comments
  ADD CONSTRAINT fk_comments_article
    FOREIGN KEY (article_id) REFERENCES articles (id) ON DELETE CASCADE,
  ADD CONSTRAINT fk_comments_user
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  ADD CONSTRAINT fk_comments_parent
    FOREIGN KEY (parent_comment_id) REFERENCES comments (id) ON DELETE CASCADE;