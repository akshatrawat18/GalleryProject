<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Gallery;

class DashboardController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $galleries = Gallery::where('user_id', auth()->user()->id)->paginate(12);
        return view('dashboard')->with('galleries', $galleries);
    }
}
