<?php
class Hero extends Eloquent{
	protected $table = 'heroes';

	public function traits()
	{
		return $this->belongsToMany('ciri');
	}
}