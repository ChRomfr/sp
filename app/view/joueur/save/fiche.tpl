<script type="text/javascript">
<!--
$(document).ready(function() {
    $("a#fbformaddparent").fancybox();
    $("a.fbformeditparent").fancybox();
});

$(function() {
	$( "#tabs" ).tabs({
		ajaxOptions: {
			error: function( xhr, status, index, anchor ) {
				$( anchor.hash ).html(
					"Couldn't load this tab. We'll try to fix this as soon as possible. " +
					"If this wouldn't be a demo." );
			}
		}
	});
});

function showTab(tab_id){
	var $tabs = $('#tabs').tabs();
    $(function(){
        $tabs.tabs('select',tab_id);
        return false;
    })
}

{* Code JS Suppression parent *}

{if $smarty.session.acl.gest_joueur == 1}
function deleteParent(pid){
    if( confirm('{$lang.Confirm_suppression_parent} ?') ){
        window.location.href = '{getLink("paren/delete/' + pid +'")}';   
    }
}
{/if}

{if $smarty.session.acl.gest_joueur == 1}
function deleteJoueur( joueur_id ){
	if( confirm('{$lang.Confirm_suppression_joueur} ?') ){
		window.location.href = '{getLink("joueur/delete/'+ joueur_id +'")}';
	}
}
{/if}
//-->
</script>

{if $smarty.const.BREAD == true}
<div id="bread">
    <a href="{getLink("index/index")}" title="">{$lang.Accueil}</a>&nbsp;>>&nbsp;
    <a href="{getLink("joueur/index")}" title="">{$lang.Joueur}</a>&nbsp;>>&nbsp;
    {$Joueur.nom} {$Joueur.prenom}
</div>
{/if}

<div style="float:right;">
	{if $smarty.session.acl.gest_joueur == true}
	<a href="{getLink("joueur/edit/{$Joueur.id}")}" title=""><img src="{$config.url}{$config.url_dir}web/images/edit.png" alt="" /></a>
	<a href="javascript:deleteJoueur({$Joueur.id})" title=""><img src="{$config.url}{$config.url_dir}web/images/delete.png" alt="" /></a>
	{/if}
</div>
<div style="clear:both;"></div>

<br/>

<div id="fiche_detail" class="showData">
	<h1>{$Joueur.prenom} {$Joueur.nom}</h1>
	
    {if !empty($Joueur.photo_id)}
        <div class="fleft" style="width:50%">
            <div class="center"><img src="{$config.url}{$config.url_dir}web/upload/joueurs/{$Joueur.id}/photo_id/{$Joueur.photo_id}" style="width:150px;" /></div>
        </div>
        <div class="fright" style="width:50%">
    {/if}

	<table class="tadmin" style="width:100%;">
		{if $config.multi_site == 1}
		<tr>
			<td>{$lang.Site} :</td>
			<td>{$Site.nom}</td>
		</tr>
		{/if}
		<tr>
			<td>{$lang.Nom} :</td>
			<td>{$Joueur.nom}</td>
		</tr>
		<tr>
			<td>{$lang.Prenom} :</td>
			<td>{$Joueur.prenom}</td>
		</tr>
		<tr>
			<td>{$lang.Date_de_naissance} :</td>
			<td>{$Joueur.date_naissance|date_format:$config.format_date_day}</td>
		</tr>
		<tr>
			<td>{$lang.Lieu_de_naissance} :</td>
			<td>{$Joueur.lieu_naissance}</td>
		</tr>
		<tr>
			<td>{$lang.Adresse}</td>
			<td>{$Joueur.adresse}<br/>{$Joueur.code_postal} {$Joueur.ville}</td>
		</tr>
		<tr>
			<td>{$lang.Contact}</td>
			<td>
				<ul>
					{if $Joueur.telephone != ''}<li>{$Joueur.telephone}</li>{/if}
					{if $Joueur.portable != ''}<li>{$Joueur.portable}</li>{/if}
					{if $Joueur.email != ''}<li><a href="mailto:{$Joueur.email}">{$Joueur.email}</a></li>{/if}
				</ul>
			</td>
		</tr>
		{if $config.sport_champ_structure == 1}
		<tr>
			<td>{$lang.Structure} :</td>
			<td><a href="javascript:showTab(1)" title="">{$Structure.nom}</a></td>
		</tr>
		{/if}
		
		{if $Joueur.taille != ''}
		<tr>
			<td>{$lang.Taille} :</td>
			<td>{$Joueur.taille} cm</td>
		</tr>
		{/if}
		
		{if $Joueur.poids != ''}
		<tr>
			<td>{$lang.Poids} :</td>
			<td>{$Joueur.poids} kg</td>
		</tr>
		{/if}
		
		<tr>
			<td>{$lang.Date_entree} :</td>
			<td>{$Joueur.date_entree|date_format:$config.format_date_day}</td>
		</tr>
		{if $Joueur.date_sortie > 0}
		<tr>
			<td>{$lang.Date_de_sortie} :</td>
			<td>{$Joueur.date_sortie|date_format:$config.format_date_day}</td>
		</tr>
		{/if}
	</table>


