<?php
class MahasiswaControllerTest extends TestCase
{
	public function TearDown()
	{
		Mockery::close();
	}
	
	public function test_display_register_proposal_form()
	{
		$this->call('GET','proposal/index');
		$this->assertResponseOk();
	}

	public function test_nim_not_empty()
	{
		//given
		//$nim = Input::get('nim');
		$input = Input::all();

		$this->assertContain($input['nim'],$input);
	}

	public function test_submit_form()
	{
		//$this->call('POST','support/store',['name'=>'John','body'=>'lorem']);
		$postData = [
            'email' => 'joe@example.com',
            'body'  => 'Lorem ipsum'
        ];

        

        Mail::shouldReceive('queue')->once()
            ->with('supportemail', $postData, Mockery::on(function($closure) {
                $message = Mockery::mock('Illuminate\Mailer\Message');

                $message->shouldReceive('to')
                    ->with('tickets@rijalulfikri.uservoice.com') // or store this in a config file
                    ->once()
                    ->andReturn(Mockery::self());

                $message->shouldReceive('subject')
                    ->with('Support Request')
                    ->once();

                $closure($message);

                return true;
            }));


        $this->call('POST', 'support/store', $postData);

        $this->assertRedirectedToRoute('home');
	}
}