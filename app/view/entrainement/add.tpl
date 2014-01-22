<script type="text/javascript">
<!--
function getListJoueur(){
    var date_e;
    var equipe_id;
    var annee;
    
    date_e = $("#date_entrainement").val();

    {if $InfosInstall.i_type == 'full'}
	annee =  $("#anfo").val();
	{/if}

	{if $config.entrainement_filtre_equipe == 1}
	equipe_id = $('#equipe_id').val();
	{/if}
	
    $('#list_joueur').html('<div class="sep"></div>{$lang.Chargement}<br/><br/><img src="{$config.url}{$config.url_dir}web/images/ajax-loader.gif" />');
    $.get(
        '{getLink("entrainement/getJoueurDisponible")}',
        {literal}
        {date_e:date_e, annee:annee, equipe:equipe_id, nohtml:'nohtml'},
        function(data){ $('#list_joueur').html(data); }
        {/literal}
    );
}
//-->
</script>
{strip}

{if $smarty.const.BREAD == 1 && !isset($smarty.get.nohtml)}
<ul class="breadcrumb">
	<li><a href="{getLink("index")}" title="{$lang.Accueil}">{$lang.Accueil}</a><span class="divider">/</span></li>
	<li><a href="{getLink("entrainement")}" title="{$lang.Entrainement}">{$lang.Entrainement}</a><span class="divider">/</span></li>
	<li>{$lang.Nouveau}</li>
</ul>
{/if}

<div class="well">

<form method="post" class="form-horizontal" action="{getLink("entrainement/add")}">
	<h1>{$lang.Nouvel_entrainement}</h1>

	{if $config.entrainement_type == 1 && $InfosInstall.i_type == 'full'}
	<div class="control-group">
		<label class="control-label" for="type">{$lang.Type} :</label>
		<div class="controls">
			<select name="entrainement[type]" id="type" required class="validate[required]">
				<option></option>
				{foreach $TENT as $Row}
				<option value="{$Row.value}">{$Row.libelle}</option>
				{/foreach}
			</select>
		</div>
	</div>
	{/if}

	{if $config.entrainement_filtre_annee == 1 && $InfosInstall.i_type == 'full'}
	<!-- Annee -->
	<div class="control-group">
		<label class="control-label" for="anfo">{$lang.Annee} :</label>
		<div class="controls">
			<select id="anfo">
				<option value="">{$lang.Tous}</option>
				{foreach $ANFO as $Row}
				<option value="{$Row.value}">{$Row.libelle}</option>
				{/foreach}
			</select>
		</div>
	</div>
	{/if}

	{if $config.entrainement_filtre_equipe == 1}
	<!-- Equipes -->
	<div class="control-group">
		<label class="control-label" for="equipe_id">{$lang.Equipes} :</label>
		<div class="controls">
			<select id="equipe_id">
				<option>{$lang.Toutes}</option>
				{foreach $Equipes as $Row}
				<option value="{$Row.id}">{$Row.nom} {if !empty($Row.structure)}&nbsp;-&nbsp;{$Row.structure}{/if}</option>
				{/foreach}
			</select>
		</div>
	</div>
	{/if}

    <div class="control-group">
        <label class="control-label" for="date_entrainement">{$lang.Date}</label>
        <div class="controls"><input type="text" id="date_entrainement" name="entrainement[date_entrainement]" onchange="getListJoueur()"/></div>    
    </div>

    <div class="control-group">
        <label class="control-label" for="description">{$lang.Description}</label>
        <div class="controls"><textarea cols="60" rows="5" name="entrainement[description]" id="description"></textarea></div>    
    </div>

	<div id="list_joueur" style="vertical-align:text-top;"></div>

	<div class="center">
		{if $InfosInstall.i_type == 'light'}
		<input type="hidden" name="entrainement[type]" value="0" />
		{elseif $InfosInstall.i_type == 'full' && $config.entrainement_type == 0}
		<input type="hidden" name="entrainement[type]" value="0" />
		{/if}
		<input type="hidden" name="entrainement[add_by]" value="{$smarty.session.utilisateur.id}" />
		<input type="hidden" name="entrainement[creat_on]" value="{$smarty.now}" />
		<input type="submit" value="{$lang.Enregistrer}" class="btn"/>
	</div>
</form>
</div>
{/strip}
{literal}
<script type="text/javascript">
<!--
    $(function() {
        $( "#date_entrainement" ).datepicker({ dateFormat: 'dd/mm/yy' });
        $('#list_joueur select').css('vertical-align','top');
    });
    
//-->
</script>
{/literal}