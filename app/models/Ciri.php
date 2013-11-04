<?php
class Ciri extends Eloquent{
	
	protected $table = 'traits';

	public function heroes()
	{
		return $this->belongsToMany('heroes');
	}
}