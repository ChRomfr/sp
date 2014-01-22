<!-- START view/joueur/fiche.tpl -->
{strip}
<ol class="breadcrumb">
    <li><a href="{$Helper->getLink("index")}" title="{$lang.Accueil}">{$lang.Accueil}</a></li>
    <li><a href="{$Helper->getLink("joueur")}" title="{$lang.Joueurs}">{$lang.Joueurs}</a></li>
    <li class="active">{$Joueur.nom} {$Joueur.prenom}</li>
</ol>


<div class="well">

	<div class="pull-right">
		{if $smarty.session.acl.gest_joueur == true}
		<a href="{$Helper->getLink("joueur/edit/{$Joueur.id}")}" title=""><i class="fa fa-edit fa-lg"></i></a>
		&nbsp;&nbsp;
		<a href="javascript:deleteJoueur({$Joueur.id})" title="{$lang.Supprimer}"><i class="fa fa-trash-o fa-lg"></i></a>
		{/if}
	</div>
	
	<div class="clearfix"></div>

	<div class="container">
		
		<h1>{$Joueur.prenom} {$Joueur.nom}</h1>	
		<div style="height:5px;"></div>

		<div class="row">
			{if !empty($Joueur.photo_id)}
			<div class="col-md-4">
				<div class="center"><img src="{$config.url}web/upload/joueurs/{$Joueur.id}/photo_id/{$Joueur.photo_id}" style="width:150px;" /></div>
			</div>
			{/if}

			{if !empty($Joueur.photo_id)}
			<div class="col-md-7">
			{else}
			<div class="col-md-11">
			{/if}

				<table class="table table-condensed">
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
						<ul class="unstyled">
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

			</div><!-- /col-md-xx -->
		</div><!-- /row -->
		</div><!-- /container -->
		
		<hr/>
		
		<!-- Tabs -->
		<!-- <div class="container">			
			<div class="row">
				<div class="col-md-11"> -->

					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a href="#tabstructure" data-toggle="tab">{$lang.Structure}/{$lang.Equipe}</a></li>
						{if $config.joueur_suivi_scolaire == 1}
						<li><a href="#tabscolaire" data-toggle="tab">{$lang.Scolaire}</a></li>
						{/if}
						<li><a href="#tabmorphologie" data-toggle="tab">{$lang.Morphologie}</a></li>
						
						{if $config.entrainement_type == 1}
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">{$lang.Entrainements}<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#tabentrainementphysique" data-toggle="tab">{$lang.Physique}</a></li>
								<li><a href="#tabentrainementtechnique" data-toggle="tab">{$lang.Tactique_technique}</a></li>
							</ul>
						</li>
						{else}
						<li><a href="#tabentrainement" data-toggle="tab">{$lang.Entrainements}</a></li>
						{/if}						

						{if $smarty.session.acl.view_suivimed == 1}
						<li><a href="#tabmedical" data-toggle="tab">{$lang.Medical}</a></li>
          				{/if}
						
          				<li><a href="#tabmusculation" data-toggle="tab">{$lang.Musculation}</a></li>
    					<li><a href="#tabtests" data-toggle="tab">{$lang.Tests}</a></li>
          				<li><a href="#tabressenti" data-toggle="tab">{$lang.Ressenti}</a></li>
    					<li><a href="#tabdocuments" data-toggle="tab">{$lang.Documents}</a></li>
    						
			        	{foreach $config.modules as $module}
			        		{if $module.m_view_in_fiche == 1}
			        		<li><a href="#tab{$module.m_module}" data-toggle="tab">{$module.m_name}</a></li>
			        		{/if}
			        	{/foreach}

			        	<li class="dropdown">
			        		<a href="#" class="dropdown-toggle" data-toggle="dropdown">+<b class="caret"></b></a>
		        			<ul class="dropdown-menu">
			        			<li><a href="#tabplus" data-toggle="tab">Infos</a></li>
			        			<li><a href="#tabparents" data-toggle="tab">{$lang.Environnement_familiale}</a></li>
		        			</ul>
			        	</li>
					</ul>
					
					<div class="tab-content">		
								
						<div class="tab-pane active" id="tabstructure" ></div>
						<div class="tab-pane" id="tabmorphologie"></div>
						{if $config.joueur_suivi_scolaire == 1}
						<div class="tab-pane" id="tabscolaire"></div>
						{/if}
							
						{if $config.entrainement_type == 1}
						<div class="tab-pane" id="tabentrainementphysique"></div>
						<div class="tab-pane" id="tabentrainementtechnique"></div>
						{else}
						<div class="tab-pane" id="tabentrainement"></div>
						{/if}
						
						{if $smarty.session.acl.view_suivimed == 1}
          				<div class="tab-pane" id="tabmedical"></div>
          				{/if}
          				
         				<div class="tab-pane" id="tabmusculation"></div>
    					<div class="tab-pane" id="tabtests"></div>    					
    					<div class="tab-pane" id="tabressenti"></div>
    					<div class="tab-pane" id="tabdocuments"></div>
    						
			        	{foreach $config.modules as $module}
			        		{if $module.m_view_in_fiche == 1}
			        		<div class="tab-pane" id="tab{$module.m_module}"></div>
			        		{/if}
			        	{/foreach}

			        	<div class="tab-pane" id="tabplus"></div>
						<div class="tab-pane" id="tabparents"></div>
			        </div><!-- /tab-content -->

					<!-- </div> -->
				
				<!-- </div>
			</div>	
		</div> -->
