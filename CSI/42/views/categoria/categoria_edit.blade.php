<!-- resources/views/produto.index.blade.php -->
 
@extends('layouts.app')
 
@section('title', 'Page Title')
 
@section('sidebar')
    @parent
 
    <p>Categoria - Edit</p>
@endsection
 
@section('content')
    <p>Formulário</p>

    {!! Form::open(['url' => 'categoria/' . $categoria->id, 'method' => 'put']) !!}

    {{ Form::label('nome', 'Nome:') }}<br>
    {{ Form::text('nome', $categoria->nome) }}<br>

    {{ Form::submit('ENVIAR') }}

    {!! Form::close() !!}

@endsection