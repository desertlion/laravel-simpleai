@extends('master')
@section('content')
	<img src="{{ Asset('img/heroes.jpg') }}" alt="" id="gambar-heroes">
	<div class="app-header">
		<h2>Hero yang Anda cari Adalah:</h2>
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