-- ----------------------------- --
-- Banco de dados para FlaskBlog --
-- ----------------------------- --
-- Versão MySQL / MariaDB        --
-- ----------------------------- --

-- Apaga o banco de dados se ele existir
-- PERIGO! Só faça isso em tempo de desenvolvimento
DROP DATABASE IF EXISTS flaskblogdb;

-- (Re)cria o banco de dados
-- PERIGO! Só faça isso em tempo de desenvolvimento
CREATE DATABASE flaskblogdb
	-- Usando a tabela de caracteres universal extendida
	CHARACTER SET utf8mb4
    -- Buscas também em utf8 e case insensitive
    COLLATE utf8mb4_general_ci;

-- Seleciona o banco de dados para os próximos comandos
USE flaskblogdb;

-- Cria a tabela 'staff' conforme o modelo lógico
CREATE TABLE staff (
	-- Define o id como chave primária
	sta_id INT PRIMARY KEY AUTO_INCREMENT,
    -- Define a data com valor do sistema
    sta_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -- Define o nome do usuário com 127 caracteres
    sta_name VARCHAR(127) NOT NULL,
    -- Define o email do usuário com 255 caracteres (RFC)
    sta_email VARCHAR(255) NOT NULL,
    sta_password VARCHAR(63) NOT NULL,
    sta_image VARCHAR(255),
    -- Data em formato ISO / System Date
    sta_birth DATE NOT NULL,
    sta_description VARCHAR(255),
    sta_type ENUM('admin', 'author', 'moderator') DEFAULT 'moderator',
	sta_status ENUM('on', 'off', 'del') DEFAULT 'on'
);

-- Cria a tabela 'article' conforme o modelo lógico
CREATE TABLE article (
	art_id INT PRIMARY KEY AUTO_INCREMENT,
    art_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    art_author INT NOT NULL,
    art_title VARCHAR(127) NOT NULL,
    art_resume VARCHAR(255) NOT NULL,
    art_thumbnail VARCHAR(255) NOT NULL,
    art_content TEXT NOT NULL,
    art_views INT NOT NULL DEFAULT 0,
    art_status ENUM('on', 'off', 'del') DEFAULT 'on',
    FOREIGN KEY (art_author) REFERENCES staff (sta_id)
);

-- Cria a tabela 'comment' conforme o modelo lógico
CREATE TABLE `comment` (
	com_id INT PRIMARY KEY AUTO_INCREMENT,
    com_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    com_article INT NOT NULL,
    com_author_name VARCHAR(127) NOT NULL,
    com_author_email VARCHAR(255) NOT NULL,
    com_comment TEXT,
	com_status ENUM('on', 'off', 'del') DEFAULT 'on',
    FOREIGN KEY (com_article) REFERENCES article (art_id)
);

-- Cria a tabela 'contact' conforme o modelo lógico
CREATE TABLE contact (
	id INT PRIMARY KEY AUTO_INCREMENT,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    name VARCHAR(127) NOT NULL, 
    email VARCHAR(255) NOT NULL, 
    subject VARCHAR(255) NOT NULL,
    message TEXT,
    status ENUM('on', 'off', 'del') DEFAULT 'on'
);

-- -------------------------------- --
-- Populando tabelas com dados fake --
-- -------------------------------- --

-- Tabela "staff" --

INSERT INTO staff (
	sta_name,
    sta_email,
    sta_password,
    sta_image,
    sta_birth,
    sta_description, 
    sta_type
) VALUES (
	'Joca da Silva',
    'jocasilva@email.com',
    SHA1('Senha123'),
    'https://randomuser.me/api/portraits/men/43.jpg',
    '2000-05-28',
    'Programador, escultor, pescador e enrolador.',
    'admin'
), (
	'Marineuza Siriliano',
    'marisiri@email.com',
    SHA1('Senha123'),
    'https://randomuser.me/api/portraits/women/6.jpg',
    '1997-12-18',
    'Programadora, psicultora, dustribuidora e controladora.',
    'author'
), (
	'Setembrino Trocatapas',
    'trocatapasset@email.com',
    SHA1('Senha123'),
    'https://randomuser.me/api/portraits/men/16.jpg',
    '1980-10-25',
    'Proramador, psicografador e destruidor de computador.',
    'moderator'
), (
	'Edicleuza Sarvastania',
    'edisarva@email.com',
    SHA1('Senha123'),
    'https://randomuser.me/api/portraits/women/25.jpg',
    '2001-06-18',
    'Programadora, organizadora e comentadora.',
    'author'
);

