<?php

class Captcha_Controller extends Controller {

    function index() {
        Captcha::factory('vr')->render(false);
    }

    function vr() {
        self::index();
    }

}