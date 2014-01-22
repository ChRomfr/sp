<script>
<!--
$(function() {
    $( "#dialog_add_trimestre" ).dialog({ autoOpen: false, width:800 });
	$('#trimestre_contener').html('<div class="sep"></div><img src="{$config.url}{$config.url_dir}web/images/lightbox-ico-loading.gif" />');
	$('#bfs_contener').html('<div class="sep"></div><img src="{$config.url}{$config.url_dir}web/images/ajax-loader.gif" />'); 
});

function openDiag(diag){
    $( "#dialog_add_trimestre" ).dialog('open');
}

function getFormTrimestre(joueur_id){
    $('#loading').html('<div class="sep"></div><img src="{$config.url}{$config.url_dir}web/images/ajax-loader.gif" />');
    
    $.get(
        '{getLink("trimestre/add")}',{literal}
        {joueur_id:joueur_id, nohtml:'nohtml'},
        function(data){ $('#dialog_add_trimestre').html(data); }
    )
    {/literal}
    $('#loading').html('');
    $('#loading').css('display','none');
    $( "#dialog_add_trimestre" ).dialog('open');
}

function getFormSuivi(trimestre_id){
    $('#dialog_add_trimestre').html('<div class="sep"></div><img src="{$config.url}{$config.url_dir}web/images/ajax-loader.gif" />');
    
    $.get(
        '{getLink("bulletin/suiviAdd/'+trimestre_id+'")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#dialog_add_trimestre').html(data); }
    )
    {/literal}
    $( "#dialog_add_trimestre" ).dialog('open');
}

function showSuiviScolaire(suivi_id){
    $('#dialog_add_trimestre').html('<div class="sep"></div><img src="{$config.url}{$config.url_dir}web/images/ajax-loader.gif" />');
    
    $.get(
        '{getLink("bulletin/suiviDetail/'+suivi_id+'")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#dialog_add_trimestre').html(data); }
    )
    {/literal}
    $( "#dialog_add_trimestre" ).dialog('open');
}

function getBulletin(tid){
    $.get(
        '{getLink("bulletin/detail")}',{literal}
        {tid:tid, nohtml:'nohtml'},
        function(data){ $('#dialog_add_trimestre').html(data); }
    )
    {/literal}
    $('#loading').html('');
    $('#loading').css('display','none');
    $( "#dialog_add_trimestre" ).dialog('open');
}

function getFormAddFormation(sportif_id){
	$( "#dialog_add_trimestre" ).dialog('open');
	$('#dialog_add_trimestre').html('<div class="sep"></div><img src="{$config.url}{$config.url_dir}web/images/ajax-loader.gif" />');
    
    $.get(
        '{getLink("bulletin/formationAdd/'+sportif_id+'")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#dialog_add_trimestre').html(data); }
    )
    {/literal}    
}

function getFormEditFormation(formation_id){
	$( "#dialog_add_trimestre" ).dialog('open');
	$('#dialog_add_trimestre').html('<div class="sep"></div><img src="{$config.url}{$config.url_dir}web/images/ajax-loader.gif" />');
    
    $.get(
        '{getLink("bulletin/formationEdit/'+formation_id+'")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#dialog_add_trimestre').html(data); }
    )
    {/literal}    
}

function getDetailFormation(formation_id){
	$( "#dialog_add_trimestre" ).dialog('open');
	$('#dialog_add_trimestre').html('<div class="sep"></div><img src="{$config.url}{$config.url_dir}web/images/ajax-loader.gif" />');
    
    $.get(
        '{getLink("bulletin/formationDetail/'+formation_id+'")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#dialog_add_trimestre').html(data); }
    )
    {/literal}    
}

function deleteFormation(formation_id){
	if( confirm('{$lang.Confirm_suppression_formation} ?') ){
		window.location.href = '{getLink("bulletin/formationDelete/'+ formation_id +'")}';
	}	
}

