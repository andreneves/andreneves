<!-- resources/views/produto.index.blade.php -->
 
@extends('layouts.app')
 
@section('title', 'Page Title')
 
@section('sidebar')
    @parent
 
    <p>Produto - Edit</p>
@endsection
 
@section('content')
    <p>Formulário</p>

    {!! Form::open(['url' => 'produto/' . $produto->id, 'method' => 'put']) !!}

    {{ Form::label('nome', 'Nome:') }}<br>
    {{ Form::text('nome', $produto->nome) }}<br>

    {{ Form::label('quatidade', 'Quantidade:') }}<br>
    {{ Form::text('quantidade', $produto->quantidade) }}<br>

    {{ Form::label('valor', 'Valor:') }}<br>
    {{ Form::text('valor', $produto->valor) }}<br>

    {{ Form::submit('ENVIAR') }}

    {!! Form::close() !!}

@endsection