{if !empty($Joueur.photo_id)}
    </div>
    <div class="clear"></div>
{else}
    </div>
{/if}

<div>&nbsp;</div>
<div id="tabs">
	<ul>
		<li><a href="#tabs-1">{$lang.Env_familiale}</a></li>
		<li><a href="{getLink("joueur/getStructureInfo/{$Joueur.id}?nohtml")}">{$lang.Structure}/{$lang.Equipe}</a></li>

		<!-- SCOLAIRE -->
		{if $config.joueur_suivi_scolaire == 1 && $InfosInstall.i_type == 'full'}
		<li><a href="{getLink("joueur/getEtabInfo/{$Joueur.id}?nohtml")}">{$lang.Scolaire}</a></li>
		{/if}

		<!-- MORPHOLOGIE -->
		<li><a href="{getLink("joueur/getPhysiqueInfo/{$Joueur.id}?nohtml")}">{$lang.Morphologie}</a></li>

		<!-- ENTRAINEMENTS -->
		{if $InfosInstall.i_type == 'full'}
			{if $config.entrainement_type == 1}
			<li><a href="{getLink("joueur/getEntrainementInfo/{$Joueur.id}?nohtml&type=2")}">{$lang.Entrainement_physique}</a></li>
          	<li><a href="{getLink("joueur/getEntrainementInfo/{$Joueur.id}?nohtml&type=1")}">{$lang.Entrainement_tech_tact}</a></li>
			{else}
			<li><a href="{getLink("joueur/getEntrainementInfo/{$Joueur.id}?nohtml")}">{$lang.Entrainements}</a></li>
			{/if}
		{elseif $InfosInstall.i_type == 'full'}
			<li><a href="{getLink("joueur/getEntrainementInfo/{$Joueur.id}?nohtml")}">{$lang.Entrainements}</a></li>
		{/if}

		{if $InfosInstall.i_type == 'full'}
          	{if $smarty.session.acl.view_suivimed == 1}<li><a href="{getLink("joueur/getSuiviMedical/{$Joueur.id}?nohtml")}">{$lang.Suivi_medical}</a></li>{/if}
         	<li><a href="{getLink("joueur/getMuscuInfo/{$Joueur.id}?nohtml")}">{$lang.Musculation}</a></li>
    	{/if}

			<li><a href="{getLink("joueur/getTestInfo/{$Joueur.id}?nohtml")}">{$lang.Tests_physique}</a></li>

        	{if $InfosInstall.i_type == 'full'}
          	<li>Dietetique</li>
          	<li><a href="{getLink("joueur/getTabRessentie/{$Joueur.id}?nohtml")}">{$lang.Ressentie}</a></li>
        	{/if}

        	<li><a href="{getLink("joueur/getDocuments/{$Joueur.id}?nohtml")}">{$lang.Documents}</a></li>		
        	{foreach $config.modules as $module}
        		{if $module.m_view_in_fiche == 1}
        		<li><a href="{getLink("{$module.m_module}/tabFiche?nohtml&joueur_id={$Joueur.id}")}" title="">{$module.m_name}</a></li>
        		{/if}
        	{/foreach}

			<li><a href="{getLink("joueur/getChampPlus/{$Joueur.id}?nohtml")}">+</a></li>
	</ul>
	
	<div id="tabs-1">
		
		<!-- IMPRESSION -->
		<div class="fright">
			<a href="{getLink("joueur/printTabSituationFamiliale/{$Joueur.id}?nohtml&print")}" title="Print" target="_blank"><img src="{$config.url}{$config.url_dir}web/images/Print.png" alt="" /></a>
		</div>
		<div class="clear"></div>
		
		<div class="showData">
				
			<!-- Action haut droite -->
			<div style="float:right">				
				{if count($Parents) < 2 && $smarty.session.acl.gest_joueur == 1}
                    <a href="{getLink("paren/add?joueur_id={$Joueur.id}&nohtml")}" id="fbformaddparent" title=""><img src="{$config.url}{$config.url_dir}web/images/add.png" /></a>
				{/if}
			</div>
			<div style="clear:both"></div>
			<!-- End Action -->
			
	        <div style="width:95%; margin:auto;">
				<p>{$lang.Situation} : <strong>{$Joueur.parent_situation}</strong></p>
			</div>
			
			{if isset($Parents.0)}
			
			<table class="tadmin">
				<caption>{$lang.Parents}</caption>
				<tr>
					<th></th>
					<td>
	                    {if $Parents.0.type == "p"}{$lang.Pere}{elseif $Parents.0.type == "m"}{$lang.Mere}{/if}
	                    {if $smarty.session.acl.gest_joueur == true}
                            <a href="{getLink("paren/edit/{$Parents.0.id}?nohtml")}" class="fbformeditparent" title=""><img src="{$config.url}{$config.url_dir}web/images/edit.png" alt="" style="width:10px;" /></a>
                            <a href="javascript:deleteParent({$Parents.0.id})"><img src="{$config.url}{$config.url_dir}web/images/delete.png" alt="" style="width:10px;" /></a>
                        {/if}
	                </td>
					{if isset($Parents.1)}
	                <td>
	                    {if $Parents.1.type == "p"}{$lang.Pere}{elseif $Parents.1.type == "m"}{$lang.Mere}{/if}
	                    {if $smarty.session.acl.gest_joueur == true}
                            <a href="{getLink("paren/edit/{$Parents.1.id}?nohtml")}" class="fbformeditparent" title=""><img src="{$config.url}{$config.url_dir}web/images/edit.png" alt="" style="width:10px;" /></a>
                            <a href="javascript:deleteParent({$Parents.1.id})"><img src="{$config.url}{$config.url_dir}web/images/delete.png" alt="" style="width:10px;" /></a>
                        {/if}
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
			{/if}
		</div>
	</div>