function getFormAddBoc(sportif_id){
	$( "#dialog_add_trimestre" ).dialog('open');
	$('#dialog_add_trimestre').html('<div class="sep"></div><img src="{$config.url}{$config.url_dir}web/images/ajax-loader.gif" />');
    
    $.get(
        '{getLink("scolaire/bocGetFormAdd/'+sportif_id+'")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#dialog_add_trimestre').html(data); }
    )
    {/literal}    
}

function getFormEditBoc(boc_id){
	$( "#dialog_add_trimestre" ).dialog('open');
	$('#dialog_add_trimestre').html('<div class="sep"></div><img src="{$config.url}{$config.url_dir}web/images/ajax-loader.gif" />');
    
    $.get(
        '{getLink("scolaire/bocGetFormEdit/'+boc_id+'")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#dialog_add_trimestre').html(data); }
    )
    {/literal}    
}

function getBocData(sportif_id){
	
	$('#boc_contener').html('<div class="sep"></div><img src="{$config.url}{$config.url_dir}web/images/ajax-loader.gif" />');
    
    $.get(
        '{getLink("scolaire/bocGetForFiche/'+sportif_id+'")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#boc_contener').html(data); }
    )
    {/literal}    
}

function deleteBoc(boc_id){
	if( confirm('{$lang.Confirm_suppression_boc} ?') ){
		window.location.href = '{getLink("scolaire/bocDelete/'+ boc_id +'")}';
	}	
}

function getFormAddDpp(sportif_id){
	$( "#dialog_add_trimestre" ).dialog('open');
	$('#dialog_add_trimestre').html('<div class="sep"></div><img src="{$config.url}{$config.url_dir}web/images/ajax-loader.gif" />');
    
    $.get(
        '{getLink("scolaire/dppGetFormAdd/'+sportif_id+'")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#dialog_add_trimestre').html(data); }
    )
    {/literal}    
}

function getDppData(sportif_id){
	
	$('#dpp_contener').html('<div class="sep"></div><img src="{$config.url}{$config.url_dir}web/images/ajax-loader.gif" />');
    
    $.get(
        '{getLink("scolaire/dppGetForFiche/'+sportif_id+'")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#dpp_contener').html(data); }
    )
    {/literal}    
}

function getFormEditDpp(dpp_id){
	$( "#dialog_add_trimestre" ).dialog('open');
	$('#dialog_add_trimestre').html('<div class="sep"></div><img src="{$config.url}{$config.url_dir}web/images/ajax-loader.gif" />');
    
    $.get(
        '{getLink("scolaire/dppGetFormEdit/'+dpp_id+'")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#dialog_add_trimestre').html(data); }
    )
    {/literal}    
}

function deleteDpp(dpp_id){
	if( confirm('{$lang.Confirm_suppression_dpp} ?') ){
		window.location.href = '{getLink("scolaire/dppDelete/'+ dpp_id +'")}';
	}	
}

//
//BFS SCRIPT
//

function getFormAddBfs(sportif_id){
	$( "#dialog_add_trimestre" ).dialog('open');
	$('#dialog_add_trimestre').html('<div class="sep"></div><img src="{$config.url}{$config.url_dir}web/images/ajax-loader.gif" />');
    
    $.get(
        '{getLink("scolaire/bfsGetFormAdd/'+sportif_id+'")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#dialog_add_trimestre').html(data); }
    )
    {/literal}    
}

function getFormEditBfs(bfs_id){
	$( "#dialog_add_trimestre" ).dialog('open');
	$('#dialog_add_trimestre').html('<div class="sep"></div><img src="{$config.url}{$config.url_dir}web/images/ajax-loader.gif" />');
    
    $.get(
        '{getLink("scolaire/bfsGetFormEdit/'+bfs_id+'")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#dialog_add_trimestre').html(data); }
    )
    {/literal}    
}

function deleteBfs(bfs_id){
	if( confirm('{$lang.Confirm_suppression_bfs} ?') ){
		window.location.href = '{getLink("scolaire/bfsDelete/'+ bfs_id +'")}';
	}	
}

