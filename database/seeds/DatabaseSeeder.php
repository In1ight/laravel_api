<?php

use Illuminate\Database\Seeder;

use App\Post;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call(PostSeeder::class);
    }
}

class PostSeeder extends Seeder
{
    public function run()
    {
        DB::table('posts')->delete();
        Post::create([
            'title' => 'ЗаголовокСидер',
            'description' => 'ОписаниеСидер',
            'created_at' => DB::raw('CURRENT_TIMESTAMP'),
            'updated_at' => DB::raw('now()')
        ]);

        Post::create([
            'title' => 'ЗаголовокСидер1',
            'description' => 'ОписаниеСидер1',
            'created_at' => DB::raw('CURRENT_TIMESTAMP'),
            'updated_at' => DB::raw('now()')
        ]);
        Post::create([
            'title' => 'ЗаголовокСидер2',
            'description' => 'ОписаниеСидер2',
            'created_at' => DB::raw('CURRENT_TIMESTAMP'),
            'updated_at' => DB::raw('now()')
        ]);
    }
}
