# Eloquent





### Verifica e retorna a conexão atual



```php
if(DB::connection()->getDatabaseName())
{
	// Se esta conectado
    //DB::connection()->getPdo();
    $var = "Conectado com sucesso ao banco de dados " . DB::connection()->getDatabaseName();
    //return response()->json(['var' => $var], 200);
}
```

​    
