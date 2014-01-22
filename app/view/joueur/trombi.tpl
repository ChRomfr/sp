<!-- START view/joueur/tombi.tpl -->
{strip}
<ol class="breadcrumb">
    <li><a href="{$Helper->getLink("index")}" title="{$lang.Accueil}">{$lang.Accueil}</a></li>
    <li class="active">{$lang.Joueur}</li>
</ol>

<div class="well">

	{if $smarty.session.utilisateur.isAdmin > 0 || $smarty.session.acl.gest_joueur == true}
	<div class="pull-right">
		<a href="{$Helper->getLink("joueur/add")}" title=""><i class="fa fa-plus fa-lg"></i></a>
	</div>	
	{/if}
	
	<h3>{$lang.Joueurs}</h3>
	<div class="clearfix"></div>
	
	<table class="table">
		<tbody>
			<tr>
				{foreach $Joueurs as $Joueur name=foo}
				<td class="text-center">
					<a href="{$Helper->getLink("joueur/fiche/{$Joueur.id}")}" title="">
					{if isset($Joueur.photo_id)}
						<img src="{$config.url}web/upload/joueurs/{$Joueur.id}/photo_id/{$Joueur.photo_id}" style="width:100px;" /><br/>{$Joueur.nom} {$Joueur.prenom}
					{else}
						<img src="{$config.url}web/images/avatar/no_image.jpg" style="width:100px;" /><br/>{$Joueur.nom} {$Joueur.prenom}
					{/if}
					</a>
				</td>
				{if $smarty.foreach.foo.iteration % 5 == 0}</tr><tr>{/if}
				{/foreach}
			</tr>
		</tbody>
	</table>
	
	<div class="pull-right">
{* GESTION DES LIENS POUR LE SEXE *}
{if !isset($smarty.get.sexe)}
	<a href="{getLink("joueur/index?sexe=h&trombi")}" title="{$lang.Homme}"><img src="{$config.url}{$config.url_dir}web/images/male-icone.png" alt="" style="width:16px;"/></a>&nbsp;
	<a href="{getLink("joueur/index?sexe=f&trombi")}" title="{$lang.Femme}"><img src="{$config.url}{$config.url_dir}web/images/female-icone.png" alt="" style="width:16px;"/></a>
	<img src="{$config.url}{$config.url_dir}web/images/male-female.png" alt="" style="width:24px;"/>
{elseif isset($smarty.get.sexe) && $smarty.get.sexe == "h"}
	<img src="{$config.url}{$config.url_dir}web/images/male-icone.png" alt="" style="width:24px;"/>&nbsp;
	<a href="{getLink("joueur/index?sexe=f&trombi")}" title=""><img src="{$config.url}{$config.url_dir}web/images/female-icone.png" alt="" style="width:16px;"/></a>&nbsp;
	<a href="{getLink("joueur/index?trombi")}" title=""><img src="{$config.url}{$config.url_dir}web/images/male-female.png" alt="" style="width:16px;"/></a>
{elseif isset($smarty.get.sexe) && $smarty.get.sexe == "f"}
	<a href="{getLink("joueur/index?sexe=h&trombi")}" title="{$lang.Homme}"><img src="{$config.url}{$config.url_dir}web/images/male-icone.png" alt="" style="width:16px;"/></a>&nbsp;
	<strong><img src="{$config.url}{$config.url_dir}web/images/female-icone.png" alt="" style="width:24px;"/></strong>&nbsp;
	<a href="{getLink("joueur/index?trombi")}" title=""><img src="{$config.url}{$config.url_dir}web/images/male-female.png" alt="" style="width:16px;"/></a>
{/if}

<!-- option list des equipes -->
{if count($Equipes) > 1}
	<span>&nbsp;&nbsp;
		<select id="equipe" onchange="reloadPage('equipe');">
			<option></option>
			{foreach $Equipes as $Row}
			<option value="{$Row.id}" {if isset($smarty.get.equipe) && $smarty.get.equipe == $Row.id}selected="selected"{/if}>{$Row.nom} {if $config.sport_champ_structure == 1} - {$Row.structure}{/if}</option>
			{/foreach}
		</select>
	</span>
{/if}

{if $config.multi_site == 1}
<select id="site" onchange="reloadPage();">
	<option></option>
	{foreach $Sites as $Row}
	<option value="{$Row.id}" {if isset($smarty.get.site) && $smarty.get.site == $Row.id}selected="selected"{/if}>{$Row.nom}</option>
	{/foreach}
</select>
{/if}

{if $smarty.session.utilisateur.joueur_trombi == 1 && !isset($smarty.get.liste)}<a href="{getLink('joueur/index?liste')}" title="" class="submit"><i class="icon-list"></i></a>{/if}
{if $smarty.session.utilisateur.joueur_trombi == 0 && isset($smarty.get.trombi)}<a href="{getLink('joueur/index')}" title="" class="submit"><i class="icon-list"></i></a>{/if}
</div>
<div class="clearfix"></div>
</div>
{/strip}
<script type="text/javascript">
function reloadPage(filtre){
	var url = '{getLink("joueur/index?")}';
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
<!-- END view/joueur/tombi.tpl -->