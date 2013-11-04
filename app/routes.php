<?php

Route::get('/', array('as'=>'home','uses'=>'HomeController@showWelcome'));

Route::get('heroes', array('as'=>'heroeslist','uses'=>'HeroController@getIndex'));
Route::get('hero/choose', array('as'=>'choosehero','uses'=>'HeroController@getChoose'));
Route::post('hero/choose', array('as'=>'chooseheroprocess','uses'=>'HeroController@postChoose'));
Route::post('hero/store', array('as'=>'posthero','uses'=>'HeroController@postStore'));
Route::get('hero/{id}', array('as'=>'herodetail','uses'=>'HeroController@getHeroDetail'));
Route::get('hero/{id}/edit', array('as'=>'edithero','uses'=>'HeroController@getEditForm'));
Route::post('hero/{id}/update', array('as'=>'updatehero','uses'=>'HeroController@postUpdate'));
Route::get('hero/{id}/trait', array('as'=>'managetrait','uses'=>'HeroController@getTraitForm'));
Route::post('hero/{id}/trait', array('as'=>'saveherotrait','uses'=>'HeroController@postTrait'));
Route::get('kesimpulan', array('as'=>'kesimpulan','uses'=>'HeroController@getKesimpulan'));

Route::get('traits', array('as'=>'traitslist','uses'=>'TraitController@getIndex'));
Route::post('trait/store', array('as'=>'posttrait','uses'=>'TraitController@postStore'));
Route::get('trait/{id}/edit', array('as'=>'edittrait','uses'=>'TraitController@edit'));
Route::put('trait/update', array('as'=>'updatetrait','uses'=>'TraitController@update'));
Route::get('trait/{id}/delete', array('as'=>'deletetrait','uses'=>'TraitController@delete'));

//Route::get('support/create', array('as'=>'createsupport','uses'=>'SupportController@index'));
//Route::post('support/store', array('as'=>'storesupport','uses'=>'SupportController@store'));