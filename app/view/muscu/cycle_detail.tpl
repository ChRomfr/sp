{if !isset($smarty.get.pdf)}
<script type="text/javascript">
<!--
$(function() {
    $( "#diag-details" ).dialog({ autoOpen: false, width:800 });
});

function deleteSeanceInCycle(SID){
    if( confirm('{$lang.Confirm_suppression_seance_in_cyle} ?') ){
        window.location.href = '{getLink("muscu/removeSeanceInCycle/'+SID+'")}';
    }
}

function getFormAddSeance(){
     $.get(
            '{getLink("muscu/addSeanceInCycle/{$Cycle.id}")}',{literal}
            {nohtml:'nohtml'},
            function(data){ $('#diag-details').html(data); }
        )
    {/literal}

    $( "#diag-details" ).dialog('open');
}

//-->
</script>{strip}

{if $smarty.const.BREAD == 1}
<div id="bread">
    <a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a>&nbsp;>>&nbsp;
    <a href="{getLink("musculation/index")}" title="{$lang.Musculation}">{$lang.Musculation}</a>&nbsp;>>&nbsp;
    <a href="{getLink("muscu/cycleListe")}" title="{$lang.Cycle}">{$lang.Cycle}</a>&nbsp;>>&nbsp;
    {$lang.Detail_cycle}
</div>
{/if}

<div class="showData">
	<h1>{$lang.Detail_cycle} : {$Cycle.nom}</h1>
	
	<table>
		<tr>
			<td>{$lang.Date_debut} :</td>
			<td>{$Cycle.date_debut|date_format:$config.format_date_day}</td>
		</tr><tr>
			<td>{$lang.Date_fin} :</td>
			<td>{$Cycle.date_fin|date_format:$config.format_date_day}</td>
		</tr><tr>
			<td>{$lang.Description}</td>
			<td>{$Cycle.description|nl2br}</td>
		</tr><tr>
			<td>{$lang.Nombre_de_seances_effectuees} :</td>
			<td>{$Seances_eff|count}</td>
		</tr>
		{* PARTICIPANT *}
		<tr>
			<td style="vertical-align:top;">{$lang.Joueurs} :</td>
			<td>
				<ul>
					{foreach $Joueurs as $Row}
					<li><a href="{getLink("joueur/fiche/{$Row.id}")}" title="">{$Row.nom} {$Row.prenom}</a></li>
					{/foreach}
				</ul>
			</td>
		</tr>
	</table>