</div><!-- /well -->

{/strip}
<!-- Requete AJAX DE RECUPERATION DES TABS -->
<script type="text/javascript">
<!--
	// Structure
	$.get(
		'{getLink("joueur/getStructureInfo/{$Joueur.id}")}',{literal}
		{nohtml:'nohtml'},{/literal}
		function(data){ $('#tabstructure').html(data); }
	);

	// Morphologique
	$.get(
		'{getLink("joueur/getPhysiqueInfo/{$Joueur.id}")}',{literal}
		{nohtml:'nohtml'},{/literal}
		function(data){ $('#tabmorphologie').html(data); }
	);

	{if $config.joueur_suivi_scolaire == 1}
	// Scolaire
	$.get(
		'{getLink("joueur/getEtabInfo/{$Joueur.id}")}',{literal}
		{nohtml:'nohtml'},{/literal}
		function(data){ $('#tabscolaire').html(data); }
	);
	{/if}
	
	{if $config.entrainement_type == 1}
	// Entrainement physique
	$.get(
		'{getLink("joueur/getEntrainementInfo/{$Joueur.id}")}',{literal}
		{nohtml:'nohtml',type:'2'},{/literal}
		function(data){ $('#tabentrainementphysique').html(data); }
	);

	// Entrainement technique
	$.get(
		'{getLink("joueur/getEntrainementInfo/{$Joueur.id}")}',{literal}
		{nohtml:'nohtml',type:'1'},{/literal}
		function(data){ $('#tabentrainementtechnique').html(data); }
	);
	{else}
	$.get(
		'{getLink("joueur/getEntrainementInfo/{$Joueur.id}")}',{literal}
		{nohtml:'nohtml'},{/literal}
		function(data){ $('#tabentrainement').html(data); }
	);
	{/if}

	{if $smarty.session.acl.view_suivimed == 1}
	$.get(
		'{getLink("joueur/getSuiviMedical/{$Joueur.id}")}',{literal}
		{nohtml:'nohtml'},{/literal}
		function(data){ $('#tabmedical').html(data); }
	);
	{/if}

	$.get(
		'{getLink("joueur/getMuscuInfo/{$Joueur.id}")}',{literal}
		{nohtml:'nohtml'},{/literal}
		function(data){ $('#tabmusculation').html(data); }
	);
	
	// Test physique
	$.get(
		'{getLink("joueur/getTestInfo/{$Joueur.id}")}',{literal}
		{nohtml:'nohtml'},{/literal}
		function(data){ $('#tabtests').html(data); }
	);

	$.get(
		'{getLink("joueur/getTabRessentie/{$Joueur.id}")}',{literal}
		{nohtml:'nohtml'},{/literal}
		function(data){ $('#tabressenti').html(data); }
	);

	$.get(
		'{getLink("joueur/getDocuments/{$Joueur.id}")}',{literal}
		{nohtml:'nohtml'},{/literal}
		function(data){ $('#tabdocuments').html(data); }
	);

	$.get(
		'{getLink("joueur/getChampPlus/{$Joueur.id}")}',{literal}
		{nohtml:'nohtml'},{/literal}
		function(data){ $('#tabplus').html(data); }
	);

	{foreach $config.modules as $module}
		{if $module.m_view_in_fiche == 1}
		$.get(
			'{getLink("{$module.m_module}/tabFiche?joueur_id={$Joueur.id}")}',{literal}
			{nohtml:'nohtml'},{/literal}
			function(data){ $('#tab{$module.m_module}').html(data); }
		);
		{/if}
	{/foreach}

	$.get(
		'{getLink("paren/tabFiche/{$Joueur.id}")}',{literal}
		{nohtml:'nohtml'},{/literal}
		function(data){ $('#tabparents').html(data); }
	);

