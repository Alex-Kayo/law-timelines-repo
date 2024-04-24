<?php

$lang = array
    (
    'zminame' => Array
        (
        'required' => 'Please enter a media name',
        'default' => 'Please enter a media name',
        'length' => 'Media name must be more than 8 characters'
    ),
    'name' => Array
        (
        'required' => 'Please enter your Name',
        'default' => 'Name is wrong',
        'length' => 'Name must have more than 3 characters'
    ),
    'lname' => Array
        (
        'required' => 'Please enter your Last Name',
        'default' => 'Last Name is wrong',
        'length' => 'Last Name must have more than 3 characters'
    ),
    'text' => Array
        (
        'required' => 'Please enter a message',
        'default' => 'Please enter a message',
        'length' => 'Message text must be at least 25 but not more than 1000 characters'
    ),
    'eventdate' => Array
        (
        'required' => 'Please enter an event date',
        'default' => 'Please enter an event date',
//        'length' => 'Текст повідомлення повинен бути не менше 25, але не більше 1000 символів'
    ),
    'eventname' => Array
        (
        'required' => 'Please select an event',
        'default' => 'Please enter an event name',
        'length' => 'Event name must be 25 - 255 characters'
    ),
    'email' => Array
        (
        'required' => 'Please enter an email address',
        'email' => 'Email format is incorrect',
        'default' => 'Email format is incorrect'
    ),
    'phone' => Array
        (
        'required' => 'Please enter a phone number',
        'default' => 'Please enter a phone number',
        'length' => 'Phone number must be at least 10 but not more than 20 characters'
    ),
    'captcha' => Array
        (
        'required' => 'Enter the verification code',
        'default' => 'Incorrectly typed text',
        'length' => 'The verification code must be 6 characters'
    ),
    'cookie' => 'Anti-flood 30сек',
    'badWords' => 'In the text are forbidden words',
    'sendOk' => 'One-time accreditation request has been sent',
    'sendProblems' => 'There were problems sending the message'
);
