@extends('layouts.app')

@section('content')
    <div class="well">
        <div class="row">
            <div class="col-md-8">
                <img src="/storage/gallery_photos/{{$photo->image}}" style="width:100%;">
            </div>
            <div class="col-md-4">
                <h3><strong>Description:</strong></h3>
                @if ($photo->description != '')
                    <p>{!!$photo->description!!}</p>
                @else
                    <p class="text-center">No description</p>
                @endif
                <h3><strong>Gallery:</strong></h3>
                <p><a href="/gallery/{{$photo->gallery->id}}">{{$photo->gallery->name}}</a></p>
                <p><small>Created at {{$photo->created_at}} by {{$photo->gallery->user->name}}</small></p>
                @if (!Auth::guest())
                    @if (Auth::user()->id == $photo->gallery->user->id)
                        <a href="/photo/{{$photo->id}}/edit" class="btn btn-default btn-md">Edit</a>
                        {!!Form::open(['action' => ['PhotosController@destroy', $photo->id], 'method' => 'POST', 'class' => 'pull-right'])!!}
                            {{Form::hidden('_method', 'DELETE')}}
                            {{Form::submit('Delete', ['class' => 'btn btn-danger btn-md'])}}
                        {!!Form::close()!!}
                    @endif
                @endif
            </div>
        </div>
    </div>
@endsection
