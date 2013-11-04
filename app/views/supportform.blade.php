@extends('master')
@section('content')
	{{ Form::open(['url'=>'support/store']) }}
		{{ Form::label('email','Email') }}
		{{ Form::text('email') }}

		{{ Form::label('body') }}
		{{ Form::textarea('body') }}

		{{ Form::submit('kirim') }}
	{{ Form::close() }}
@stop()