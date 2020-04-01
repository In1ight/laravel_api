<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use App\User;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public $loginAfterSignUp = true;

    public function register(Request $request) {
       $user = User::create([
         'name' => $request->login,
         'password' => bcrypt($request->password),
       ]);

        $token = Str::random(80);
      $user = User::forceCreate([
            'login' => $request->login,
            'password' => Hash::make($request->password),
            'api_token' => $token,
        ]);


        return $this->respondWithToken($token, $request->login);
    }

    public function login(Request $request){
      $credentials = $request->only(['login', 'password']);

      if (!$token = auth()->attempt($credentials)) {
        return response()->json([
            'status code' => 401,
            'status text' => 'Invalid authorization data',
            'body' => [
                'status' => false,
                'message' => 'Invalid authorization data',
            ]
        ], 401);
      }

        return $this->respondWithToken($token, $credentials['login']);
    }

    public function getAuthUser(Request $request) {
        return response()->json(auth()->user());
    }

    public function logout() {
        auth()->logout();
        return response()->json(['message'=>'Successfully logged out']);
    }

    protected function respondWithToken($token, $c)
    {
        $user = User::where('login', $c)->first();
      return response()->json([
        'status code' => 200,
        'status text' => 'Successful authorization',
        'body' => [
            'status' => true,
            'token' => $user->api_token,
        ]
      ]);
    }

}
