<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'PagesController@index');
Route::get('/about', 'PagesController@about');

// Route::resource('gallery', 'GalleriesController');
Route::get('/gallery', 'GalleriesController@index');
Route::get('/gallery/create', 'GalleriesController@create');
Route::post('/gallery', 'GalleriesController@store');
Route::get('/gallery/{gallery}', 'GalleriesController@show');
Route::get('/gallery/{gallery}/edit', 'GalleriesController@edit');
Route::put('/gallery/{gallery}', 'GalleriesController@update');
Route::delete('/gallery/{gallery}', 'GalleriesController@destroy');

// Route::resource('photo', 'PhotosController');
// Route::get('/photo', 'PhotosController@index');
Route::get('/photo/create', 'PhotosController@create');
Route::post('/photo', 'PhotosController@store');
Route::get('/photo/{photo}', 'PhotosController@show');
Route::get('/photo/{photo}/edit', 'PhotosController@edit');
Route::put('/photo/{photo}', 'PhotosController@update');
Route::delete('/photo/{photo}', 'PhotosController@destroy');

Auth::routes();
Route::get('/dashboard', 'DashboardController@index');
