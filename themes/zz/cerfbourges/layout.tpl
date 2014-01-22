<!DOCTYPE html>
<head>
	<title>{$config.structure_name} {if isset($ctitre)} - {$ctitre}{/if}</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" href="{$config.url}{$config.url_dir}themes/default/design.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="{$config.url}{$config.url_dir}themes/{$config.theme}/style.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="{$config.url}{$config.url_dir}themes/default/print_generique_style.css" type="text/css" media="print" />
	{if !empty($css_add)}
		{foreach $css_add as $k => $v}
		<link rel="stylesheet" href="{$config.url}{$config.url_dir}web/css/{$v}" type="text/css" media="screen" />
		{/foreach}
	{/if}
	<link rel="stylesheet" href="{$config.url}{$config.url_dir}web/css/mbmenu/menu_theme_large.css" type="text/css" media="screen" />
	<script type="text/javascript" src="{$config.url}{$config.url_dir}web/js/javascript.js"></script>    
	{if !empty($js_add)}
		{foreach $js_add as $k => $v}
		<script type="text/javascript" src="{$config.url}{$config.url_dir}web/js/{$v}"></script>
		{/foreach}
	{/if}
	<script type="text/javascript" src="{$config.url}{$config.url_dir}web/js/jquery.qtip-1.0.0-rc3.min.js"></script>
    <script type="text/javascript" src="{$config.url}{$config.url_dir}web/js/bulle.js"></script>
    <script type="text/javascript" src="{$config.url}{$config.url_dir}web/js/mbmenu/jquery.metadata.js"></script>
    <script type="text/javascript" src="{$config.url}{$config.url_dir}web/js/mbmenu/mbMenu.js"></script>
    <script type="text/javascript" src="{$config.url}{$config.url_dir}web/js/mbmenu/jquery.hoverIntent.js"></script>
	{if isset($header_code) && !empty($header_code)}{$header_code}{/if}
   	
    {literal}
    <script type="text/javascript">    
    $(function(){
    $(".vertMenu").buildMenu(
    	    {
    	      template:"menuVoices.html",
    	      menuWidth:170,
    	      openOnRight:true,
    	      menuSelector: ".menuContainer",
    	      iconPath:{/literal}"{$config.url}{$config.url_dir}web/images/ico/",{literal}
    	      hasImages:true,
    	      fadeInTime:200,
    	      fadeOutTime:200,
    	      adjustLeft:0,
    	      adjustTop:0,
    	      opacity:.95,
    	      openOnClick:false,
    	      minZindex:200,
    	      shadow:false,
    	      hoverIntent:300,
    	      submenuHoverIntent:300,
    	      closeOnMouseOut:true
    	    });    
    });
    </script>
    {/literal}
</head>
<body>
	<div id="contenu">
		<div id="header_nav"></div>
		<div id="header">
			<div class="fleft" id="header_left"></div>
			<div class="fleft" id="header_center"></div>
			<div class="fright" id="header_right">
			</div>
			<div class="clear"></div>
		</div>
		
		<div id="blockGauche">
			{$blokGauche}
		</div>
		<div id="blockCentre">
			<div class="">{$content}</div>
		</div>
		<div class="clear"></div>
	</div>
	<div class="clear"></div>
</body>
</html>