<?php
class SupportController extends BaseController
{
	public function index()
	{
		return View::make('supportform');
	}

	public function store()
	{
		//get the post data
		$data = Input::all();

		//send email to tickets@rijalulfikri.uservoice.com
		Mail::queue('supportemail', $data ,function($message)
		{
			$message->to('tickets@rijalulfikri.uservoice.com')->subject('Support Request');
		});

		return Redirect::route('home');
	}
}