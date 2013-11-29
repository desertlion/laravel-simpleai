<?php
class HeroController extends BaseController
{
	public function getIndex()
	{
		$heroes = Hero::all();
		return View::make('heroes',array('heroes'=>$heroes));
	}

	public function postStore()
	{
		$input = Input::all();
		$rules = array('namahero'=>'required');
		$v = Validator::make($input,$rules);
		if($v->fails()) return Redirect::back()->withError($v)->withInput();
	    $destinationPath = 'img/heroimg';

		if(!is_null(Input::file('heroimg'))):
			$filename = strtolower(str_replace(' ', '', Input::get('namahero')).'.'.Input::file('heroimg')->getClientOriginalExtension()); 
			if(is_file($destinationPath.'/'.$filename)) unlink($destinationPath.'/'.$filename);
			$upload_success = Input::file('heroimg')->move($destinationPath, $filename);
		else:
			$upload_success = false;
		endif;
		$hero = new Hero;
		$hero->hero_name = Input::get('namahero');
		if( $upload_success ) {
			$hero->hero_img = $filename;
		}
		$hero->save();

		Session::flash('success','Hero berhasil ditambah');
		return Redirect::to('heroes');
	}

	public function getHeroDetail($id)
	{
		$id = (int)$id;
		if($id<1) return 'Invalid Argument';

		$hero = Hero::findOrFail($id);
		//dd($hero);
		(count($hero)>0) ? $traits = Hero::findOrFail($id)->traits : $traits = array();
		if(count($hero)<1) return 'No Hero with that ID';
		return View::make('hero-detail',array('hero'=>$hero,'traits'=>$traits));
	}

	public function getTraitForm($id)
	{
		$id = (int)$id;
		if($id<1) return 'Invalid Argument';

		$hero = Hero::findOrFail($id);
		$traits = Ciri::all();
		$ciri = Cirihero::where('hero_id',$id)->lists('ciri_id');
		return View::make('trait-manage',array('hero'=>$hero,'traits'=>$traits,'ciri'=>$ciri));
	}

	public function postTrait($id)
	{
		$id = (int)$id;
		if($id<1) return 'Invalid Argument';

		$input = Input::get('trait');
		foreach($input as $traitid):
			$a = Cirihero::where('hero_id','=',$id)->where('ciri_id','=',$traitid)->get();
			
			if(count($a)<1):
				$cirihero = new Cirihero;
				$cirihero->hero_id = $id;
				$cirihero->ciri_id = $traitid;
				$cirihero->save();
			endif;
			$idtraits[] = $traitid;
		endforeach;
		$affectedRows = Cirihero::where('hero_id', '=', $id)->whereNotIn('ciri_id',$idtraits)->delete();
		
		Session::flash('success','Ciri hero berhasil di update');
		return Redirect::route('heroeslist');
	}

	public function getEditForm($id)
	{
		$id = (int)$id;
		if($id<1) return 'Invalid Argument for ID';
	
		$hero = Hero::findOrFail($id);
		return View::make('hero-editform',array('hero'=>$hero));
	}

	public function postUpdate($id)
	{
		$id = (int)$id;
		if($id<1) return 'Invalid Argument for ID';

		$input = Input::all();
		$rules = array('namahero'=>'required');
		$v = Validator::make($input,$rules);
		if($v->fails()) return Redirect::route('heroeslist')->withError($v);
	    $destinationPath = 'img/heroimg';

		if(!is_null(Input::file('heroimg'))):
			$filename = strtolower(str_replace(' ', '', Input::get('namahero')).'.'.Input::file('heroimg')->getClientOriginalExtension()); 
			if(is_file($destinationPath.'/'.$filename)) unlink($destinationPath.'/'.$filename);
			$upload_success = Input::file('heroimg')->move($destinationPath, $filename);
		else:
			$upload_success = false;
		endif;
		$hero = Hero::findOrFail($id);
		$hero->hero_name = Input::get('namahero');
		if( $upload_success ) {
			$hero->hero_img = $filename;
		}
		$hero->save();

		Session::flash('success','Hero berhasil diedit');
		return Redirect::route('heroeslist');
	}

