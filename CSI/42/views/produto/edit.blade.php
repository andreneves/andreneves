@extends('adminlte::page')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Dashboard') }}</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

@if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

{{ Form::model($produto, array('route' => array('produto.update', $produto->id), 'method' => 'PUT')) }}

{{ Form::label('categoria', 'Categoria') }}
{{ Form::select('categoria_id', $categorias, $produto->categoria_id) }}
<br>
{{ Form::label('nome', 'Nome') }}
{{ Form::text('nome', $produto->nome) }}
<br>
{{ Form::label('valor', 'Valor') }}
{{ Form::text('valor', $produto->valor) }}
<br>
{{ Form::submit('Enviar') }}

{!! Form::close() !!}

</div>
</div>
</div>
</div>
</div>
@endsection