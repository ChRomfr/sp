<!-- START view/joueur/index.tpl -->
{strip}
<ol class="breadcrumb">
    <li><a href="{$Helper->getLink("index")}" title="{$lang.Accueil}"><i class="fa fa-home"></i>&nbsp;{$lang.Accueil}</a></li>
    <li class="active">{$lang.Joueur}</li>
</ol>

<div class="well">
	{if $smarty.session.acl.gest_joueur == true}
	<div class="pull-right">
		<a href="{$Helper->getLink("joueur/add")}" title=""><i class="fa fa-plus"></i></a>
	</div>	
	{/if}
	
	<h1>{$lang.Joueurs}</h1>
	<div class="clearfix"></div>
	
	<table class="table table-bordered table-condensed table-striped">
	    <thead>
	        <tr>
	            <th>#</th>
	            <th>{$lang.Joueur}</th>
	            <th>{$lang.Structure}</th>
	        </tr>
	    </thead>
	    <tbody>
			{foreach $Joueurs as $Row}
			<tr>
				<td>{$Row.id}</td>
				<td><a href="{$Helper->getLink("joueur/fiche/{$Row.id}")}" title="">{$Row.nom} {$Row.prenom}</a></td>
				<td>{$Row.structure}</td>
			</tr>
			{/foreach}
	    </tbody>
	</table>


	<div class="pull-right">
	{* GESTION DES LIENS POUR LE SEXE *}
	{if !isset($smarty.get.sexe)}
		<a href="{getLink("joueur/index?sexe=h")}" title="{$lang.Homme}"><img src="{$config.url}{$config.url_dir}web/images/male-icone.png" alt="" style="width:16px;"/></a>&nbsp;
		<a href="{getLink("joueur/index?sexe=f")}" title="{$lang.Femme}"><img src="{$config.url}{$config.url_dir}web/images/female-icone.png" alt="" style="width:16px;"/></a>
		<img src="{$config.url}{$config.url_dir}web/images/male-female.png" alt="" style="width:24px;"/>
	{elseif isset($smarty.get.sexe) && $smarty.get.sexe == "h"}
		<img src="{$config.url}{$config.url_dir}web/images/male-icone.png" alt="" style="width:24px;"/>&nbsp;
		<a href="{getLink("joueur/index?sexe=f")}" title=""><img src="{$config.url}{$config.url_dir}web/images/female-icone.png" alt="" style="width:16px;"/></a>&nbsp;
		<a href="{getLink("joueur/index")}" title=""><img src="{$config.url}{$config.url_dir}web/images/male-female.png" alt="" style="width:16px;"/></a>
	{elseif isset($smarty.get.sexe) && $smarty.get.sexe == "f"}
		<a href="{getLink("joueur/index?sexe=h")}" title="{$lang.Homme}"><img src="{$config.url}{$config.url_dir}web/images/male-icone.png" alt="" style="width:16px;"/></a>&nbsp;
		<strong><img src="{$config.url}{$config.url_dir}web/images/female-icone.png" alt="" style="width:24px;"/></strong>&nbsp;
		<a href="{getLink("joueur/index")}" title=""><img src="{$config.url}{$config.url_dir}web/images/male-female.png" alt="" style="width:16px;"/></a>
	{/if}

	<!-- option list des equipes -->
	{if count($Equipes) > 1}
		<span>&nbsp;&nbsp;
			<select id="equipe" onchange="reloadPage('equipe');">
				<option></option>
				{foreach $Equipes as $Row}
				<option value="{$Row.id}" {if isset($smarty.get.equipe) && $smarty.get.equipe == $Row.id}selected="selected"{/if}>{$Row.nom}</option>
				{/foreach}
			</select>
		</span>
	{/if}

	{if $config.multi_site == 1}
	<select id="site" onchange="reloadPage('site');">
		<option></option>
		{foreach $Sites as $Row}
		<option value="{$Row.id}" {if isset($smarty.get.site) && $smarty.get.site == $Row.id}selected="selected"{/if}>{$Row.nom}</option>
		{/foreach}
	</select>
	{/if}

	{if $smarty.session.utilisateur.joueur_trombi == 1 && isset($smarty.get.liste)}<a href="{getLink('joueur/index')}" title="" class="submit">{$lang.Trombinoscope}</a>{/if}
	{if $smarty.session.utilisateur.joueur_trombi == 0 && !isset($smarty.get.trombi)}<a href="{getLink('joueur/index?trombi')}" title="" class="submit">{$lang.Trombinoscope}</a>{/if}
	</div>
	<div class="clearfix"></div>

</div><!-- /well -->
{/strip}
<script>
	function reloadPage(filtre){
		var url = '{getLink("joueur/index?liste")}';
		{if isset($smarty.get.sexe)} url = url + '&sexe={$smarty.get.sexe}';{/if}
		{if isset($smarty.get.equipe)}
			if( filtre != 'equipe' ){
				url = url + '&equipe={$smarty.get.equipe}';
			}
		{/if}
		{if isset($smarty.get.site)} 
			if( filtre != 'site' ){
				url = url + '&equipe={$smarty.get.site}';
			}
		{/if}
		
		if( filtre == 'site' ){
			if( $("#site").val() != '' ){
				url = url + '&site='+ $("#site").val() ;
			}
		}
		
		if( filtre == 'equipe' ){
			if( $("#equipe").val() != '' ){
				url = url + '&equipe='+ $("#equipe").val() ;
			}
		}
		
		window.location.href = url;
	}
</script>
<!-- END view/joueur/index.tpl -->