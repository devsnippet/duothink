<?php

function mp(){
    $mp_session = session('admin');
    if(!$mp_session){
        return null;
    }
    return $mp_session;
}