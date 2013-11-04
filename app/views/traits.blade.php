@extends('master')
@section('content')
	<div class="app-header">
		<h2>Traits</h2>
		<a href="#" class="toggle">Tambah Traits</a>
		<div id="form-loader">
			<h3>Tambah Ciri-ciri Hero</h3>
			<hr>
			{{ Form::open(array('route'=>'posttrait')) }}
				<div>
					{{ Form::label('ciri','Ciri Hero') }}
					{{ Form::text('ciri') }}
				</div>
				<div>
					{{ Form::submit('tambah trait') }}
				</div>
			{{ Form::close() }}
		</div>
	</div>
	<table>
		<thead>
			<tr>
				<th>No</th>
				<th>Trait</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<?php $i=1; ?>
			@foreach($ciris as $ciri)
			<tr>
				<td>{{ $i++ }}</td>
				<td>{{ $ciri->trait }}</td>
				<td>
					<a href="{{ URL::route('edittrait',$ciri->id) }}" class="btn">edit</a>
					<a href="{{ URL::route('deletetrait',$ciri->id) }}" class="btn" onclick="return confirm('Apakah anda yakin?')">delete</a>
				</td>
			</tr>
			@endforeach
		</tbody>
	</table>
@stop