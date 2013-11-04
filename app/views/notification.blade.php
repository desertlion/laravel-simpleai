<div id="notif-box">
	@if (count($errors->all()) > 0)
	<div class="alert-box alert alert-block">
		<h4>Ups, terjadi kesalahan!</h4>
		Harap perbaiki kesalahan-kesalahan berikut:
		<ul>
		@foreach($errors->all() as $error)
			<li>{{ $error }}</li>
		@endforeach
		</ul>
	</div>
	@endif

	@if ($message = Session::get('success'))
	<div class="alert-box success alert-block">
		<h4>Success</h4>
		{{ $message }}
	</div>
	@endif

	@if ($message = Session::get('error'))
	<div class="alert-box alert alert-block">
		<h4>Error</h4>
		{{ $message }}
	</div>
	@endif

	@if ($message = Session::get('warning'))
	<div class="alert-box warning alert-block">
		<h4>Warning</h4>
		{{ $message }}
	</div>
	@endif

	@if ($message = Session::get('info'))
	<div class="alert-box info alert-block">
		<h4>Info</h4>
		{{ $message }}
	</div>
	@endif
</div>