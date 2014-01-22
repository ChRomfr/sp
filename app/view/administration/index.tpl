<script type="text/javascript">
function getDevUpdate(){
  $.get(
        '{getLink("administration/devActuAjaxGet")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#contener_dev_actus').html(data); }
    )
    {/literal}
}
</script>
{strip}
<div id="bread">
	<a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a>&nbsp;>>&nbsp;
	{$lang.Administration}
</div>
<div class="showData">
	<h1>Stats</h1>
	<ul>
		<li>{$lang.Joueurs} : {$Stats.NbJoueurs}</li>
		<li>{$lang.Utilisateurs} : {$Stats.NbUtilisateurs}</li>
		<li>{$lang.Clubs} : {$Stats.NbClubs}</li>		
		<li>{$lang.Entrainements} : {$Stats.NbEntrainements}</li>			
	</ul>
</div>
<div class="showData">
	<h1>Install information</h1>
	<ul>
		<li>Date of installation : <strong>{$InfosInstall.i_date_install|date_format:$config.format_date_day}</strong></li>
		<li>Date of expiration: <strong>{$InfosInstall.i_date_expire|date_format:$config.format_date_day}</strong></li>	
		<li>ID : <strong>{$config.id_install}</strong></li>
        <li>Type of install : <strong>{$InfosInstall.i_type}</strong></li>
        {if $InfosInstall.i_type == 'full'}<li>Password default player : <strong>aze.123</strong></li>{/if}
        {if count($config.modules) > 0}
        <li>Modules :
          <ul>
            {foreach $config.modules as $Row}
            <li>{$Row.m_name}</li>
            {/foreach}
          </ul>
        </li>
        {/if}
	</ul>
</div>
<div class="showData">
<li><a href="{getLink("administration/etabScolaireIndex")}" title="{$lang.Etablissement_scolaire}">{$lang.Etablissement_scolaire}</a></li>
	<li><a href="{getLink("administration/setting")}" title="{$lang.Preferences}">{$lang.Preferences}</a></li>
	{if $Module_form_perso == true}
	<li><a href="{getLink("administration/formIndex")}" title="">{$lang.Personnalisation_formulaires}</a></li>
	{/if}
</div>
<div id="contener_dev_actus"></div>
{/strip}
<script type="text/javascript">
  getDevUpdate();
</script>
{* 2592000 sec dans 30 jours *}