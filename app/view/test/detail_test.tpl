<!-- test/detail_test.tpl -->
{strip}
{if $smarty.const.BREAD == true && !isset($smarty.get.nohtml)}
<ul class="breadcrumb">
<li><a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a><span class="divider">/</span></li>
<li><a href="{getLink("test/index")}" title="{$lang.Test}">{$lang.Test}</a><span class="divider">/</span></li>
<li>{$lang.Detail}</li>
</ul>
{/if}

<div class="well">
	
	<div class="pull-right">
		{if $smarty.session.acl.gest_entrainement == 1}
		<a href="javascript:getFormAddUser();">
			<img src="{$config.url}{$config.url_dir}web/images/user_add.png" style="width:16px;"/></a>&nbsp;&nbsp;
		{/if}
		{if $config.show_graph_detail_test == 1}
		<a href="javascript:showid('graph_conteneur');" title=""><img src="{$config.url}{$config.url_dir}web/images/graph.png" style="height:16px;" /></a>&nbsp;&nbsp;
		{/if}
	</div>
	
	<h4>{$lang.Test_du} {$Test.date_test|date_format:$config.format_date_day}</h4>
	<div class="clearfix"></div>
	{$Tableau}
	
	
	<div class="pull-right">
		{* GESTION DES LIENS POUR LE SEXE *}
		{if !isset($smarty.get.sexe)}
			<a href="{getLink("test/detailTest/{$Test.id}?sexe=h")}" title="">{$lang.Homme}</a>&nbsp;
			<a href="{getLink("test/detailTest/{$Test.id}?sexe=f")}" title="">{$lang.Femme}</a>
		{elseif isset($smarty.get.sexe) && $smarty.get.sexe == "h"}
			<strong>{$lang.Homme}</strong>&nbsp;
			<a href="{getLink("test/detailTest/{$Test.id}?sexe=f")}" title="">{$lang.Femme}</a>&nbsp;
			<a href="{getLink("test/detailTest/{$Test.id}")}" title="">{$lang.Tous}</a>
		{elseif isset($smarty.get.sexe) && $smarty.get.sexe == "f"}
			<a href="{getLink("test/detailTest/{$Test.id}?sexe=h")}" title="">{$lang.Homme}</a>&nbsp;
			<strong>{$lang.Femme}</strong>&nbsp;
			<a href="{getLink("test/detailTest/{$Test.id}")}" title="">{$lang.Tous}</a>
		{/if}
	</div>
	<div class="clearfix"></div>
	
	{if $config.show_graph_detail_test == 1}
	<div id="graph_conteneur" style="display:none;">
		<img src="{$config.url}{$config.url_dir}index.php/test/graphResultTest?test={$Test.id}" alt="" />
	</div>
	{/if}
</div>

<!-- Modal pour formulaire -->
<div id="modal-test" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h4 id="myModalLabel"></h4>
	</div>
	<div class="modal-body" id="modal-test-contenu">		
	</div>
	<div class="modal-footer">
	<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
	</div>
</div>

<div id="diag-more-data"></div>
{/strip}
{literal}
<script>
	$(document).ready(function(){ 
        $("#tableau_test").tablesorter(); 
    }); 
	{/literal}
	
	function getDataByExoAndPlayer(exo_id, joueur_id){
		$('#modal-test-contenu').html("");
		$.get(
			'{getLink("test/getAllResultByExoAndJoueur")}',{literal}
			{exercice_id:exo_id, joueur_id:joueur_id, nohtml:'nohtml'},
			function(data){ $('#modal-test-contenu').html(data); }
		)
		{/literal}
    
		$( "#modal-test" ).modal('show');
	}
	
	function deleteUserTest(joueur_id, test_id){
		if( confirm('{$lang.Confirm_suppression_joueur} ?') ){
			window.location.href = '{getLink("test/removeUserFormTest?joueur_id='+ joueur_id +'&test_id='+ test_id +'")}';
		}
	}
	
	function getFormAddUser(){
		$('#modal-test-contenu').html("");
		$.get(
			'{getLink("test/addJoueurInTest/{$Test.id}")}',{literal}
			{nohtml:'nohtml'},
			function(data){ $('#modal-test-contenu').html(data); }
		)
		{/literal}
    
		$( "#modal-test" ).modal('show');
	}
	
</script>