<?php
class TraitController extends BaseController
{
	public function getIndex()
	{
		$ciris = Ciri::all();
		return View::make('traits',array('ciris'=>$ciris));
	}
	public function postStore()
	{
		$input = array('ciri'=>Input::get('ciri'));
		$rules = array('ciri'=>'required');
		$v = Validator::make($input,$rules);
		if($v->fails()) return Redirect::back()->withError($v)->withInput();
	    
		$ciri = new Ciri;
		$ciri->trait = Input::get('ciri');
		$ciri->save();

		Session::flash('success','Trait berhasil ditambah');
		return Redirect::to('traits');
	}
	function edit($id)
	{
		//Pastiin id berupa angka
		$id = (int)$id;
		if($id<1):
			Session::flash('error','Invalid Argument');
			return Redirect::back();
		endif;

		$ciri = Ciri::findOrFail($id);

		$data = array('id'=>$id,'ciri'=>$ciri);
		//tampilkan viewnya
		return View::make('edittrait',$data);
	}
	function update()
	{
		//Pastiin id berupa angka
		$id = (int)Input::get('id');
		if($id<1):
			Session::flash('error','Invalid Argument');
			return Redirect::back();
		endif;

		//Terima inputnya, rules, terus validasi
		$input = array('ciri'=>Input::get('ciri'));
		$rules = array('ciri'=>'required');
		$v = Validator::make($input,$rules);
		if($v->fails()) return Redirect::back()->withError($v)->withInput();

		//Edit Datanya
		$ciri = Ciri::findOrFail($id);
		$ciri->trait = $input['ciri'];
		$ciri->save();

		Session::flash('success','Trait berhasil diedit');
		return Redirect::to('traits');
	}
}