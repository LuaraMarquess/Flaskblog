-- POPULANDO TABELAS

																								-- INSERT TABELA STAFF -----


INSERT INTO staff (
	emp_name,
    emp_email,
    emp_password,
    emp_image,
    emp_birth,
    emp_description
) VALUES (
	'Joca da Silva',
    'jocasilva@email.com',
    SHA1('Senha123'),
    'https://randomuser.me/api/portraits/men/43.jpg',
    '2000-05-28',
    'Programador, escultor, pescador e enrolador.'
), (
	'Marineuza Siriliano',
    'marisiri@email.com',
    SHA1('Senha123'),
    'https://randomuser.me/api/portraits/women/6.jpg',
    '1997-12-18',
    'Programadora, psicultora, dustribuidora e controladora.'
), (
	'Setembrino Trocatapas',
    'trocatapasset@email.com',
    SHA1('Senha123'),
    'https://randomuser.me/api/portraits/men/16.jpg',
    '1980-10-25',
    'Proramador, psicografador e destruidor de computador.'
), (
	'Edicleuza Sarvastania',
    'edisarva@email.com',
    SHA1('Senha123'),
    'https://randomuser.me/api/portraits/women/25.jpg',
    '2001-06-18',
    'Programadora, organizadora e comentadora.'
);

INSERT INTO staff (
	emp_name,
    emp_email,
    emp_password,
    emp_image,
    emp_birth,
    emp_description
    
) VALUES (
	'Maria Oliveira',
    'maria.oliveira@email.com',
    SHA1('Senha456'),
    'https://randomuser.me/api/portraits/women/44.jpg',
    '1995-07-15',
    'Desenvolvedora, pintora, ciclista e cozinheira.'
);

INSERT INTO staff (
	emp_name,
    emp_email,
    emp_password,
    emp_image,
    emp_birth,
    emp_description
) VALUES (
	'Carlos Pereira',
    'carlos.pereira@email.com',
    SHA1('Senha789'),
    'https://randomuser.me/api/portraits/men/45.jpg',
    '1988-11-22',
    'Analista de sistemas, músico, fotógrafo e viajante.'
);

INSERT INTO staff (
	emp_name,
    emp_email,
    emp_password,
    emp_image,
    emp_birth,
    emp_description
) VALUES (
	'Ana Costa',
    'ana.costa@email.com',
    SHA1('Senha321'),
    'https://randomuser.me/api/portraits/women/46.jpg',
    '1992-03-10',
    'Engenheira de software, escritora, maratonista e voluntária.'
);

INSERT INTO staff (
	emp_name,
    emp_email,
    emp_password,
    emp_image,
    emp_birth,
    emp_description
) VALUES (
	'Pedro Souza',
    'pedro.souza@email.com',
    SHA1('Senha654'),
    'https://randomuser.me/api/portraits/men/47.jpg',
    '1985-08-30',
    'Designer gráfico, escultor, surfista e amante de gatos.'
);


																										-- INSERT TABELA ARTICLE --

INSERT INTO article (
    art_author,
    art_title,
    art_resume,
    art_thumbnail,
    art_content
) VALUES (
	-- 'emp_id' de um staff existente --
	'2',
    'Primeiro artigo',
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
	-- 'emp_id' de um staff existente --
	'4',
    'Fazendo códigos de farinha',
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
	-- 'emp_id' de um staff existente --
	'4',
    'Como assar Python temperado com Flask',
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
	-- 'emp_id' de um staff existente --
	'2',
    'Corrompendo o banco de dados',
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
	-- 'emp_id' de um staff existente --
	'5',
    'Comprando códigos pela Internet',
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
	-- 'emp_id' de um staff existente --
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
	-- 'emp_id' de um staff existente --
	'2',
    'Bolachas recheadas com Django',
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
	-- 'emp_id' de um staff existente --
	'5',
    'Pedras que rolam na TI',
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
) ,(
	-- 'emp_id' de um staff existente --
	'3',
    'Construção de funções desfuncionais',
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
	-- 'emp_id' de um staff existente --
	'4',
    'Quando os "Python" não tem vez',
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
);


																			-- INSERT TABELA COMMENTS--
                                                                                    
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



-- ------------------

                                                                                    



-- ----------------------------------- --
-- Testes de SELECT                    --
-- Dica: execute uma linha de cada vez --
-- ----------------------------------- --






 
