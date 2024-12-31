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

<h2>Produto</h2>
<p><b>Categoria:</b> {{ $produto->categoria->nome   }} </p>
<p><b>Nome:</b>      {{ $produto->nome              }} </p>
<p><b>Valor:</b>     {{ $produto->valor             }} </p>
<p><b>Criação:</b>   {{ $produto->created_at        }} </p>

</div>
</div>
</div>
</div>
</div>
@endsection
