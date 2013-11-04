<div id="hero-frame">
	<h2>{{ $hero->hero_name }}</h2>
	<img src="{{ Asset('img/heroimg/'.$hero->hero_img) }}" alt="{{ $hero->name}}">
	<div class="hero-desc">
		<h3>Hero Description</h3>
		@if(count($traits)>0)
		<ul>
			@foreach($traits as $ciri)
			<li>{{ $ciri->trait }}</li>
			@endforeach
		</ul>
		@endif
	</div>
</div>
<div id="hero-footer">
	<a href="{{ route('edithero',$hero->id) }}" class="btn ajax">edit</a>
	<a href="{{ route('managetrait',$hero->id) }}" class="btn ajax">manage traits</a>
</div>
<script>
	$(function(){
		$('a.ajax').on('click',function(e){
			var tujuan = $(this).attr('href');
			console.log(tujuan);
			$('.hero-desc').html('loading ...').load(tujuan);
			e.preventDefault();
		});
	});
</script>