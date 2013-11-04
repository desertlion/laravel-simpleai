@extends('master')
@section('content')
	<img src="{{ Asset('img/heroes.jpg') }}" alt="" id="gambar-heroes">
	<div class="app-header">
		<h2>Heroes</h2>
		<a href="#" class="toggle">Tambah Hero</a>
		<div id="form-loader">
			<h3>Tambah Hero Baru</h3>
			<hr>
			{{ Form::open(array('url'=>'hero/store','files'=>'true')) }}
				<div>
					{{ Form::label('namahero','Nama Hero') }}
					{{ Form::text('namahero') }}
				</div>
				<div>
					{{ Form::label('heroimg','Hero Image') }}
					{{ Form::file('heroimg') }}
				</div>
				<div>
					{{ Form::submit('tambah hero') }}
				</div>
			{{ Form::close() }}
		</div>
	</div>
	@if(count($heroes)>0)
	<ul id="hero-list">
		@foreach($heroes as $hero)
		<li>
			<a class="fancybox fancybox.ajax" href="{{ route('herodetail',$hero->id) }}">
				<img src="{{ Asset('img/heroimg/'.$hero->hero_img) }}" alt="{{ $hero->name}}">
				<div>{{ $hero->hero_name }}</div>
			</a>
		</li>
		@endforeach
	</ul>
	@endif
@stop