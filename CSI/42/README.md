# Código útil

### dump-autoload
```
composer dump-autoload
```

### Instalação Laravel
```
composer create-project laravel/laravel nome_do_projeto
```

### Comandos para limpeza de cache, config e view
```
php artisan config:clear
php artisan cache:clear
php artisan view:clear
```

### Instalação de dependências
```
composer install
```

### Faz uma cópia do arquivo de exmplo e cria o .ENV
```
copy .env.example .env
```

### Gerar a app_key no arquivo .env
```
php artisan key:generate
```

### Criação de um link simbólico com o storage
```
php artisan storage:link
```

### Model
```
php artisan make:model NomeDoModel
```

#### Cria controller com resource (CRUD)
```
php artisan make:controller AlgumaController --resource
```

#### Cria Migration
```
php artisan make:migration create_produtos_table
```

#### Roda a migrate
```
php artisan migrate
```

#### Cria seed 
```
php artisan make:seeder ProdutoSeeder
```

#### Roda o seed
```
php artisan db:seed
```

### Roda a migrate e seed
```
php artisan migrate:refresh --seed
```

### Cria Controller com resource e Model

```
php artisan make:controller BulkImportController --resource --model=BulkImport
```

### Reditect
```
return redirect()->action(
            [SolicitacaoArquivoController::class, 'verificar'], ['id' => $request->solicitacaoId]
        )->with('message', 'Acessar como cliente ' . $user->accessAs . ' efetuado com sucesso!');
```

# utilidades

## Text2bin - Conversor de Texto para Binário
https://github.com/andreneves/utilidades/tree/main/Text2bin



### transaction
```
try {
    DB::beginTransaction();
    // database queries here
    DB::commit();
} catch (\PDOException $e) {
    // Woopsy
    DB::rollBack();
}
```