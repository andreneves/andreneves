<!-- resources/views/produto.index.blade.php -->
 
@extends('layouts.app')
 
@section('title', 'Page Title')
 
@section('sidebar')
    @parent
 
    <p>Produto - Create</p>
@endsection
 
@section('content')
    <p>Formulário</p>

    @if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
    @endif

    {!! Form::open(['url' => 'produto/create']) !!}

    {{ Form::label('nome', 'Nome:') }}<br>
    {{ Form::text('nome') }}<br>

    {{ Form::label('quatidade', 'Quantidade:') }}<br>
    {{ Form::text('quantidade') }}<br>

    {{ Form::label('valor', 'Valor:') }}<br>
    {{ Form::text('valor') }}<br>

    {{ Form::submit('ENVIAR') }}

    {!! Form::close() !!}

@endsection