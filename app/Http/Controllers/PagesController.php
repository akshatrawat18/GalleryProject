<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Gallery;

class PagesController extends Controller
{
    public function index() {
        $galleries = Gallery::orderBy('created_at', 'desc')->paginate(12);
        return view('pages.index')->with('galleries', $galleries);
    }

    public function about() {
        return view('pages.about');
    }
}
