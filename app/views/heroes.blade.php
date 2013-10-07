@extends('master')
@section('content')
	<img src="{{ Asset('img/heroes.jpg') }}" alt="" id="gambar-heroes">
	<div class="app-header">
		<h2>Heroes</h2>
		<a href="#" class="toggle">Tambah Hero</a>
		<div id="form-loader">
			<h3>Tambah Hero Baru</h3>
			<hr>
			{{ Form::open() }}
				<div>
					{{ Form::label('namahero','Nama Hero') }}
					{{ Form::text('namahero') }}
				</div>
				<div>
					{{ Form::submit('tambah hero') }}
				</div>
			{{ Form::close() }}
		</div>
	</div>
@stop