{* LISTE DES SEANCES AVEC LEUR EXERCICE *}
	{foreach $Seances as $Row}
    {* Action sur la seance *}
	{if $smarty.session.acl.gest_muscu == 1}
    <div class="fright">
        <a href="javascript:deleteSeanceInCycle({$Row.id})"><img src="{$config.url}{$config.url_dir}web/images/delete.png" alt="" /></a>
    </div>
	{/if}
	
	<h1>{$lang.Seance} : {$Row.nom}</h1>
    <div style="clear:both;"></div>
	<div style="margin:auto; padding:5px; width:95%;">{$Row.description|nl2br}</div>
	<table class="tadmin">
		<thead>
			<tr>
				<td>{$lang.Exercice}</td>
				<td>{$lang.Poids}</td>
				<td>{$lang.Repetition}</td>
				<td>{$lang.Serie}</td>
			</tr>
		</thead>
		<tbody>
			{foreach $Row.exos as $Data}
			<tr>
				<td>{$Data.ME_NOM}</td>
				<td>{$Data.poids}</td>
				<td>{$Data.repetition}</td>
				<td>{$Data.serie}</td>
			{/foreach}
		</tbody>
	</table>
    <br/><br/>
	{/foreach}
 
 {* Action sur le cycle *} 
 {if $smarty.session.acl.gest_muscu == 1}
 <div class="fright">
    <a href="javascript:getFormAddSeance();" title="{$lang.Ajouter_une_seance}"><img src="{$config.url}{$config.url_dir}web/images/add.png" alt="{$lang.Ajouter_une_seance}" /></a>
 </div>
 {/if}
 </div> 
 <div id="diag-details"><div>{/strip}
 
 {else}
 
 	{* 
 		CODE POUR AFFICHAGE PDF
 	*}
 
 	<h1>{$lang.Detail_cycle} : {$Cycle.nom}</h1>
	
	<table style="width:100%; border:1px solid; border-collapse: collapse;">
		<tr>
			<td style="border:1px solid;">{$lang.Date_debut} :</td>
			<td style="border:1px solid;">{$Cycle.date_debut|date_format:$config.format_date_day}</td>
		</tr><tr>
			<td style="border:1px solid;">{$lang.Date_fin} :</td>
			<td style="border:1px solid;">{$Cycle.date_fin|date_format:$config.format_date_day}</td>
		</tr><tr>
			<td style="border:1px solid;">{$lang.Description}</td>
			<td style="border:1px solid;">{$Cycle.description|nl2br}</td>
		</tr><tr>
			<td style="border:1px solid;">{$lang.Nombre_de_seances_effectuees} :</td>
			<td style="border:1px solid;">{$Seances_eff|count}</td>
		</tr>
	</table>
	
	{* BOUCLE POUR AFFICHAGE DES SEANCES *}
	{foreach $Seances as $Row} 
		<h1>{$lang.Seance} : {$Row.nom}</h1>
	    <div style="clear:both;"></div>
		<div style="margin:auto; padding:5px; width:95%;">{$Row.description|nl2br}</div>
		<table style="width:100%; border:1px solid; border-collapse: collapse;">
			<thead>
				<tr>
					<td style="border:1px solid;">{$lang.Exercice}</td>
					<td style="border:1px solid;">{$lang.Poids}</td>
					<td style="border:1px solid;">{$lang.Repetition}</td>
					<td style="border:1px solid;">{$lang.Serie}</td>
				</tr>
			</thead>
			<tbody>
				{foreach $Row.exos as $Data}
				<tr>
					<td style="border:1px solid;">{$Data.ME_NOM}</td>
					<td style="border:1px solid;">{$Data.poids}</td>
					<td style="border:1px solid;">{$Data.repetition}</td>
					<td style="border:1px solid;">{$Data.serie}</td>
				{/foreach}
			</tbody>
		</table>
	{/foreach}
	
	{* BOUCLES SUR LES EXOS *}
	<pagebreak type="NEXT-ODD" resetpagenum="1" pagenumstyle="i" suppress="off" />
	{foreach $Exercices as $Exercice} 
		<h1>{$Exercice.nom}</h1>
		<table class="tadmin">
		    <tbody>
		        <tr>
		            <td style="width:25%;"><strong>{$lang.Muscle_travaille} :</strong></td>
		            <td>{$Exercice.muscle_travail}</td>
		        </tr>
		        <tr>
		            <td><strong>{$lang.Description} :</strong></td>
		            <td>{$Exercice.description|nl2br}</td>
		        </tr>
		        {if !empty($Photos) && count($Photos) > 0}
		        <tr>
		        	<td><strong>{$lang.Illustrations} :</strong></td>
		        	<td>
		        		<div id="gallery">
		        			<table style="width:100%;">
							<tr>
								{foreach $Photos as $image}
								<td class="center" style="border:none;">
									<a href="{$config.url}{$config.url_dir}web/upload/muscu/{$image.exercice_id}/images/{$image.photo}" title="">
										<img src="{$config.url}{$config.url_dir}web/upload/muscu/{$image.exercice_id}/images/{$image.photo}" style="width:150px;" alt="">
									</a>
								</td>
								{if $image@iteration % 4 == 0}
							</tr><tr>
								{/if}
								{/foreach}
							</tr>
						</table>
		        		</div>
		        	</td>
		        </tr>
		        {/if}
		    </tbody>
		</table>
		<pagebreak type="NEXT-ODD" resetpagenum="1" pagenumstyle="i" suppress="off" />
	{/foreach}
	
 {/if}