	public function getChoose()
	{
		/* logic untuk halaman ini */
		/**
		  * listing pertanyaan
		  * pertanyaan ada dua kemungkinan, bisa diambil dari tabel traits
		  * atau dari tabel analisa
		  * ambil dari tabel trait klo data di tabel analisa kosong
		**/

		//ambil pertanyaan
		$jml = count(Analisa::groupBy('hero_id')->get());

		if($jml>0)
		{
			//ambil ciri pertama
			$soal = Analisa::first()->toArray();
			$looping = true;			
			while( $looping )
			{
				//hitung jumlah hero dengan ciri tersebut
				$hero = count(Analisa::where('ciri_id',$soal['ciri_id'])->groupBy('hero_id'));

				if($hero == $jml)
				{
					//hapus ciri tersebut, lanjut ke pertanyaan berikutnya
					//jika ternyata soalnya habis dan jumlah heronya masih sma
					//jangan didelete

					//hitung dulu jumlah hero yang tersisa kalau id ini bakal di delete
					$willBeDeleted = count(Analisa::where('ciri_id',$soal['ciri_id'])->groupBy('hero_id'));

					//klo ternyata yang mau didelete jumlahnya sama dengan $jml
					//berarti itu dah hero-hero terakhir
					//itulah kesimpulannya
					if($willBeDeleted == $jml) return Redirect::route('kesimpulan');
					
					//klo tidak berarti soal bisa dipakai
					Analisa::where('ciri_id',$soal['ciri_id'])->delete();
					$soal = Analisa::first()->toArray();
				}
				else
				{
					$looping = false;
				}
			}
			
			$soal = Ciri::find($soal['ciri_id']);

		}
		elseif($jml==1)
		{
			return Redirect::route('kesimpulan');
		}
		else
		{
			$soal = Ciri::first();
		}
		//echo '<pre>';dd($soal);echo '</pre>';

		return View::make('hero-choose',array('soal'=>$soal));
	}

	public function postChoose()
	{
		/* logic untuk method ini */
		/**
		 * terima input dari halaman soal
		 * ambil id trait yang mau diproses
		 * ambil jawaban dari ciri, ya atau tidak
		 * sebelum di proses cek dulu tabel analisa ada isi atau tidak
		 * kalau tidak ada isi, cari seluruh hero yang memenuhi
		 * ciri, kemudian pindahkan ke tabel analisa
		 * kalau ada, cari seluruh hero di tabel ciri yang tidak memenuhi
		 * ciri, hapus semua hero tersebut
		*/

		$input['ciri'] = Input::get('ciri');
		$input['id'] = Input::get('id');
		$rules = array('ciri'=>'required','id'=>'required');

		$v = Validator::make($input,$rules);
		if($v->fails()) return Redirect::back()->withError()->withInput();
		
		//btw, hitung dulu jumlah data sebelum di proses
		$jmlsebelum = count(Analisa::groupBy('hero_id')->get());

		$ada = (count(Analisa::all())>0) ? true : false;

		if( $ada )
		{
			//ada nih datanya, berarti prosesnya sekarang di tabel analisa
			//klo jawaban iya, buang semua hero yang tidak memiliki ciri ini
			//klo jawaban tidak, buang semua hero yang memiliki ciri ini

			$heroes = Analisa::where('ciri_id',$input['id'])->get()->lists('hero_id');

			if($input['ciri']=='ya')
			{
				//hapus dari tabel analisa selain hero-hero tadi
				$query = Analisa::whereNotIn('hero_id',$heroes)->delete();
			}
			else
			{
				//hapus dari tabel analisa hero-hero tadi, karena dak punya ciri tersebut
				$query = Analisa::whereIn('hero_id',$heroes)->delete();
			}
			//btw, hapus juga yang pertanyaan tadi
			Analisa::where('ciri_id',$input['id'])->delete();
		}
		else
		{
			//cari seluruh hero yang memenuhi syarat
			if($input['ciri']=='ya')
			{
				$heroes = Cirihero::where('ciri_id',$input['id'])->get()->lists('hero_id');
			}
			else
			{
				$heroes = Cirihero::where('ciri_id',$input['id'])->get()->lists('hero_id');
				$heroes = Cirihero::whereNotIn('hero_id',$heroes)->groupBy('hero_id')->get()->lists('hero_id');
			}
			
			//$queries = DB::getQueryLog();
			//$last_query = end($queries);
			
			//echo '<pre>';dd($heroes);echo '</pre>';
			//ambil seluruh data hero-hero tersebut, pindahkan ke table analisa
			$heroes = Cirihero::whereIn('hero_id',$heroes)->whereNotIn('ciri_id',array($input['id']))->get();
			//echo '<pre>';dd($heroes);echo '</pre>';
			//nah, hero-hero itu pindahkan ke table analisa
			foreach($heroes as $hero):
				$query = new Analisa;
				$query->hero_id = $hero->hero_id;
				$query->ciri_id = $hero->ciri_id;
				$query->save();
			endforeach;
		}
		
		//setelah terjadi penghapusan / penginputan, hitung jumlah baris yang tersisa
		//digrup berdasar hero, klo bersisa 1 trait, maka itu hero yang dicari
		$jmlsesudah = count(Analisa::groupBy('hero_id')->get());
		//klo jumlah sebelum dan sesudah sama, tampilkan hero itu, klo beda, lanjut lagi ke pertanyaan
		if($jmlsebelum==$jmlsesudah)
		{

			return Redirect::route('kesimpulan');
		}
		else
		{
			return Redirect::route('choosehero');
		}
	}

	public function getKesimpulan()
	{
		$analisa = Analisa::groupBy('hero_id')->get()->lists('hero_id');
		$heroes = Hero::whereIn('id',$analisa)->get();

		Analisa::truncate();

		return View::make('heroes-conclusion',array('heroes'=>$heroes));
	}
}