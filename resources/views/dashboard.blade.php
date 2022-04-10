@extends('layouts.app')

@section('content')
    <div class="panel panel-default">
        <div class="panel-heading">
            <h1 class="my-4 text-center text-lg-left panel-title">Galleries</h1>
        </div>
        <div class="panel-body">
            @if (count($galleries) > 0)
                <div class="row text-center text-lg-left imageDiv">
                    @foreach($galleries as $gallery)
                        <div class="col-lg-3 col-md-4 col-xs-6">
                            <a href="/gallery/{{$gallery->id}}" class="d-block mb-4 h-100">
                                <img class="img-fluid img-thumbnail" src="storage/gallery_images/{{$gallery->cover_image}}" alt="Image Not Found" style="width:100%;">
                            </a>
                            <p><a href="/gallery/{{$gallery->id}}">{{$gallery->name}}</a></p>
                        </div>
                    @endforeach
                </div>
                {{$galleries->links()}}
            @else
                <h3 class="text-center">No Galleries To Show</h3>
            @endif
        </div>
    </div>
@endsection
