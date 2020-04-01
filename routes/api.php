<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

//Route::post('reg', 'RegisterController');
//Route::get('auth', 'LoginController');
//Route::post('logout', 'LogoutController')->middleware('auth:api');

//Route::group(['middleware' => 'cors', function() {


Route::middleware(['cors'])->group(function () {
    // добавлегте
    /*Route::post('/posts', 'PostController@create');
    Route::post('/posts/{id}', 'PostController@update');

    Route::delete('/posts/{id}', 'PostController@delete');*/


    /*Route::get('logout', 'AuthController@logout');
    Route::get('user', 'AuthController@getAuthUser');*/

    Route::post('reg', 'AuthController@register');
    Route::post('auth', 'AuthController@login');
    Route::get('/posts/{id}', 'PostController@getPost');
    Route::post('/posts/{id}/comments', 'PostController@setComment');
    Route::get('/posts', 'PostController@getPosts');
    Route::put('/posts/{posts}', 'PostController@postUpdate');
    //Route::get('/auth', 'LoginController');
});

//}]);

// Route::group(['namespace' => 'Api'], function () {
//     Route::group(['namespace' => 'Auth'], function () {
//         Route::post('register', 'RegisterController');
//         Route::post('login', 'LoginController');
//         Route::post('logout', 'LogoutController')->middleware('auth:api');
//     });
// });