$('a[href="#tabmorphologie"]').on('shown', function (e) {
  e.target // activated tab
  e.relatedTarget // previous tab

  // Taille
  $.get(
		'{getLink("joueur/ajaxGetTailleData/{$Joueur.id}")}', {literal}
		{nohtml:'nohtml'},  
		function(data){
			if(data[0].length !== 0){
			var plot1 = $.jqplot ('chartTaille', [data[0]],{
				title: 'Taille evolution',
				axes:{
					xaxis:{
						renderer: $.jqplot.CategoryAxisRenderer,
						ticks: data[1],
					}
				}
			});
		}
		},'json'
	);
	{/literal}

  // Poids
  $.get(
		'{getLink("joueur/ajaxGetPoidsData/{$Joueur.id}")}', {literal}
		{nohtml:'nohtml'},  
		function(data){
			if(data[0].length !== 0){
			var plot1 = $.jqplot ('chartPoids', [data[0]],{
				title: 'Poids evolution',
				axes:{
					xaxis:{
						renderer: $.jqplot.CategoryAxisRenderer,
						ticks: data[1],
					}
				}
			});
			}
		},'json'
	);
	{/literal}


	// Img
	$.get(
		'{getLink("joueur/ajaxGetImgData/{$Joueur.id}")}', {literal}
		{nohtml:'nohtml'},  
		function(data){
			
			if(data[0].length !== 0){
				console.log('Donnee non vide IMG');
				var plot1 = $.jqplot ('chartImg', [data[0]],{
					title: 'Img evolution',
					axes:{
						xaxis:{
							renderer: $.jqplot.CategoryAxisRenderer,
							ticks: data[1],
						}
					}
				});
			}
			
		},'json'
	);
	{/literal}
});

{if !empty($Exercices)}
$('a[href="#tabtests"]').on('shown', function (e) {
  e.target // activated tab
  e.relatedTarget // previous tab
  {foreach $Exercices as $Row}
  	
  	$.get(
		'{getLink("test/ajaxGetExerciceData")}',{
			eid : '{$Row.exercice_id}',
			jid : '{$Joueur.id}',
			nohtml:'nohtml'
		},  
		function(data){
			
			if(data[0].length !== 0){
				
				var plot1 = $.jqplot ('testgraphexo{$Row.exercice_id}', [data[0]],{
					title: '{$Row.TE_NOM}',
					axes:{
						xaxis:{
							renderer: $.jqplot.CategoryAxisRenderer,
							ticks: data[1],
						}
					}
				});
			}
			
		},'json'
	);
	
  {/foreach}
});
{/if}
//-->
</script>