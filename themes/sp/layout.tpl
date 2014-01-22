<!DOCTYPE html>
<html>
<head>
<title>{$config.structure_name} {if isset($ctitre)} - {$ctitre}{/if}</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!--[if IE]><link rel="shortcut icon" type="image/x-icon" href="{$config.url}themes/sharkphp/images/sharkphp.ico" /><![endif]-->
<link rel="stylesheet" href="{$config.url}themes/font-awesome/css/font-awesome.css" type="text/css" media="screen" />
<link rel="stylesheet" href="{$config.url}themes/bootstrap3/css/bootstrap.css" type="text/css" media="screen" />
<link rel="stylesheet" href="{$config.url}themes/afpi2/css/afpi2.css" type="text/css" media="screen" />
<link rel="stylesheet" href="{$config.url}themes/sp/sp.css" type="text/css" media="screen" />
{if !empty($css_add)}
{foreach $css_add as $k => $v}
<link rel="stylesheet" href="{$config.url}web/css/{$v}" type="text/css" media="screen" />
{/foreach}
{/if}
{foreach registry::$css_lib as $k => $v}
<link rel="stylesheet" href="{$config.url}web/lib/{$v}" type="text/css" media="screen" />
{/foreach}
<script type="text/javascript" src="{$config.url}web/js/javascript.js"></script>  
{foreach registry::$js_lib as $k => $v}
<script type="text/javascript" src="{$config.url}web/lib/{$v}"></script>
{/foreach}  
{if !empty($js_add)}
{foreach $js_add as $k => $v}
<script type="text/javascript" src="{$config.url}web/js/{$v}"></script>
{/foreach}
{/if}
<script type="text/javascript" src="{$config.url}{$config.url_dir}themes/bootstrap3/js/bootstrap.min.js"></script>
{if isset($header_code) && !empty($header_code)}{$header_code}{/if}
</head>

