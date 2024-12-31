<!-- resources/views/categoria.index.blade.php -->
 
@extends('layouts.app')
 
@section('title', 'Page Title')
 
@section('sidebar')
    @parent
 
    <p>Categoria - Create</p>
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

    {!! Form::open(['url' => 'categoria/create']) !!}

    {{ Form::label('nome', 'Nome:') }}<br>
    {{ Form::text('nome') }}<br>

    {{ Form::submit('ENVIAR') }}

    {!! Form::close() !!}

@endsection