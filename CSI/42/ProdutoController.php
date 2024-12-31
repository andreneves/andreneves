<?php

namespace App\Http\Controllers;

use App\Models\Produto;
use App\Models\Categoria;
use Illuminate\Foundation\Console\ViewCacheCommand;
use Illuminate\Http\Request;

class ProdutoController extends Controller
{


    /*

	https://laravel.com/docs/8.x/controllers#actions-handled-by-resource-controller


    Dicas sobre resouces
    index - listar todos os itens
    create - exibe formulario para criacao
    store - armazena conteudo do formulário para criacao
    show - exibe um item
    edit - formulario de edicao de um item
    update - salva e edicao de um item
    destroy - exclui um item



        //index / listar
        // $produtos = Produto::orderBy('nome', 'ASC')
        //             ->get();
        // dd($produtos);


        //store / salvar
        // $produto = new Produto;
        // $produto->nome  = 'Monitor Ultrawide 36';
        // $produto->valor = 3000;
        // $produto->save();

        // dd('Salvou!');

        //show / exibir
        // $produto = Produto::findOrFail(4);
        // dd($produto);

        //update / atualizar
        // $produto = Produto::findOrFail(4);
        // $produto->nome  = 'Super Monitor Ultrawide 36 plus';
        // $produto->valor = 5000;
        // $produto->save();

        // dd('Atualizou!');

        //destroy / excluir
        $produto = Produto::findOrFail(4);
        $produto->delete();

        dd('Excluiu!');

    */


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $produtos = Produto::orderBy('nome', 'ASC')->paginate(2);
        return view('produto.index', ['produtos' => $produtos]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categorias = Categoria::orderBy('nome', 'ASC')->pluck('nome', 'id');
        return view('produto.create', ['categorias' => $categorias]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $messages = [
            'categoria_id.required'  => 'O campo categoria é obrigatorio!',
            'nome.required'  => 'O campo :attribute é obrigatorio!',
            'nome.min'       => 'O :attribute precisa ter no mínimo :min.',
            'valor.required' => 'O campo :attribute é obrigatorio!',
            'valor.numeric'  => 'O campo :attribute precisa ser numérico!',
        ];

        $validated = $request->validate([
            'categoria_id'  => 'required',
            'nome'          => 'required|min:5',
            'valor'         => 'required|numeric',
        ], $messages);

        $produto = new Produto;
        $produto->categoria_id  = $request->categoria_id;
        $produto->nome          = $request->nome;
        $produto->valor         = $request->valor;
        $produto->save();

        return redirect('/produto')->with('status', 'Produto criado com sucesso!');

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Produto  $produto
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $produto = Produto::findOrFail($id);
        return view('produto.show', ['produto' => $produto]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Produto  $produto
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $categorias = Categoria::orderBy('nome', 'ASC')->pluck('nome', 'id');
        $produto = Produto::findOrFail($id);
        return view('produto.edit', ['produto' => $produto, 'categorias' => $categorias]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Produto  $produto
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {

        $messages = [
            'categoria_id.required'  => 'O campo categoria é obrigatorio!',
            'nome.required'  => 'O campo :attribute é obrigatorio!',
            'nome.min'       => 'O :attribute precisa ter no mínimo :min.',
            'valor.required' => 'O campo :attribute é obrigatorio!',
            'valor.numeric'  => 'O campo :attribute precisa ser numérico!',
        ];

        $validated = $request->validate([
            'categoria_id'  => 'required',
            'nome' => 'required|min:5',
            'valor' => 'required|numeric',
        ], $messages);

        $produto = Produto::findOrFail($id);
        $produto->categoria_id  = $request->categoria_id;
        $produto->nome          = $request->nome;
        $produto->valor         = $request->valor;
        $produto->save();

        return redirect('/produto')->with('status', 'Produto atualizado com sucesso!');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Produto  $produto
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $produto = Produto::findOrFail($id);
        $produto->delete();

        return redirect('/produto')->with('status', 'Produto excluido com sucesso!');

    }
}
