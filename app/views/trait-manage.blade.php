<h3>Manage Trait for {{ $hero->hero_name }}</h3>
{{ Form::open(array('route'=>array('managetrait',$hero->id))) }}
	<p>Ciri-ciri Hero:</p>
	@foreach($traits as $trait)
		<label for="trait[{{$trait->id}}]">
			<input type="checkbox" name="trait[{{$trait->id}}]" id="trait[{{$trait->id}}]" value="{{$trait->id}}"{{(in_array($trait->id,$ciri)) ? ' checked="checked"' : ''}}> {{$trait->trait}}
		</label>
	@endforeach
	<div>
		<input type="submit" value="save trait">
	</div>
{{ Form::close() }}