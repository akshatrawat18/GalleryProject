@extends('layouts.app')

@section('content')
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h1 class="panel-title">{{$gallery->name}}</h1>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-4">
                    <img src="/storage/gallery_images/{{$gallery->cover_image}}" style="width:100%;" alt="Image Not Found">
                </div>
                <div class="col-md-8">
                    @if ($gallery->description == '')
                        <p><strong>No description</strong></p>
                    @else
                        <p>{!!$gallery->description!!}</p>
                    @endif
                </div>
            </div>
        </div>
        <div class="panel-footer">
            <p><small>Created at {{$gallery->created_at}} by {{$user}}</small></p>
            @if (!Auth::guest())
                @if (Auth::user()->id == $gallery->user_id)
                    <a href="/gallery/{{$gallery->id}}/edit" class="btn btn-default btn-md">Edit</a>
                    {!!Form::open(['action' => ['GalleriesController@destroy', $gallery->id], 'method' => 'POST', 'class' => 'pull-right'])!!}
                        {{Form::hidden('_method', 'DELETE')}}
                        {{Form::submit('Delete', ['class' => 'btn btn-danger btn-md'])}}
                    {!!Form::close()!!}
                @endif
            @endif
        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h1 style="text-align:center;" class="panel-title">{{$gallery->name}} Images</h1>
        </div>
        <div class="panel-body">
            @if (count($photos) > 0)
                <div class="row text-center text-lg-left imageDiv">
                    @foreach($photos as $photo)
                        <div class="col-lg-3 col-md-4 col-xs-6">
                            <a href="/photo/{{$photo->id}}" class="d-block mb-4 h-100">
                                <img class="img-fluid img-thumbnail" src="/storage/gallery_photos/{{$photo->image}}" alt="Image Not Found">
                            </a>
                        </div>
                    @endforeach
                </div>
                {{$photos->links()}}
            @else
                <h3>No Images In That Gallery</h3>
            @endif
        </div>
    </div>
@endsection