INSERT INTO staff (
	sta_name,
    sta_email,
    sta_password,
    sta_image,
    sta_birth,
    sta_description,
    sta_type
) VALUES (
	'Maria Oliveira',
    'maria.oliveira@email.com',
    SHA1('Senha456'),
    'https://randomuser.me/api/portraits/women/44.jpg',
    '1995-07-15',
    'Desenvolvedora, pintora, ciclista e cozinheira.',
    'author'
), (
	'Carlos Pereira',
    'carlos.pereira@email.com',
    SHA1('Senha789'),
    'https://randomuser.me/api/portraits/men/45.jpg',
    '1988-11-22',
    'Analista de sistemas, músico, fotógrafo e viajante.',
    'moderator'
), (
	'Ana Costa',
    'ana.costa@email.com',
    SHA1('Senha321'),
    'https://randomuser.me/api/portraits/women/46.jpg',
    '1992-03-10',
    'Engenheira de software, escritora, maratonista e voluntária.',
    'author'
), (
	'Pedro Souza',
    'pedro.souza@email.com',
    SHA1('Senha654'),
    'https://randomuser.me/api/portraits/men/47.jpg',
    '1985-08-30',
    'Designer gráfico, escultor, surfista e amante de gatos.',
    'author'
);


-- Tabela "article" --
INSERT INTO article (
    art_date,
    art_author,
    art_title,
    art_resume,
    art_thumbnail,
    art_content
) VALUES (
    FROM_UNIXTIME( UNIX_TIMESTAMP('2024-01-01 00:00:00') + FLOOR(RAND() * (UNIX_TIMESTAMP('2024-10-31 23:59:59') - UNIX_TIMESTAMP('2024-01-01 00:00:00'))) ),
	-- 'sta_id' de um staff existente --
	'2',
    'Primeiro artigo',
    -- Deixe os mesmos valores para todos os outros artigos
    'Lorem ipsum dolor sit amet consectetur adipisicing elit.',
    'https://picsum.photos/295',
    '
<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Velit eum, dolor ad alias nesciunt consequuntur in error enim numquam sit sunt! Quia eius tempora provident tempore culpa cupiditate sunt dignissimos?</p>
<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem qui voluptatum hic repudiandae labore quod deleniti temporibus perferendis quisquam recusandae, eum alias natus, dolor at! Error saepe est cupiditate consectetur!</p>
<img src="https://picsum.photos/200/300" alt="Imagem aleatória">
<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Eligendi consequatur laboriosam reiciendis dolorem, exercitationem dolor natus hic quisquam itaque maxime doloribus. Adipisci debitis quod perferendis repudiandae similique quam voluptatum eveniet.</p>
<h4>Links:</h4>
<ul>
    <li><a href="https://catabist.com.br">Site do Fessô</a></li>
    <li><a href="https://github.com/Luferat">Github do fessô</a></li>
</ul>
<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Perspiciatis a mollitia doloribus repudiandae incidunt ullam debitis, minima iure quia, recusandae odio magnam velit quos ad nam eaque. Ut, dolorem eveniet?</p>    
    '
), (
    FROM_UNIXTIME( UNIX_TIMESTAMP('2024-01-01 00:00:00') + FLOOR(RAND() * (UNIX_TIMESTAMP('2024-10-31 23:59:59') - UNIX_TIMESTAMP('2024-01-01 00:00:00'))) ),
	-- 'sta_id' de um staff existente --
	'4',
    'Fazendo códigos de farinha',
    -- Deixe os mesmos valores para todos os outros artigos
    'Lorem ipsum dolor sit amet consectetur adipisicing elit.',
    'https://picsum.photos/296',
    '
<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Velit eum, dolor ad alias nesciunt consequuntur in error enim numquam sit sunt! Quia eius tempora provident tempore culpa cupiditate sunt dignissimos?</p>
<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem qui voluptatum hic repudiandae labore quod deleniti temporibus perferendis quisquam recusandae, eum alias natus, dolor at! Error saepe est cupiditate consectetur!</p>
<img src="https://picsum.photos/200/300" alt="Imagem aleatória">
<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Eligendi consequatur laboriosam reiciendis dolorem, exercitationem dolor natus hic quisquam itaque maxime doloribus. Adipisci debitis quod perferendis repudiandae similique quam voluptatum eveniet.</p>
<h4>Links:</h4>
<ul>
    <li><a href="https://catabist.com.br">Site do Fessô</a></li>
    <li><a href="https://github.com/Luferat">Github do fessô</a></li>
</ul>
<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Perspiciatis a mollitia doloribus repudiandae incidunt ullam debitis, minima iure quia, recusandae odio magnam velit quos ad nam eaque. Ut, dolorem eveniet?</p>    
    '
), (
    FROM_UNIXTIME( UNIX_TIMESTAMP('2024-01-01 00:00:00') + FLOOR(RAND() * (UNIX_TIMESTAMP('2024-10-31 23:59:59') - UNIX_TIMESTAMP('2024-01-01 00:00:00'))) ),
	-- 'sta_id' de um staff existente --
	'4',
    'Como assar Python temperado com Flask',
    -- Deixe os mesmos valores para todos os outros artigos
    'Lorem ipsum dolor sit amet consectetur adipisicing elit.',
    'https://picsum.photos/297',
    '
<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Velit eum, dolor ad alias nesciunt consequuntur in error enim numquam sit sunt! Quia eius tempora provident tempore culpa cupiditate sunt dignissimos?</p>
<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem qui voluptatum hic repudiandae labore quod deleniti temporibus perferendis quisquam recusandae, eum alias natus, dolor at! Error saepe est cupiditate consectetur!</p>
<img src="https://picsum.photos/200/300" alt="Imagem aleatória">
<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Eligendi consequatur laboriosam reiciendis dolorem, exercitationem dolor natus hic quisquam itaque maxime doloribus. Adipisci debitis quod perferendis repudiandae similique quam voluptatum eveniet.</p>
<h4>Links:</h4>
<ul>
    <li><a href="https://catabist.com.br">Site do Fessô</a></li>
    <li><a href="https://github.com/Luferat">Github do fessô</a></li>
</ul>
<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Perspiciatis a mollitia doloribus repudiandae incidunt ullam debitis, minima iure quia, recusandae odio magnam velit quos ad nam eaque. Ut, dolorem eveniet?</p>    
    '
), (
    FROM_UNIXTIME( UNIX_TIMESTAMP('2024-01-01 00:00:00') + FLOOR(RAND() * (UNIX_TIMESTAMP('2024-10-31 23:59:59') - UNIX_TIMESTAMP('2024-01-01 00:00:00'))) ),
	-- 'sta_id' de um staff existente --
	'2',
    'Corrompendo o banco de dados',
    -- Deixe os mesmos valores para todos os outros artigos
    'Lorem ipsum dolor sit amet consectetur adipisicing elit.',
    'https://picsum.photos/298',
    '
<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Velit eum, dolor ad alias nesciunt consequuntur in error enim numquam sit sunt! Quia eius tempora provident tempore culpa cupiditate sunt dignissimos?</p>
<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem qui voluptatum hic repudiandae labore quod deleniti temporibus perferendis quisquam recusandae, eum alias natus, dolor at! Error saepe est cupiditate consectetur!</p>
<img src="https://picsum.photos/200/300" alt="Imagem aleatória">
<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Eligendi consequatur laboriosam reiciendis dolorem, exercitationem dolor natus hic quisquam itaque maxime doloribus. Adipisci debitis quod perferendis repudiandae similique quam voluptatum eveniet.</p>
<h4>Links:</h4>
<ul>
    <li><a href="https://catabist.com.br">Site do Fessô</a></li>
    <li><a href="https://github.com/Luferat">Github do fessô</a></li>
</ul>
<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Perspiciatis a mollitia doloribus repudiandae incidunt ullam debitis, minima iure quia, recusandae odio magnam velit quos ad nam eaque. Ut, dolorem eveniet?</p>    
    '
), (
    FROM_UNIXTIME( UNIX_TIMESTAMP('2024-01-01 00:00:00') + FLOOR(RAND() * (UNIX_TIMESTAMP('2024-10-31 23:59:59') - UNIX_TIMESTAMP('2024-01-01 00:00:00'))) ),
	-- 'sta_id' de um staff existente --
	'5',
    'Comprando códigos pela Internet',
    -- Deixe os mesmos valores para todos os outros artigos
    'Lorem ipsum dolor sit amet consectetur adipisicing elit.',
    'https://picsum.photos/299',
    '
<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Velit eum, dolor ad alias nesciunt consequuntur in error enim numquam sit sunt! Quia eius tempora provident tempore culpa cupiditate sunt dignissimos?</p>
<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem qui voluptatum hic repudiandae labore quod deleniti temporibus perferendis quisquam recusandae, eum alias natus, dolor at! Error saepe est cupiditate consectetur!</p>
<img src="https://picsum.photos/200/300" alt="Imagem aleatória">
<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Eligendi consequatur laboriosam reiciendis dolorem, exercitationem dolor natus hic quisquam itaque maxime doloribus. Adipisci debitis quod perferendis repudiandae similique quam voluptatum eveniet.</p>
<h4>Links:</h4>
<ul>
    <li><a href="https://catabist.com.br">Site do Fessô</a></li>
    <li><a href="https://github.com/Luferat">Github do fessô</a></li>
</ul>
<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Perspiciatis a mollitia doloribus repudiandae incidunt ullam debitis, minima iure quia, recusandae odio magnam velit quos ad nam eaque. Ut, dolorem eveniet?</p>    
    '
), (
    FROM_UNIXTIME( UNIX_TIMESTAMP('2024-01-01 00:00:00') + FLOOR(RAND() * (UNIX_TIMESTAMP('2024-10-31 23:59:59') - UNIX_TIMESTAMP('2024-01-01 00:00:00'))) ),
	-- 'sta_id' de um staff existente --
	'3',
    'Chuvas atrapalham códigos do Twitter',
    -- Deixe os mesmos valores para todos os outros artigos
    'Lorem ipsum dolor sit amet consectetur adipisicing elit.',
    'https://picsum.photos/300',
    '
<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Velit eum, dolor ad alias nesciunt consequuntur in error enim numquam sit sunt! Quia eius tempora provident tempore culpa cupiditate sunt dignissimos?</p>
<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem qui voluptatum hic repudiandae labore quod deleniti temporibus perferendis quisquam recusandae, eum alias natus, dolor at! Error saepe est cupiditate consectetur!</p>
<img src="https://picsum.photos/200/300" alt="Imagem aleatória">
<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Eligendi consequatur laboriosam reiciendis dolorem, exercitationem dolor natus hic quisquam itaque maxime doloribus. Adipisci debitis quod perferendis repudiandae similique quam voluptatum eveniet.</p>
<h4>Links:</h4>
<ul>
    <li><a href="https://catabist.com.br">Site do Fessô</a></li>
    <li><a href="https://github.com/Luferat">Github do fessô</a></li>
</ul>
<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Perspiciatis a mollitia doloribus repudiandae incidunt ullam debitis, minima iure quia, recusandae odio magnam velit quos ad nam eaque. Ut, dolorem eveniet?</p>    
    '
), (
    FROM_UNIXTIME( UNIX_TIMESTAMP('2024-01-01 00:00:00') + FLOOR(RAND() * (UNIX_TIMESTAMP('2024-10-31 23:59:59') - UNIX_TIMESTAMP('2024-01-01 00:00:00'))) ),
	-- 'sta_id' de um staff existente --
	'2',
    'Bolachas recheadas com Django',
    -- Deixe os mesmos valores para todos os outros artigos
    'Lorem ipsum dolor sit amet consectetur adipisicing elit.',
    'https://picsum.photos/301',
    '
<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Velit eum, dolor ad alias nesciunt consequuntur in error enim numquam sit sunt! Quia eius tempora provident tempore culpa cupiditate sunt dignissimos?</p>
<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem qui voluptatum hic repudiandae labore quod deleniti temporibus perferendis quisquam recusandae, eum alias natus, dolor at! Error saepe est cupiditate consectetur!</p>
<img src="https://picsum.photos/200/300" alt="Imagem aleatória">
<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Eligendi consequatur laboriosam reiciendis dolorem, exercitationem dolor natus hic quisquam itaque maxime doloribus. Adipisci debitis quod perferendis repudiandae similique quam voluptatum eveniet.</p>
<h4>Links:</h4>
<ul>
    <li><a href="https://catabist.com.br">Site do Fessô</a></li>
    <li><a href="https://github.com/Luferat">Github do fessô</a></li>
</ul>
<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Perspiciatis a mollitia doloribus repudiandae incidunt ullam debitis, minima iure quia, recusandae odio magnam velit quos ad nam eaque. Ut, dolorem eveniet?</p>    
    '
), (
    FROM_UNIXTIME( UNIX_TIMESTAMP('2024-01-01 00:00:00') + FLOOR(RAND() * (UNIX_TIMESTAMP('2024-10-31 23:59:59') - UNIX_TIMESTAMP('2024-01-01 00:00:00'))) ),
	-- 'sta_id' de um staff existente --
	'5',
    'Pedras que rolam na TI',
    -- Deixe os mesmos valores para todos os outros artigos
    'Lorem ipsum dolor sit amet consectetur adipisicing elit.',
    'https://picsum.photos/302',
    '
<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Velit eum, dolor ad alias nesciunt consequuntur in error enim numquam sit sunt! Quia eius tempora provident tempore culpa cupiditate sunt dignissimos?</p>
<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem qui voluptatum hic repudiandae labore quod deleniti temporibus perferendis quisquam recusandae, eum alias natus, dolor at! Error saepe est cupiditate consectetur!</p>
<img src="https://picsum.photos/200/300" alt="Imagem aleatória">
<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Eligendi consequatur laboriosam reiciendis dolorem, exercitationem dolor natus hic quisquam itaque maxime doloribus. Adipisci debitis quod perferendis repudiandae similique quam voluptatum eveniet.</p>
<h4>Links:</h4>
<ul>
    <li><a href="https://catabist.com.br">Site do Fessô</a></li>
    <li><a href="https://github.com/Luferat">Github do fessô</a></li>
</ul>
<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Perspiciatis a mollitia doloribus repudiandae incidunt ullam debitis, minima iure quia, recusandae odio magnam velit quos ad nam eaque. Ut, dolorem eveniet?</p>    
    '
) ,(
    FROM_UNIXTIME( UNIX_TIMESTAMP('2024-01-01 00:00:00') + FLOOR(RAND() * (UNIX_TIMESTAMP('2024-10-31 23:59:59') - UNIX_TIMESTAMP('2024-01-01 00:00:00'))) ),
	-- 'sta_id' de um staff existente --
	'3',
    'Construção de funções desfuncionais',
    -- Deixe os mesmos valores para todos os outros artigos
    'Lorem ipsum dolor sit amet consectetur adipisicing elit.',
    'https://picsum.photos/303',
    '
<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Velit eum, dolor ad alias nesciunt consequuntur in error enim numquam sit sunt! Quia eius tempora provident tempore culpa cupiditate sunt dignissimos?</p>
<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem qui voluptatum hic repudiandae labore quod deleniti temporibus perferendis quisquam recusandae, eum alias natus, dolor at! Error saepe est cupiditate consectetur!</p>
<img src="https://picsum.photos/200/300" alt="Imagem aleatória">
<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Eligendi consequatur laboriosam reiciendis dolorem, exercitationem dolor natus hic quisquam itaque maxime doloribus. Adipisci debitis quod perferendis repudiandae similique quam voluptatum eveniet.</p>
<h4>Links:</h4>
<ul>
    <li><a href="https://catabist.com.br">Site do Fessô</a></li>
    <li><a href="https://github.com/Luferat">Github do fessô</a></li>
</ul>
<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Perspiciatis a mollitia doloribus repudiandae incidunt ullam debitis, minima iure quia, recusandae odio magnam velit quos ad nam eaque. Ut, dolorem eveniet?</p>    
    '
), (
    FROM_UNIXTIME( UNIX_TIMESTAMP('2024-01-01 00:00:00') + FLOOR(RAND() * (UNIX_TIMESTAMP('2024-10-31 23:59:59') - UNIX_TIMESTAMP('2024-01-01 00:00:00'))) ),
	-- 'sta_id' de um staff existente --
	'4',
    'Quando os "Python" não tem vez',
    -- Deixe os mesmos valores para todos os outros artigos
    'Lorem ipsum dolor sit amet consectetur adipisicing elit.',
    'https://picsum.photos/304',
    '
<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Velit eum, dolor ad alias nesciunt consequuntur in error enim numquam sit sunt! Quia eius tempora provident tempore culpa cupiditate sunt dignissimos?</p>
<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem qui voluptatum hic repudiandae labore quod deleniti temporibus perferendis quisquam recusandae, eum alias natus, dolor at! Error saepe est cupiditate consectetur!</p>
<img src="https://picsum.photos/200/300" alt="Imagem aleatória">
<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Eligendi consequatur laboriosam reiciendis dolorem, exercitationem dolor natus hic quisquam itaque maxime doloribus. Adipisci debitis quod perferendis repudiandae similique quam voluptatum eveniet.</p>
<h4>Links:</h4>
<ul>
    <li><a href="https://catabist.com.br">Site do Fessô</a></li>
    <li><a href="https://github.com/Luferat">Github do fessô</a></li>
</ul>
<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Perspiciatis a mollitia doloribus repudiandae incidunt ullam debitis, minima iure quia, recusandae odio magnam velit quos ad nam eaque. Ut, dolorem eveniet?</p>    
    '
);

-- Tabela "comment" --
INSERT INTO comment (
	-- Insira um "art_id" existente --
	com_article,
    com_author_name,
    com_author_email,
    com_comment
) VALUES (
	'10',
    'Marlinelson',
    'marli@nelson.com',
    'É só mais um lorem ipsum.'
), (
	'10',
    'Edicleuza',
    'edi@cleuza.com',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit.'
), (
	'2',
    'Soiana',
    'soraia@email.com',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit.'
),(
	'1',
    'Edicleuson',
    'edic@email.com',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit.'
),(
	'10',
    'Normalinda',
    'normalinda@email.com',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit.'
);
