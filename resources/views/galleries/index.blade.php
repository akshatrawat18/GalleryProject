@extends('layouts.app')

@section('content')
    <div class="jumbotron text-center">
        <h1 class="my-4 text-center text-lg-left">Galleries</h1>
    </div>
    @if (count($galleries) > 0)
        <div class="row text-center text-lg-left imageDiv">
            @foreach($galleries as $gallery)
                <div class="col-lg-3 col-md-4 col-xs-6">
                    <a href="/gallery/{{$gallery->id}}" class="d-block mb-4 h-100">
                        <img class="img-fluid img-thumbnail" src="storage/gallery_images/{{$gallery->cover_image}}" alt="Image Not Found">
                    </a>
                    <br/>
                    <p><a href="/gallery/{{$gallery->id}}">{{$gallery->name}}</a></p>
                </div>
            @endforeach
        </div>
        {{$galleries->links()}}
    @else
        <h3>No Galleries To Show</h3>
    @endif
@endsection