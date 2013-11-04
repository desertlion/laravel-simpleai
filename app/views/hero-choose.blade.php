@extends('master')
@section('content')
	<div class="app-header">
		<h2>Berikan Deskripsi Hero</h2>
	</div>
	<div>
		{{ Form::open(array('route'=>'chooseheroprocess')) }}
			{{ Form::hidden('id',$soal->id) }}
			{{ $soal->trait }}
			<label for="ya"><input type="radio" id="ya" value="ya" name="ciri"> ya</label>
			<label for="tidak"><input type="radio" id="tidak" value="tidak" name="ciri"> tidak</label>
			{{ Form::submit('Submit') }}
		{{ Form::close() }}
	</div>
@stop