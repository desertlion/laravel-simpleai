<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Simple AI System &raquo; Study Case: Hero choosing in DoTA 2</title>
	<link rel="stylesheet" href="{{ Asset('css/style.css') }}">
</head>
<body>
	<h1 id="logo">Dota 2</h1>
	<div id="container">
		<div id="header">
			<ul id="navigasi">
				<li>
					<a href="/">Home</a>
				</li>
				<li>
					<a href="{{ URL::to('heroes') }}">Heroes</a>
				</li>
				<li>
					<a href="{{ URL::to('traits') }}">Traits</a>
				</li>
				<li>
					<a href="{{ URL::to('hero/choose') }}">Choose Hero</a>
				</li>
			</ul>
		</div>
		<div id="content">
			@yield('content')
		</div>
		<div id="footer">
			<p>copyright &copy; <a href="http://rijalulfikri.name" taret="_blank">rijalul fikri</a> 2013{{ (date('Y')>2013) ? '-2013' : '' }}</p>
		</div>
	</div>
	<script src="{{ Asset('js/jquery-1.8.3.js') }}"></script>
	<script>
		$(function(){
			var formLoader = $('#form-loader');
			formLoader.hide();
			$('a.toggle').on('click',function(e){
				formLoader.slideToggle('fast');
				e.preventDefault();
			})
		});
	</script>
</body>
</html>