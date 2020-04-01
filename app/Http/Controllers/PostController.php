<?php

namespace App\Http\Controllers;

use App\{User, Post, Comments};
use Illuminate\Http\Request;


class PostController extends Controller
{


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        return response()->json(
            Post::all(), 201
        );
    }

    public function postUpdate(Request $request, Post $posts)
    {
        $posts->update($request->all());
        return response()->json($posts, 200);
    }
    public function setComment(Request $request) {
        $comment = Comments::forceCreate([
            'author' => $request->author,
            'comment' => $request->comment,
            'post_id' => $request->id

     ]);
        if ($comment) {
            return response()->json([
                'status code' => 201,
                'status text' => 'Successful creation',
                'body' => [
                    'status' => true,
                    'post_id' => '',
                ]
            ], 201);
        } else {
            return response()->json([
                'status code' => 400,
                'status text' => 'Creation error',
                'body' => [
                    'status' => false,
                    'message' => '',
                ]
            ], 400);
        }
}
    public function getPosts() {
        return response()->json(Post::all(), 201);
    }
    public function getPost(Request $request){
        if(Post::find($request->id)){
            return response()->json(Post::find($request->id), 201);
        }else{
            return response()->json([
                'status code' => 400,
                'status text' => 'Not found',
                'body' => [
                    'status' => false,
                    'message' => '',
                ]
            ], 400);
        }

    }



    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {

        $post = Post::forceCreate([
            'title' => $request->title,
            'description' => $request->description,
        ]);

        if ($post) {
            return response()->json([
                'status code' => 201,
                'status text' => 'Successful creation',
                'body' => [
                    'status' => true,
                    'post_id' => '',
                ]
            ], 201);
        } else {
            return response()->json([
                'status code' => 400,
                'status text' => 'Creation error',
                'body' => [
                    'status' => false,
                    'message' => '',
                ]
            ], 400);
        }


    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function show(Post $post)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function edit(Post $post)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Post $post)
    {
        // обновление

        $post = Post::find($request->id);

            // если пост не найден
            if (!$post) {
                return response()->json([
                    'status code' => 404,
                    'status text' => 'Post not found',
                    'body' => [
                        'message' => 'Post not found'
                    ]
                ], 201);
            }

            // тут остальные поля допиши (для примера одно оставил)
            $post->title = $request->title;

            // если обнвляем пост
            if ($post->save()) {
                return response()->json([
                    'status code' => 201,
                    'status text' => 'Successful creation',
                    'body' => [
                        'status' => true,
                        // массив данных поста
                        'post' => Post::find($request->id),
                    ]
                ], 201);
            } else {
                // ошибка обновления поста
                return response()->json([
                    'status code' => 400,
                    'status text' => 'Editing error',
                    'body' => [
                        'status' => false,
                        // массив с ошибками - нужен валидатор
                        'message' => '',
                    ]
                ], 400);
            }

    }

    // удаление
    public function delete(Request $request)
    {

        $post = Post::find($request->id);

        // если пост не найден
        if (!$post) {
            return response()->json([
                'status code' => 404,
                'status text' => 'Post not found',
                'body' => [
                    'message' => 'Post not found',
                ]
            ], 401);
        }

        if ($post->delete()) {

            return response()->json([
                'status code' => 201,
                'status text' => 'Successful delete',
                'body' => [
                    'status' => true
                ]
            ], 201);

        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function destroy(Post $post)
    {
        //
    }
}
