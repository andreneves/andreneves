<!-- resources/views/produto.index.blade.php -->
 
@extends('adminlte::page')
 
@section('title', 'Page Title')
 
@section('sidebar')
    @parent
 
    <p>Produto - Index</p>
@endsection
 
@section('content')

@if (session('status'))
    <div class="alert alert-success" role="alert">
        {{ session('status') }}
    </div>
@endif

<a href="{{ url('produto/create') }}">CRIAR</a>

    <p>Conteúdo</p>

    <table>
        <tr>
          <th>nome</th>
          <th>quantidade</th>
          <th>valor</th>
          <th></th>
          <th></th>
          <th></th>
        </tr>

        @foreach ($produtos as $value)
        <tr>
            <td>{{ $value->nome         }}</td>
            <td>{{ $value->quantidade   }}</td>
            <td>{{ $value->valor        }}</td>
            <td><a href="{{ url('produto/' . $value->id) }}">Visualizar</a></td>
            <td><a href="{{ url('produto/' . $value->id . '/edit') }}">Editar</a></td>
            <td>
                {!! Form::open(['url' => 'produto/' . $value->id, 'method' => 'delete']) !!}
                {{ Form::submit('DELETAR') }}
                {!! Form::close() !!}
            </td>
        </tr>
        @endforeach

    </table>
@endsection