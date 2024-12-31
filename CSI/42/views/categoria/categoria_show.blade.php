<!-- resources/views/categoria.index.blade.php -->
 
@extends('layouts.app')
 
@section('title', 'Page Title')
 
@section('sidebar')
    @parent
 
    <p>Categoria - Show</p>
@endsection
 
@section('content')
    <p>Conteúdo</p>

    <p><strong>id:</strong> {{ $categoria->id }}</p>
    <p><strong>nome:</strong> {{ $categoria->nome }}</p>
    <p><strong>criacao:</strong> {{ $categoria->created_at }}</p>

@endsection