@extends('master')
@section('content')
	{{ Form::open(array('route'=>'updatetrait','method'=>'PUT')) }}
		{{ Form::hidden('id',$id) }}
		<div>
			{{ Form::label('ciri','Ciri Hero') }}
			{{ Form::text('ciri',$ciri->trait) }}
		</div>
		<div>
			{{ Form::submit('edit trait') }}
		</div>
	{{ Form::close() }}
@stop