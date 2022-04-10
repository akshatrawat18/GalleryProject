<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Gallery;
use App\Photo;
use App\User;

class GalleriesController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth', ['except' => ['index', 'show']]);
    }

    public function index() {
        $galleries = Gallery::orderBy('created_at', 'desc')->paginate(12);
        return view('galleries.index')->with('galleries', $galleries);
    }

    public function show($id) {
            $gallery = Gallery::find($id);
            return view('galleries.show')->with('gallery', $gallery)
                ->with('photos', Photo::where('gallery_id', $gallery->id)->paginate(12))
                ->with('user', User::find($gallery->user_id)->name);
    }

    public function create() {
        return view('galleries.create');
    }

    public function store(Request $request) {
        $this->validate($request, [
            'name' => 'required',
            'description' => 'nullable',
            'cover_image' => 'image|required|max:1999'
        ]);
        // Handling Storage
        $filenameWithExtension = $request->file('cover_image')->getClientOriginalName();
        $filenameWithoutExtension = pathinfo($filenameWithExtension, PATHINFO_FILENAME);
        $extension = $request->file('cover_image')->getClientOriginalExtension();
        $filenameToStore = $filenameWithoutExtension.'_'.time().'.'.$extension;
        $path = $request->file('cover_image')->storeAs('public/gallery_images', $filenameToStore);
        $gallery = new Gallery;
        $gallery->name = $request->input('name');
        if ($request->has('description'))
            $gallery->description = $request->input('description');
        else
            $gallery->description = '';
        $gallery->cover_image = $filenameToStore;
        $gallery->user_id = auth()->user()->id;
        $gallery->save();
        return redirect('/dashboard')->with('success', 'The gallery has been created successfully');
    }

    public function edit($id) {
        try {
            $gallery = Gallery::find($id);
            if ($gallery->user_id == auth()->user()->id)
                return view('galleries.edit')->with('gallery', $gallery);
            else
                return redirect('/dashboard')->with('error', 'Unauthorized Page');
        }
        catch (\Exception $e) {
            return redirect('/dashboard')->with('error', 'Invalid URL');
        }
    }

    public function update(Request $request, $id) {
        try {
            $gallery = Gallery::find($id);
            if ($gallery->user_id == auth()->user()->id) {
                $this->validate($request, [
                    'name' => 'required',
                    'description' => 'nullable',
                    'cover_image' => 'image|nullable|max:1999'
                ]);
                // Handling Storage
                if ($request->hasFile('cover_image')) {
                    $filenameWithExtension = $request->file('cover_image')->getClientOriginalName();
                    $filenameWithoutExtension = pathinfo($filenameWithExtension, PATHINFO_FILENAME);
                    $extension = $request->file('cover_image')->getClientOriginalExtension();
                    $filenameToStore = $filenameWithoutExtension.'_'.time().'.'.$extension;
                }
                else {
                    $filenameToStore = $gallery->cover_image;
                }
                if ($filenameToStore != $gallery->cover_image) {
                    Storage::delete('public/gallery_images/'.$gallery->cover_image);
                    $path = $request->file('cover_image')->storeAs('public/gallery_images', $filenameToStore);
                    $gallery->cover_image = $filenameToStore;
                }
                $gallery->name = $request->input('name');
                if ($request->has('description'))
                    $gallery->description = $request->input('description');
                else
                    $gallery->description = '';
                $gallery->save();
                return redirect('/dashboard')->with('success', 'The gallery has been updated successfully');
            } else {
                return redirect('/dashboard')->with('error', 'Unauthorized Page');
            }
        }
        catch (\Exception $e) {
            return redirect('/dashboard')->with('error', 'Invalid URL');
        }
    }

    public function destroy(Request $requset, $id) {
        try {
            $gallery = Gallery::find($id);
            if ($gallery->user_id == auth()->user()->id) {
                Storage::delete('public/gallery_images/'.$gallery->cover_image);
                foreach($gallery->photos as $photo) {
                    Storage::delete('public/gallery_photos/'.$photo->image);
                    $photo->delete();
                }
                $gallery->delete();
                return redirect('/dashboard')->with('success', 'The gallery has been deleted successfully');
            } else {
                return redirect('/dashboard')->with('error', 'Unauthorized Page');
            }
        }
        catch (\Exception $e) {
            return redirect('/dashboard')->with('error', 'Invalid URL');
        }
    }
}
