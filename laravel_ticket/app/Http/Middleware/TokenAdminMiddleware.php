<?php

namespace App\Http\Middleware;

use Cache;
use Closure;
use Session;

class TokenAdminMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if(!Session::get('userinfo')) {
            return redirect('/backend/login');
        } else{
            $userinfo = Session::get('userinfo');
            //Jika bukan admin
        	if (($userinfo['priv'] != 'VSUPER') && ($userinfo['priv'] != 'VADM')){
                return redirect('/backend/ticket');
            }

        }
        return $next($request);
    }
}