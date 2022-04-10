@extends('layouts.app')

@section('content')
    <h1>Add Image</h1>
    {!!Form::open(['action' => ['PhotosController@update', $photo->id], 'method' => 'POST', 'enctype' => 'multipart/form-data'])!!}
        <div class="form-group">
            {{Form::label('description', 'Image Description')}}
            {{Form::textarea('description', $photo->description, ['class' => 'form-control', 'placeholder' => 'Image Description', 'id' => 'article-ckeditor'])}}
        </div>
        <div class="form-group">
            {{Form::label('image', 'Image')}}
            {{Form::file('image')}}
        </div>
        <div class="form-group">
            {{Form::label('gallery_name', 'Gallery')}}
            {{Form::select('gallery_name', $galleries, $galleries[0], ['class' => 'form-control'])}}
        </div>
        {{Form::hidden('_method', 'PUT')}}
        {{Form::submit('Edit', ['class' => 'btn btn-success btn-lg'])}}
    {!!Form::close()!!}
@endsection