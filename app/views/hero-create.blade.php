<h2>Tambah Hero Baru</h2>
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