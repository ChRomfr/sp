<!DOCTYPE html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" href="{$config.url}{$config.url_dir}themes/default/design.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="{$config.url}{$config.url_dir}themes/default/print.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="{$config.url}{$config.url_dir}themes/default/design.css" type="text/css" media="print" />
	<link rel="stylesheet" href="{$config.url}{$config.url_dir}themes/default/print.css" type="text/css" media="print" />
	{if !empty($js_add)}
		{foreach $js_add as $k => $v}
		<script type="text/javascript" src="{$config.url}{$config.url_dir}web/js/{$v}"></script>
		{/foreach}
	{/if}
</head>
<body>
	
<script>
function getEnTete(sportif_id){
    $.get(
        '{getLink("joueur/ajaxGetEnTetePourImpression/'+ sportif_id +'")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#enTete').html(data); }
    )
    {/literal}
}	
{if isset($smarty.get.sportifinfo) && isset($smarty.get.sportif_id)}
getEnTete({$smarty.get.sportif_id});
{/if}
</script>
<!-- CONTENER SPORTIF INFOS -->
<div id="enTete"></div>

<!-- CONTENER DE LA PAGE -->
<div id="contener_data">{$content}</div>
	
</body>
</html>