</div>

{* Script JS pour le chagement du bon tableau a l appel de la page *}
{if isset($smarty.get.tab) && $smarty.get.tab == 'physique' }
<script>
    var $tabs = $('#tabs').tabs();
    $(function(){
        $tabs.tabs('select',3);
        return false;
    })
</script>
{/if}

{if isset($smarty.get.tab) && $smarty.get.tab == 'structure' }
<script>
    var $tabs = $('#tabs').tabs();
    $(function(){
        $tabs.tabs('select',1);
        return false;
    })
</script>
{/if}

{if isset($smarty.get.tab) && $smarty.get.tab == 'scolaire' }
<script>
    var $tabs = $('#tabs').tabs();
    $(function(){
        $tabs.tabs('select',2);
        return false;
    })
</script>
{/if}

{if isset($smarty.get.tab) && $smarty.get.tab == 'entrainement' }
<script>
    var $tabs = $('#tabs').tabs();
    $(function(){
        $tabs.tabs('select',4);
        return false;
    })
</script>
{/if}

{if isset($smarty.get.tab) && $smarty.get.tab == 'suivimedical' }
<script>
    var $tabs = $('#tabs').tabs();
    $(function(){
        $tabs.tabs('select',6);
        return false;
    })
</script>
{/if}

{if isset($smarty.get.tab) && $smarty.get.tab == 'musculation' }
<script>
    var $tabs = $('#tabs').tabs();
    $(function(){
        $tabs.tabs('select',6);
        return false;
    })
</script>
{/if}