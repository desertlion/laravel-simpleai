<?php
class SupportControllerTest extends TestCase
{
	public function TearDown()
	{
		Mockery::close();
	}
	public function test_it_works()
	{
		$this->assertTrue(true);
	}

	public function test_display_form_to_submit_support_request()
	{
		$this->call('GET','support/create');
		$this->assertResponseOk();
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