<body>
{strip}
	<!-- START navbar header -->
	<div class="navbar navbar-default navbar-fixed-top navbar-inverse" role="navigation">
	
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
         <a class="brand" href="{$Helper->getLink("index")}"><i class="fa fa-home"></i></a>
        </div>
		
        <div class="navbar-collapse collapse">

          <ul class="nav navbar-nav navbar-right">
			{if $smarty.session.utilisateur.id != 'Visiteur'}
			
				{if $smarty.session.acl.view_all_fiche == true}
					<li class="dropdown">
						<a href="{$Helper->getLink("joueur")}" title="" class="dropdown-toggle" data-toggle="dropdown">
							{$lang.Joueurs}
							<b class="caret"></b>
						</a>
						<ul class="dropdown-menu">
							<li><a href="{$Helper->getLink("joueur")}" title="">{$lang.Liste}</a></li>
							<li><a href="{$Helper->getLink("joueur/add")}" title="">{$lang.Nouveau}</a></li>
						</ul>
					</li>
				{/if}
				
				{if $smarty.session.utilisateur.type == 'joueur'}
					<li><a href="{getLink("joueur")}" title="">{$lang.Fiche}</a></li>
				{/if}
				
				<li><a href="{$Helper->getLink("document")}" title="{$lang.Documents}">{$lang.Documents}</a></li>
				
				<!-- Musculation -->
				<li class="dropdown">
					<a href="#" title="" class="dropdown-toggle" data-toggle="dropdown">{$lang.Musculation} <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="{getLink("musculation")}" title="">{$lang.Exercice}</a></li>
						<li><a href="{getLink("muscu/cycleListe?all")}" title="">{$lang.Cycle}</a></li>
						<li class="dropdown-submenu">
							<a href="{getLink("muscu/seanceListe")}" title="" class="dropdown-toggle" data-toggle="dropdown">{$lang.Seance}</a>
							<ul class="dropdown-menu">
								<li><a href="{getLink("muscu/seanceListe")}">{$lang.Liste}</a></li>
								{if $smarty.session.acl.gest_muscu == 1}<li><a href="{getLink("muscu/seanceAdd")}">{$lang.Ajouter_un_modele}</a></li>{/if}
							</ul>
						</li>
						<li><a href="{getLink("muscu/testListe")}" title="">{$lang.Test}</a></li>
					</ul>
				</li>
				
				{if $smarty.session.acl.gest_entrainement == 1}
					<!-- Test physique -->
					<li class="dropdown">
						<a href="#" title="" class="dropdown-toggle" data-toggle="dropdown">
							{$lang.Tests}
							<b class="caret"></b>
						</a>
						<ul class="dropdown-menu">
							<li><a href="{getLink("test")}" title="">{$lang.Liste}</a></li>
							<li><a href="{getLink("test/indexExercice")}" title="">{$lang.Exercice}</a></li>
						</ul>
					</li>
					{/if}

					{if $smarty.session.acl.gest_entrainement == 1}
					<!-- Entrainements -->
					<li class="dropdown">
						<a href="#" title="" class="dropdown-toggle" data-toggle="dropdown">
							{$lang.Entrainements}
							<b class="caret"></b>
						</a>
						<ul class="dropdown-menu">
							<li><a href="{getLink("entrainement")}" title="">{$lang.Liste}</a></li>
							<li><a href="{getLink("entrainement/add")}" title="">{$lang.Nouveau}</a></li>
						</ul>
					</li>
					{/if}

					{if ($smarty.session.acl.gest_entrainement == 1 || $smarty.session.acl.gest_joueur == 1)}
					<!-- Ressenti -->
					<li><a href="{getLink("ressentie")}" title="">{$lang.Ressenti}</a></li>
					{/if}

					<!-- Programmation -->
					<li><a href="{getLink("programmation")}" title="">{$lang.Programmation}</a></li>

					<!-- Module complementaire -->
					{foreach $config.modules as $module}
						{if $module.m_view_in_menu == 1}
						<li><a href="{getLink("{$module.m_module}/index")}" title="">{$module.m_name}</a></li>
						{/if}
					{/foreach}

					<!-- Organigramme -->
					<li><a href="{getLink("organigramme")}" title="">{$lang.Organigramme}</a></li>

					<!-- Profil -->
					<li><a href="{getLink("utilisateur")}" title=""><i class="icon-user icon-white"></i></a></li>

					<!-- Administration -->
					<li class="dropdown">
						<a href="#" title="" class="dropdown-toggle" data-toggle="dropdown">
							<i class="icon-wrench icon-white"></i>
							<b class="caret"></b>
						</a>
						<ul class="dropdown-menu">
							<li><a href="{getLink("administration/aclIndex")}" title="">ACLs</a></li>
							<li><a href="{getLink("administration/actuIndex")}" title="">{$lang.Actualite}</a></li>
							<li><a href="{getLink("administration/equipeIndex")}" title="">{$lang.Equipe}</a></li>
							<li><a href="{getLink("administration/etabScolaireIndex")}" title="">{$lang.Etablissement_scolaire}</a></li>
							<li><a href="{getLink("administration/matiereIndex")}" title="">{$lang.Matieres}</a></li>
							<li><a href="{getLink("administration/OrganigrammeIndex")}" title="">Encadrement</a></li>
							<li><a href="{getLink("administration/setting")}" title="">{$lang.Preferences}</a></li>
							<li><a href="{getLink("structure")}" title="">{$lang.Structures}</a></li>
							<li><a href="{getLink("administration/programmationTypeIndex")}" title="">{$lang.Type_de_programmation}</a></li>
							<li><a href="{$Helper->getLink("administration/saisonindex")}" title="{$lang.Saisons}">{$lang.Saisons}</a></li>
							<li class="dropdown-submenu">
								<a href="" title="" class="dropdown-toggle" data-toggle="dropdown">{$lang.Utilisateurs}</a>
								<ul class="dropdown-menu">
									<li><a href="{getLink("administration/userIndex")}">{$lang.Liste}</a></li>
									<li><a href="{getLink("administration/userAdd")}">{$lang.Nouveau}</a></li>
								</ul>
							</li>
							<li class="dropdown-submenu">
								<a href="" title="" class="dropdown-toggle" data-toggle="dropdown">System</a>
								<ul class="dropdown-menu">
									<li><a href="{getLink("administration/errorPhpListe")}">Errors</a></li>
									<li><a href="{getLink("administration/connexionListe")}">Log acces</a></li>
									<li><a href="{getLink("administration/resizeImageJoueur")}">Resize images</a></li>
								</ul>
							</li>
						</ul>
					</li>
				
			<li class="dropdown">		
				<a id="notification-icon" class="notifications notification-icon dropdown-toggle" data-toggle="dropdown" href="#">				    	
					<i class="glyphicon glyphicon-globe"></i>
					<span class="notification-counter" id="notification-counter" style="display: none;">0</span>
				</a>

			    <ul id="notification-items" class="dropdown-menu" aria-labelledby="notification-icon">
					{if isset($clear_notification)}
					<li class="notification-button">
						Clear notification
					</li>
					<li class="divider"></li>
					{/if}
			        
			        <li id="notification-spinner"><img src="{$config.url}web/lib/notifications/img/loading.gif" alt="Loading" /></li>
			        
			        {if isset($all_notification)}
			            <li class="divider"></li>
			            <li class="notification-button">
			                All notifications
			            </li>
			        {/if}			        
			    </ul>			
			</li>

			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-user"></i> {if !empty($smarty.session.utilisateur.prenom)}&nbsp;<strong>{$smarty.session.utilisateur.prenom}</strong>{/if} <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="{$Helper->getLink("utilisateur")}" title="Mon compte"><i class="glyphicon glyphicon-user"></i> Profil</a></li>
					<li class="divider"></li>
					<li><a href="{$Helper->getLink("tasks/mytasks")}" title="Mes tâches"><i class="fa fa-tasks"></i> Tâches</a></li>
					<li><a href="{$Helper->getLink("notifications/viewall")}" title="Notifications"><i class="fa fa-globe"></i> Notifications</a></li>
					<li class="divider"></li>
					<li><a href="{$Helper->getLink("connexion/logout")}" title="Deconnexion"><i class="glyphicon glyphicon-off"></i> Deconnexion</a></li>
				</ul>
			</li>
			
			{/if}
          </ul>
          
        </div><!--/.nav-collapse -->
      </div>
    </div>
	<!-- END navbar header -->

	

	<!-- Header -->
	<div id="header" style="padding-top:40px;">
		<div class="container">
		<div class="pull-left" id="header_left"></div>
		<div class="pull-left" style="margin-left:50px; margin-top:10px;" id="header_center"></div>
		<div class="pull-right" id="header_right"></div>
		<div class="clearfix"></div>
	</div><!-- /container -->
	</div>

	<!-- Contenu -->
	<div class="container">
	<div class="row-fluid">
		
		<div class="span12">{$content}</div>
	</div>
</div>
	<!-- Footer -->
{literal}
<script type="text/javascript">
$(function (){
   $('a').tooltip();
});
</script>	
{/literal}
</body>
</html>
{/strip}