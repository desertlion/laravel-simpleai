<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Simple AI System &raquo; Study Case: Hero choosing in DoTA 2</title>
	<link rel="stylesheet" href="{{ Asset('css/style.css') }}">
	<!-- Add fancyBox -->
	<link rel="stylesheet" href="{{ Asset('js/fancybox/source/jquery.fancybox.css?v=2.1.5') }}" type="text/css" media="screen" />
</head>
<body>
	<h1 id="logo">Dota 2</h1>
	<div id="container">
		<div id="header">
			<ul id="navigasi">
				<li>
					<a href="{{ URL::to('/') }}">Home</a>
				</li>
				<li>
					<a href="{{ URL::route('heroeslist') }}">Heroes</a>
				</li>
				<li>
					<a href="{{ URL::route('traitslist') }}">Traits</a>
				</li>
				<li>
					<a href="{{ URL::route('choosehero') }}">Choose Hero</a>
				</li>
			</ul>
		</div>
		<div id="content">
			@if(count($errors)>0 or Session::get('success') or Session::get('error'))
				@include('notification')
			@endif
			@yield('content')
		</div>
		<div id="footer">
			<p>copyright &copy; <a href="http://rijalulfikri.name" target="_blank">rijalul fikri</a> 2013{{ (date('Y')>2013) ? '-2013' : '' }}</p>
		</div>
	</div>
	<script src="{{ Asset('js/jquery-1.10.2.min.js') }}"></script>
	<script type="text/javascript" src="{{ Asset('js/fancybox/source/jquery.fancybox.pack.js?v=2.1.5') }}"></script>
	<script>
		$(function(){
			var formLoader = $('#form-loader');
			formLoader.hide();
			$('a.toggle').on('click',function(e){
				formLoader.slideToggle('fast');
				e.preventDefault();
			});
			$(".fancybox").fancybox();
		});
	</script>
</body>
</html>