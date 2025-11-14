# **Trabalho Avaliativo 2º BIM – Refatoração com Clean Code e SOLID**  
**Total: 50 pontos (10 questões × 5 pts)**

---

## 📝 **Instruções Gerais**

- Este trabalho tem como objetivo avaliar sua capacidade de identificar problemas de legibilidade, duplicação e responsabilidade única em códigos PHP simples.  
- Para cada questão, refatore o código apresentado **sem alterar a lógica original**, apenas melhorando a forma.  
- Inclua suas respostas em um arquivo `.zip`, `.pdf` ou `.php`.  
- Você pode responder usando comentários no código ou criando um arquivo separado chamado `RESPOSTAS.md`.  
- Cada questão vale **5 pontos**. Pontuação total: **50 pontos**.

---

## 📊 **Rubrica de Correção (por questão – 5 pontos)**

| Critério | Pontos |
|---------|--------|
| Código funciona após a refatoração | **1.0** |
| Problemas principais foram identificados | **1.0** |
| Legibilidade melhorou significativamente | **1.0** |
| Redução de duplicação / melhoria de responsabilidade | **1.0** |
| Explicação curta das mudanças (1–3 linhas) | **1.0** |

---

# 🔟 **QUESTÕES**

---

## **Questão 1 – Nomes ruins e falta de clareza** *(5 pts)*

Refatore o código abaixo melhorando legibilidade e clareza dos nomes.

```php
<?php

function f($a, $b) {
    $c = $a + $b;
    return $c;
}

echo f(10, 5);
```

---

## **Questão 2 – Função fazendo mais do que deveria** *(5 pts)*

A função soma **e imprime**. Separe responsabilidades.

```php
<?php

function somar($x, $y) {
    $resultado = $x + $y;
    echo "Resultado: " . $resultado;
}

somar(3, 4);
```

---

## **Questão 3 – Código duplicado** *(5 pts)*

A mesma lógica aparece duas vezes. Evite duplicação.

```php
<?php

function totalCarrinho1($p1, $p2) {
    $total = $p1 + $p2;
    return $total;
}

function totalCarrinho2($p1, $p2, $p3) {
    $total = $p1 + $p2 + $p3;
    return $total;
}

echo totalCarrinho1(10, 20);
echo totalCarrinho2(5, 15, 25);
```

---

## **Questão 4 – Magic numbers** *(5 pts)*

Evite valores "mágicos" no código.

```php
<?php

function calcularSalarioComBonus($salarioBase) {
    $salarioFinal = $salarioBase + ($salarioBase * 0.1);
    return $salarioFinal;
}

echo calcularSalarioComBonus(2000);
```

---

## **Questão 5 – Muitos IFs** *(5 pts)*

Refatore para estrutura mais limpa.

```php
<?php

function calcularFrete($cidade) {
    if ($cidade == 'RIO') {
        return 20;
    } else if ($cidade == 'SP') {
        return 25;
    } else if ($cidade == 'BH') {
        return 18;
    } else {
        return 30;
    }
}

echo calcularFrete('RIO');
```

---

## **Questão 6 – Falta de encapsulamento** *(5 pts)*

Evite propriedades públicas sem controle.

```php
<?php

class Produto {
    public $nome;
    public $preco;
}

$produto = new Produto();
$produto->nome = "Camiseta";
$produto->preco = -10;
```

---

## **Questão 7 – Mistura de lógica e mensagens** *(5 pts)*

Separe validação de exibição.

```php
<?php

function cadastrarUsuario($nome, $email) {
    if (empty($nome)) {
        echo "Nome inválido";
        return;
    }

    if (empty($email)) {
        echo "Email inválido";
        return;
    }

    echo "Usuário cadastrado com sucesso!";
}

cadastrarUsuario("", "teste@exemplo.com");
```

---

## **Questão 8 – Nomes genéricos demais** *(5 pts)*

Deixe a intenção clara.

```php
<?php

function p($a) {
    for ($i = 0; $i < count($a); $i++) {
        echo $a[$i] . "\n";
    }
}

p([1, 2, 3]);
```

---

## **Questão 9 – Dupla responsabilidade** *(5 pts)*

A classe calcula **e imprime**. Separe responsabilidades.

```php
<?php

class Pedido {
    public function calcularTotal($itens) {
        $total = 0;
        foreach ($itens as $item) {
            $total += $item['preco'] * $item['quantidade'];
        }

        echo "Total do pedido: " . $total;
        return $total;
    }
}

$pedido = new Pedido();
$pedido->calcularTotal([
    ['preco' => 10, 'quantidade' => 2],
    ['preco' => 5, 'quantidade' => 1],
]);
```

---

## **Questão 10 – Duplicação de lógica** *(5 pts)*

Evite código repetido, criando uma função.

```php
<?php

$nome1 = "Ana";
$mensagem1 = "Olá, " . $nome1 . "! Seja bem-vinda.";
echo $mensagem1 . "\n";

$nome2 = "Carlos";
$mensagem2 = "Olá, " . $nome2 . "! Seja bem-vindo.";
echo $mensagem2 . "\n";
```

---
