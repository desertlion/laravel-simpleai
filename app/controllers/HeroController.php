<?php
class HeroController extends BaseController
{
	public function getIndex()
	{
		return View::make('heroes');
	}
	public function postStore()
	{
		/*$input = Input::all();
		$rules = array('trait'=>'required');
		$v = Validator::make($input,$rules);
		if($v->fails()) return Redirect::back()->withError($v)->withInput();

		$trait = new Trait;
		$trait->label = Input::get('trait');
		$trait->save();

		Session::flash('Trait berhasil diinput');
		return Redirect::to('traits');*/
	
		$input = Input::all();
		$rules = array('namahero'=>'required');
		$v = Validator::make($input,$rules);
		if($v->fails()) return Redirect::back()->withError($v)->withInput();

		$hero = new Hero;
		$hero->name = Input::get('namahero');
		$hero->save();

		Session::flash('success','Hero berhasil ditambah');
		return Redirect::to('heroes');
	}
}