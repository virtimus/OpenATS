<?php

require_once('./lib/php-gettext/gettext.inc');

$supported_locales = array('en_US','pl_PL');

function lngReset($locale){
	$encoding = HTML_ENCODING;
	// gettext setup
	_setlocale(LC_MESSAGES, $locale);
	// Set the text domain as 'messages'
	$domain = 'messages';
	_bindtextdomain($domain, LOCALE_DIR);
	_bind_textdomain_codeset($domain, $encoding);
	_textdomain($domain);
}

$locale = DEFAULT_LOCALE;
lngReset($locale);

function lngTranslateStr($str){
	return __($str);
}

function lngTranslateAsoc1($array,$key){
	foreach($array as $k=>$v){
		$array[$k][$key]=lngTranslateStr($array[$k][$key]);
	}
	return $array;
}
?>