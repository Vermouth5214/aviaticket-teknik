<?php

namespace App\Http\Middleware;

use Cache;
use Closure;
use Session;
use App\Model\User;

class TokenReportMiddleware
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
			//SUPER ADMIN SLS DSD
        	if (($userinfo['priv'] != 'VSUPER') && ($userinfo['priv'] != 'SLS') && ($userinfo['priv'] != 'DSD')) {
                return redirect('/');
            }
        }
        return $next($request);
    }
}