function getBfsData(sportif_id){	
	   
    $.get(
        '{getLink("scolaire/bfsGetForFiche/'+sportif_id+'")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#bfs_contener').html(data); }
    )
    {/literal}    
}

function getTrimestreData(sportif_id){    
    $.get(
        '{getLink("scolaire/trimestreGetForFiche/'+sportif_id+'")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#trimestre_contener').html(data); }
    )
    {/literal}
}

//-->
</script>
{strip}
<!-- LIEN IMPRESSION -->
{if !isset($smarty.get.printer)}
<div class="fright">
	<a href="{getLink("joueur/getEtabInfo/{$Joueur->id}?printer&sportifinfo&sportif_id={$Joueur->id}")}" title="Print" target="_blank"><img src="{$config.url}{$config.url_dir}web/images/Print.png" alt="Print" /></a>
</div>
<div class="clear"></div>
{/if}
	
{if !empty($Joueur->diplome_prepare) || !empty($Joueur->classe) || !empty($Etab.nom)}
<div class="well">
	<table class="table table-bordered table-condensed table-striped">
		<tbody>
			<tr>
				<th>{$lang.Diplome_prepare}</th>
				<td>{$Joueur->diplome_prepare}</td>
			</tr>
			<tr>
				<th>{$lang.Classe}</th>
				<td>{$Joueur->classe}</td>
			</tr>
			<tr><td colspan="2" class="center"><strong>{$lang.Etablissement}<strong></td></tr>
			<tr>
				<th>{$lang.Etablissement}</td>
				<td>{$Etab.nom}</td>
			</tr>
			<tr>
				<th>{$lang.Adresse}</th>
				<td>{$Etab.adresse}<br/>{$Etab.code_postal} {$Etab.ville}</td>
			</tr>
			{if $Etab.telephone != ''}
			<tr>
				<th>{$lang.Telephone}</th>
				<td>{$Etab.telephone}</td>
			</tr>
			{/if}
		</tbody>
	</table>
</div>
{/if}

<!-- Affichage du bloc formation -->
<div class="well">

	<div class="fright">
		{if $smarty.session.acl.gest_joueur == true}
		{if !isset($smarty.get.printer)}<a href="javascript:getFormAddFormation({$Joueur->id})" title=""><img src="{$config.url}{$config.url_dir}web/images/add.png" alt="" /></a>{/if}
		{/if}
	</div>
	
	<div class="clear"></div>

	{if count($Formations) > 0}
	<table class="table table-bordered table-condensed table-striped">
		<caption><h4>{$lang.Formation}</h4></caption>
		<thead>
			<tr>
				<th>{$lang.Formation}</th>
				<th>{$lang.Debut}</th>
				<th>{$lang.Fin}</th>
				<th>{$lang.Statut}</th>
				{if !isset($smarty.get.printer)}<th></th>{/if}
			</tr>
		</thead>
		<tbody>
		{foreach $Formations as $Row}
			<tr>
				<td><a href="javascript:getDetailFormation({$Row.id})" alt="">{$Row.nom}</a></td>
				<td>{$Row.timestamp_debut|date_format:$config.format_date_day}</td>
				<td>{$Row.timestamp_fin|date_format:$config.format_date_day}</td>
				<td>
					{if $Row.resultat == 0}{$lang.En_cour}{/if}
					{if $Row.resultat == 1}{$lang.Reussie}{/if}
					{if $Row.resultat == 2}{$lang.Echec}{/if}	
				</td>
				{if !isset($smarty.get.printer)}
				<td class="center">
					<a href="{getLink("scolaire/printFormationDetail/{$Row.id}?nohtml&print")}" title="Print" target="_blank"><img src="{$config.url}{$config.url_dir}web/images/print.png" style="width:16px;" /></a>&nbsp;&nbsp;
					{if $smarty.session.acl.gest_joueur == 1}
						<a href="javascript:getFormEditFormation({$Row.id})" alt=""><img src="{$config.url}{$config.url_dir}web/images/edit.png" alt="" /></a>&nbsp;&nbsp;
						<a href="javascript:deleteFormation({$Row.id})" alt=""><img src="{$config.url}{$config.url_dir}web/images/delete.png" alt="" /></a>
					{/if}
				</td>
				{/if}
		{/foreach}
		</tbody>
	</table>
	{/if}
