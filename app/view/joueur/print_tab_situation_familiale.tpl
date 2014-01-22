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
function getEnTete(){
    $.get(
        '{getLink("joueur/ajaxGetEnTetePourImpression/{$Joueur_id}")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#enTete').html(data); }
    )
    {/literal}
}	
</script>
	
	<div id="enTete">
	
	</div>
	<table class="tadmin">
		<caption>{$lang.Parents}</caption>
		<tr>
			<th></th>
			<td>
				{if $Parents.0.type == "p"}{$lang.Pere}{elseif $Parents.0.type == "m"}{$lang.Mere}{/if}
			</td>
			{if isset($Parents.1)}
			<td>
				{if $Parents.1.type == "p"}{$lang.Pere}{elseif $Parents.1.type == "m"}{$lang.Mere}{/if}
				{if $smarty.session.acl.gest_joueur == true}<a href="javascript:showFormParentEdit({$Parents.1.id})"><img src="{$config.url}{$config.url_dir}web/images/edit.png" alt="" style="width:10px;" /></a><a href="javascript:deleteParent({$Parents.1.id})"><img src="{$config.url}{$config.url_dir}web/images/delete.png" alt="" style="width:10px;" /></a>{/if}
			</td>
			{/if}
		</tr>
		<tr>
			<th>{$lang.Nom}</th>
			<td>{$Parents.0.nom}</td>
			{if isset($Parents.1)}<td>{$Parents.1.nom}</td>{/if}
		</tr>
		<tr>
			<th>{$lang.Prenom}</th>
			<td>{$Parents.0.prenom}</td>
			{if isset($Parents.1)}<td>{$Parents.1.prenom}</td>{/if}
		</tr>
		<tr>
			<th>{$lang.Adresse}</th>
			<td>{$Parents.0.adresse}<br/>{$Parents.0.code_postal} {$Parents.0.ville}</td>
			{if isset($Parents.1)}<td>{$Parents.1.adresse}<br/>{$Parents.1.code_postal} {$Parents.1.ville}</td>{/if}
		</tr>
		<tr>
			<th>{$lang.Telephone}</th>
			<td>{$Parents.0.telephone}</td>
			{if isset($Parents.1)}<td>{$Parents.1.telephone}</td>{/if}
		</tr>
		<tr>
			<th>{$lang.Portable}</th>
			<td>{$Parents.0.portable}</td>
			{if isset($Parents.1)}<td>{$Parents.1.portable}</td>{/if}
		</tr>
		<tr>
			<th>{$lang.Profession}</th>
			<td>{$Parents.0.emploi}</td>
			{if isset($Parents.1)}<td>{$Parents.1.emploi}</td>{/if}
		</tr>
		<tr>
			<th>{$lang.Telephone} pro</th>
			<td>{$Parents.0.telephone_pro}</td>
			{if isset($Parents.1)}<td>{$Parents.1.telephone_pro}</td>{/if}
		</tr>
	</table>
<script>
getEnTete();
</script>	
</body>
</html>
