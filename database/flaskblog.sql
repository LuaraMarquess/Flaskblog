-- Apaga o banco de dados se ele exisir
-- Perigo! Só faça isso em tempo de desenvolvimemento.

DROP DATABASE IF EXISTS flasKblogdb;

-- (RE) CRIA O BANCO DE BD
-- PERIGO! SÓ FAÇA ISSO EM TEMPO DE DESENVOLVIMENTO.

CREATE DATABASE flaskblogdb

		CHARACTER SET utf8mb4        -- USANDO TABELA DE CARACTERES UNIVERSAL EXTENDIDA.
		COLLATE utf8mb4_general_ci;  -- BUSCAS TAMBÉM EM UTF8 E CASE INSENSITIVE.
        
        USE flaskblogdb; -- SELECIONA O BANCO DE DADOS PARA OS PRÓXIMOS COMANDOS.
        
        -- TIMESTAMP DEFAULT CURRENT_TIMESTAMP DEFINE A DATA COM VALOR DO SISTEMA
        
	CREATE TABLE staff
				(emp_id INT PRIMARY KEY AUTO_INCREMENT,
				emp_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
						   emp_name VARCHAR (127) NOT NULL,
                           emp_emaiL VARCHAR(255), -- DEFINE O EMAIL DO USUÁRIO COM 255 CARACTERESD (RFC)
                           emp_password VARCHAR(63),
						   emp_image VARCHAR(255),
                           emp_birth DATE NOT NULL,
						   emp_description VARCHAR(255), 
                           emp_type ENUM('admin','author','moderator') DEFAULT 'moderator',
						   emp_status ENUM('on' ,'off','del') DEFAULT 'on'
                           );
                         
		CREATE TABLE article(
							art_id Int PRIMARY KEY NOT NULL AUTO_INCREMENT,
							art_date Date,
							art_autor INT NOT NULL,
							art_title VARCHAR(127),
							art_resume VARCHAR(255),
                            art_thumbmail VARCHAR(255),
							art_contect TEXT NOT NULL,
							art_views INT NOT NULL DEFAULT 0,
							art_status ENUM('on','off','del') DEFAULT 'on',
							FOREIGN KEY (art_autor) REFERENCES staff(emp_id)
                             );
                             
	 CREATE TABLE contact(
							id Int PRIMARY KEY AUTO_INCREMENT,
							date Datetime NOT NULL,
							name VARCHAR(127) NOT NULL,
							email VARCHAR(255) NOT NULL,
							subject VARCHAR(255) NOT NULL,
							message text,
							status  ENUM('on','off','del') DEFAULT 'on'
						);
                        
     CREATE TABLE comment(
							com_id INT PRIMARY KEY AUTO_INCREMENT,
							com_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
							com_article INT NOT NULL,
							com_autor_name VARCHAR(127) NOT NULL,
							com_autor_email VARCHAR(255) NOT NULL,
							com_comment TEXT,
                            com_status ENUM('on','off','del') DEFAULT 'on',
                            FOREIGN KEY(com_article) REFERENCES article(art_id)
						);


-- POPULAR TABELAS

INSERT INTO staff(
                  emp_name,emp_email,emp_password,emp_image, emp_birth,emp_type,emp_description
                  )values('Joca da Silva',
                  'joca@silva.com',
                  SHA1('senha123'), -- SHA1 CRIPTOGRAFIA A SENHA É UMA DAS FORMAS
                  'https://randomuser.me/api/portraits/men/15.jpg',
                  '2000-03-27',
                  'author',
                  'Programador,desenvolvedor,enrolador e devedor'
                  );
				