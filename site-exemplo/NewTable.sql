                DB::statement("
                    CREATE TABLE mati_" . $request->nome.".inventario_artigos_categorias (
                        codigo VARCHAR(255),
                        nome VARCHAR(255),
                        descricao VARCHAR(255),
                        data_registo DATETIME,
                        data_actualizacao DATETIME,
                        PRIMARY KEY (codigo)
                    );
                ");

                DB::insert("
                    INSERT INTO mati_" . $request->nome.".inventario_artigos_categorias (codigo, nome, descricao, data_registo, data_actualizacao) VALUES
                    ('". uniqid() ."', 'GL', 'Geral', '".date('Y-m-d H:m:s')."', '".date('Y-m-d H:m:s')."');
                ");

                DB::statement("
                    CREATE TABLE mati_" . $request->nome.".inventario_artigos_unidades (
                        codigo VARCHAR(255),
                        nome VARCHAR(255),
                        descricao VARCHAR(255),
                        data_registo DATETIME,
                        data_actualizacao DATETIME,
                        PRIMARY KEY (codigo)
                    );
                ");

                DB::insert("
                    INSERT INTO mati_" . $request->nome.".inventario_artigos_unidades (codigo, nome, descricao, data_registo, data_actualizacao) VALUES
                    ('". uniqid() ."', 'UN', 'Unidade', '".date('Y-m-d H:m:s')."', '".date('Y-m-d H:m:s')."'),
                    ('". uniqid() ."', 'KG', 'Kilograma', '".date('Y-m-d H:m:s')."', '".date('Y-m-d H:m:s')."'),
                    ('". uniqid() ."', 'L', 'Litro', '".date('Y-m-d H:m:s')."', '".date('Y-m-d H:m:s')."');
                ");

                DB::statement("
                    CREATE TABLE mati_" . $request->nome.".inventario_artigos_armazens (
                        codigo VARCHAR(255),
                        nome VARCHAR(255),
                        descricao VARCHAR(255),
                        estado BOOLEAN,
                        data_registo DATETIME,
                        data_actualizacao DATETIME,
                        PRIMARY KEY (codigo)
                    );
                ");

                DB::insert("
                    INSERT INTO mati_" . $request->nome.".inventario_artigos_armazens (codigo, nome, descricao, estado, data_registo, data_actualizacao) VALUES
                    ('". uniqid() ."', 'A', 'Armazém  A', 1, '".date('Y-m-d H:m:s')."', '".date('Y-m-d H:m:s')."');
                ");

                DB::statement("
                    CREATE TABLE mati_" . $request->nome.".inventario_artigos (
                        codigo VARCHAR(255),
                        codigo_iva VARCHAR(255),
                        codigo_unidade VARCHAR(255),
                        codigo_armazen VARCHAR(255),
                        codigo_categoria VARCHAR(255),
                        nome VARCHAR(255),
                        descricao VARCHAR(255),
                        referencia VARCHAR(255),
                        imagem VARCHAR(255),
                        documentacao VARCHAR(255),
                        estado BOOLEAN,
                        codigo_barras1 VARCHAR(255),
                        codigo_barras2 VARCHAR(255),
                        codigo_barras3 VARCHAR(255),
                        pvp_moeda_base VARCHAR(255),
                        pvp_moeda_alt VARCHAR(255),
                        data_registo DATETIME,
                        data_actualizacao DATETIME,
                        PRIMARY KEY (codigo),
                        CONSTRAINT FK_inventario_artigos_iva FOREIGN KEY (codigo_iva)
                        REFERENCES config_plano_iva(codigo),
                        CONSTRAINT FK_inventario_artigos_unidade FOREIGN KEY (codigo_unidade)
                        REFERENCES inventario_artigos_unidades(codigo),
                        CONSTRAINT FK_inventario_artigos_armazens FOREIGN KEY (codigo_armazen)
                        REFERENCES inventario_artigos_armazens (codigo),
                        CONSTRAINT FK_inventario_artigos_categorias FOREIGN KEY (codigo_categoria)
                        REFERENCES inventario_artigos_categorias(codigo)                        
                    );
                ");

                DB::statement("
                    CREATE TABLE mati_" . $request->nome.".inventario_artigos_preco_moedas (
                        codigo VARCHAR(255),
                        codigo_artigo VARCHAR(255),
                        codigo_moeda VARCHAR(255),
                        pvp1 DOUBLE,
                        pvp2 DOUBLE,
                        pvp3 DOUBLE,
                        desconto_percentual BOOLEAN,
                        percentagem DOUBLE,
                        desconto DOUBLE,
                        data_registo DATETIME,
                        data_actualizacao DATETIME,
                        PRIMARY KEY (codigo)
                    );
                ");

                DB::statement("
                    CREATE TABLE mati_" . $request->nome.".inventario_stock_tipomovimentos (
                        codigo VARCHAR(255),
                        nome VARCHAR(255),
                        descricao VARCHAR(255),
                        data_registo DATETIME,
                        data_actualizacao DATETIME,
                        PRIMARY KEY (codigo)
                    );
                ");

                DB::insert("
                    INSERT INTO mati_" . $request->nome.".inventario_stock_tipomovimentos (codigo, nome, descricao, data_registo, data_actualizacao) VALUES
                    ('". uniqid() ."', 'ENT', 'Entrada', '".date('Y-m-d H:m:s')."', '".date('Y-m-d H:m:s')."'),
                    ('". uniqid() ."', 'SAD', 'Saida', '".date('Y-m-d H:m:s')."', '".date('Y-m-d H:m:s')."'),
                    ('". uniqid() ."', 'TRF', 'Transferência', '".date('Y-m-d H:m:s')."', '".date('Y-m-d H:m:s')."');
                ");

                DB::statement("
                    CREATE TABLE mati_" . $request->nome.".inventario_stock_movimentos (
                        codigo VARCHAR(255),
                        codigo_artigo VARCHAR(255),
                        codigo_tipo_movimento VARCHAR(255),
                        codigo_armazen_entrada VARCHAR(255),
                        codigo_armazen_saida VARCHAR(255),
                        quantidade DOUBLE,
                        preco DOUBLE,
                        data_registo DATETIME,
                        data_actualizacao DATETIME,
                        PRIMARY KEY (codigo),
                        CONSTRAINT FK_inventario_stock_movimentos_artigos FOREIGN KEY (codigo_artigo)
                        REFERENCES inventario_stock_movimentos_artigos(codigo),
                        CONSTRAINT FK_inventario_stock_movimentos_tipomovimentos FOREIGN KEY (codigo_tipo_movimento)
                        REFERENCES inventario_stock_movimentos_tipomovimentos(codigo)
                    );
                ");

                DB::statement("
                    CREATE TABLE mati_" . $request->nome.".restauracao_pratos_categorias (
                        codigo VARCHAR(255),
                        nome VARCHAR(255),
                        descricao VARCHAR(255),
                        data_registo DATETIME,
                        data_actualizacao DATETIME,
                        PRIMARY KEY (codigo)
                    );
                ");

                DB::insert("
                    INSERT INTO mati_" . $request->nome.".restauracao_pratos_categorias (codigo, nome, descricao, data_registo, data_actualizacao) VALUES
                    ('". uniqid() ."', 'GL', 'Geral', '".date('Y-m-d H:m:s')."', '".date('Y-m-d H:m:s')."');
                ");

                DB::statement("
                    CREATE TABLE mati_" . $request->nome.".restauracao_pratos (
                        codigo VARCHAR(255),
                        codigo_iva VARCHAR(255),
                        codigo_categoria VARCHAR(255),
                        nome VARCHAR(255),
                        descricao VARCHAR(255),
                        imagem VARCHAR(255),
                        estado BOOLEAN,
                        data_registo DATETIME,
                        data_actualizacao DATETIME,
                        PRIMARY KEY (codigo),
                        CONSTRAINT FK_inventario_artigos_iva FOREIGN KEY (codigo_iva)
                        REFERENCES config_plano_iva(codigo),
                        CONSTRAINT FK_restauracao_pratos_categorias FOREIGN KEY (codigo_categoria)
                        REFERENCES restauracao_pratos_categorias(codigo)                        
                    );
                ");

                DB::statement("
                    CREATE TABLE mati_" . $request->nome.".restauracao_pratos_artigos (
                        codigo VARCHAR(255),
                        codigo_prato VARCHAR(255),
                        codigo_artigo VARCHAR(255),
                        data_registo DATETIME,
                        data_actualizacao DATETIME,
                        PRIMARY KEY (codigo),
                        CONSTRAINT FK_inventario_artigos_iva FOREIGN KEY (codigo_iva)
                        REFERENCES config_plano_iva(codigo),
                        CONSTRAINT FK_restauracao_pratos_artigos_pratos FOREIGN KEY (codigo_prato)
                        REFERENCES restauracao_pratos_artigos_pratos (codigo),
                        CONSTRAINT FK_restauracao_pratos_artigos FOREIGN KEY (codigo_artigo)
                        REFERENCES restauracao_pratos_artigos(codigo)                        
                    );
                ");
































