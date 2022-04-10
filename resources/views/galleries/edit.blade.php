@extends('layouts.app')

@section('content')
    <h1>Edit Gallery</h1>
    {!!Form::open(['action' => ['GalleriesController@update', $gallery->id], 'method' => 'POST', 'enctype' => 'multipart/form-data'])!!}
        <div class="form-group">
            {{Form::label('name', 'Gallery Name')}}
            {{Form::text('name', $gallery->name, ['class' => 'form-control', 'placeholder' => 'Gallery Name'])}}
        </div>
        <div class="form-group">
            {{Form::label('description', 'Description')}}
            {{Form::textarea('description', $gallery->description, ['class' => 'form-control', 'placeholder' => 'Gallery Description', 'id' => 'article-ckeditor'])}}
        </div>
        <div class="form-group">
            {{Form::label('cover_image', 'Cover Image')}}
            {{Form::file('cover_image')}}
        </div>
        {{Form::hidden('_method', 'PUT')}}
        {{Form::submit('Done', ['class' => 'btn btn-success btn-lg'])}}
    {!!Form::close()!!}
@endsection