</div>

<!-- BOC -->
<div class="well">
	<div class="fright">
		{if !isset($smarty.get.printer)}
			{if $smarty.session.acl.gest_joueur == 1}
				<a href="javascript:getFormAddBoc({$Joueur->id})" title=""><img src="{$config.url}{$config.url_dir}web/images/add.png" alt="" /></a>
			{/if}	
		{/if}
	</div>
	<div class="clear"></div>
	<div id="boc_contener"></div>
</div>

<!-- DPP -->
<div class="well">
	<div class="fright">
		{if !isset($smarty.get.printer)}
			{if $smarty.session.acl.gest_joueur == 1}
				<a href="javascript:getFormAddDpp({$Joueur->id})" title=""><img src="{$config.url}{$config.url_dir}web/images/add.png" alt="" /></a>
			{/if}
		{/if}
	</div>
	<div class="clear"></div>
	<div id="dpp_contener"></div>
</div>

<!-- BFS -->
<div class="well">
	<div class="fright">
		{if !isset($smarty.get.printer)}
			{if $smarty.session.acl.gest_joueur == 1}
				<a href="javascript:getFormAddBfs({$Joueur->id})" title=""><img src="{$config.url}{$config.url_dir}web/images/add.png" alt="" /></a>
			{/if}
		{/if}
	</div>
	
	<div class="clear"></div>
	<div id="bfs_contener"></div>
</div>

<!-- Trimestre -->
<div class="well">
	
	{if !isset($smarty.get.printer)}
		{if $smarty.session.acl.gest_joueur == true}
			<div class="fright"><a href="javascript:getFormTrimestre({$Joueur->id})" title="Nouveau bulletin"><img src="{$config.url}{$config.url_dir}web/images/add.png" alt="" /></a></div>
		{/if}
	{/if}
	
	<h4>{$lang.Suivi}</h4>
	<div style="clear:both"></div>
	
	{if $Etab.url_portail_note != '' && $Joueur->suivi_scolaire_identifiant != '' && $Joueur->suivi_scolaire_password != ''}
	<div>
		<a href="{$Etab.url_portail_note}" title="" target="_blank">{$lang.Suivi_des_notes}</a>
		<ul>
			<li>{$lang.Identifiant} : <strong>{$Joueur->suivi_scolaire_identifiant}</strong></li>
			<li>{$lang.Password} : <strong>{$Joueur->suivi_scolaire_password}</strong></li>
		</ul>
	</div>
	<div class="sep"></div>
	{/if}
	
	<!-- Affichage des trimestres -->
	<div id="trimestre_contener"></div>

</div>

<!-- Joueur meme etablissement -->
{if $config.view_joueur_etab == true && !empty($Etab.nom)}
<div class="well">
	<table class="table table-bordered table-condensed table-striped">
		<caption><h4>{$lang.Joueurs_dans_le_meme_etablissement}</h4></caption>
		<thead>
			<th>#</th>
			<th>{$lang.Nom}</th>
			<th>{$lang.Prenom}</th>
		</thead>
		<tbody>
			{foreach $Joueurs as $Row}
			<tr>
				<td>{if $smarty.session.acl.view_all_fiche == true}<a href="{getLink("joueur/fiche/{$Row.id}")}">{/if}{$Row.id}{if $smarty.session.acl.view_all_fiche == true}</a>{/if}</td>
				<td>{$Row.nom}</td>
				<td>{$Row.prenom}</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
</div>
{/if}

<div id="loading"></div>
<div id="dialog_add_trimestre"></div>{/strip}
<script type="text/javascript">
<!--
	getBocData({$Joueur->id});
	getDppData({$Joueur->id});
	getBfsData({$Joueur->id});
	getTrimestreData({$Joueur->id});
//-->
</script>