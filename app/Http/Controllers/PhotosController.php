<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Photo;
use App\Gallery;
use DB;

class PhotosController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth', ['except' => ['show']]);
    }

    public function show($id) {
        try {
            $photo = Photo::find($id);
            return view('photos.show')->with('photo', $photo);
        }
        catch (\Exception $e) {
            return redirect('/gallery')->with('error', 'Invalid URL');
        }
    }

    public function create() {
        $galleries = Gallery::where('user_id', auth()->user()->id)->get(['name'])->pluck('name')->all();
        return view('photos.create')->with('galleries', $galleries);
    }

    public function store(Request $request) {
        $this->validate($request, [
            'description' => 'nullable',
            'image' => 'image|required|max:1999',
            'gallery_name' => 'required'
        ]);
        $photo = new Photo;
        $filenameWithExtension = $request->file('image')->getClientOriginalName();
        $filenameWithoutExtension = pathinfo($filenameWithExtension, PATHINFO_FILENAME);
        $extension = $request->file('image')->getClientOriginalExtension();
        $filenameToStore = $filenameWithoutExtension.'_'.time().'.'.$extension;
        $path = $request->file('image')->storeAs('public/gallery_photos', $filenameToStore);
        if ($request->has('description'))
            $photo->description = $request->input('description');
        else
            $photo->description = '';
        $photo->image = $filenameToStore;
        $selectedGallery = Gallery::where('user_id', auth()->user()->id)->get(['name'])->pluck('name')->all()[intval($request->input('gallery_name'))];
        $photo->gallery_id = intval(Gallery::where('name', $selectedGallery)->where('user_id', auth()->user()->id)->get()[0]['id']);
        $photo->gallery_name = $selectedGallery;
        $photo->save();
        return redirect('/dashboard')->with('success', 'The photo has been saved successfully');
    }

    public function edit($id) {
        try {
            $photo = Photo::find($id);
            if (Gallery::find($photo->gallery_id)->user_id != auth()->user()->id)
                return redirect('/dashboard')->with('error', 'Unauthorized Page');
            else {
                $galleries = Gallery::where('user_id', auth()->user()->id)->get(['name'])->pluck('name')->all();
                return view('photos.edit')->with('photo', $photo)->with('galleries', $galleries);
            }
        }
        catch (\Exception $e) {
            return redirect('/dashboard')->with('error', 'Invalid URL');
        }
    }

    public function update(Request $request, $id) {
        try {
            $photo = Photo::find($id);
            if ($photo->gallery->user->id != auth()->user()->id)
                return redirect('/dashboard')->with('error', 'Unauthorized Page');
            else {
                $this->validate($request, [
                    'description' => 'nullable',
                    'image' => 'image|nullable|max:1999',
                    'gallery_name' => 'required'
                ]);
                if ($request->hasFile('image')) {
                    $filenameWithExtension = $request->file('image')->getClientOriginalName();
                    $filenameWithoutExtension = pathinfo($filenameWithExtension, PATHINFO_FILENAME);
                    $extension = $request->file('image')->getClientOriginalExtension();
                    $filenameToStore = $filenameWithoutExtension.'_'.time().'.'.$extension;
                    Storage::delete('public/gallery_photos/'.$photo->image);
                    $path = $request->file('image')->storeAs('public/gallery_photos', $filenameToStore);
                    $photo->image = $filenameToStore;
                }
                if ($request->has('description'))
                    $photo->description = $request->input('description');
                else
                    $photo->description = '';
                $selectedGallery = Gallery::where('user_id', auth()->user()->id)->get(['name'])->pluck('name')->all()[intval($request->input('gallery_name'))];
                $photo->gallery_id = intval(Gallery::where('name', $selectedGallery)->where('user_id', auth()->user()->id)->get()[0]['id']);
                $photo->gallery_name = $selectedGallery;
                $photo->save();
                return redirect('/dashboard')->with('success', 'The photo has been updated successfully');
            }
        }
        catch (\Exception $e) {
            return redirect('/dashboard')->with('error', 'Invalid URL');
        }
    }

    public function destroy(Request $request, $id) {
        try {
            $photo = Photo::find($id);
            if ($photo->gallery->user->id != auth()->user()->id)
                return redirect('/dashboard')->with('error', 'Unauthorized Page');
            else {
                Storage::delete('public/gallery_photos/'.$photo->image);
                $photo->delete();
                return redirect('/dashboard')->with('success', 'The photo has been deleted successfully');
            }
        }
        catch (\Exception $e) {
            return redirect('/dashboard')->with('error', 'Invalid URL');
        }
    }
}
