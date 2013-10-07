<?php

Route::get('/', function(){	return View::make('home'); });
Route::get('heroes', 'HeroController@getIndex');
Route::post('hero/store', 'HeroController@postStore');
Route::get('traits', function()
{
	return View::make('traits');
});
Route::post('hero/store', function()
{
	
});
Route::get('hero/choose', 'HeroController@choose');