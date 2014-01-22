<!DOCTYPE html>
<html>
<head>
<title>{$config.structure_name} {if isset($ctitre)} - {$ctitre}{/if}</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="{$config.base_url}themes/default/design.css" type="text/css" media="screen" />
<link rel="stylesheet" href="{$config.base_url}themes/{$config.theme}/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="{$config.base_url}themes/default/print_generique_style.css" type="text/css" media="print" />
<link rel="stylesheet" href="{$config.base_url}themes/bootstrap/css/font-awesome.css" type="text/css" media="screen" />
<link rel="stylesheet" href="{$config.base_url}themes/bootstrap/css/bootstrap.css" type="text/css" media="screen" />
<link rel="stylesheet" href="{$config.base_url}themes/bootstrap/css/bootstrap-responsive.css" type="text/css" media="screen" />
<link rel="stylesheet" href="{$config.base_url}themes/bootstrap/css/opa-icons.css" type="text/css" media="screen" />
{if !empty($css_add)}
{foreach $css_add as $k => $v}
<link rel="stylesheet" href="{$config.url}{$config.url_dir}web/css/{$v}" type="text/css" media="screen" />
{/foreach}
{/if}
{foreach registry::$css_lib as $k => $v}
<link rel="stylesheet" href="{$config.url}{$config.url_dir}web/lib/{$v}" type="text/css" media="screen" />
{/foreach}
<script type="text/javascript" src="{$config.url}{$config.url_dir}web/js/javascript.js"></script>  
{foreach registry::$js_lib as $k => $v}
<script type="text/javascript" src="{$config.url}{$config.url_dir}web/lib/{$v}"></script>
{/foreach}  
{if !empty($js_add)}
{foreach $js_add as $k => $v}
<script type="text/javascript" src="{$config.url}{$config.url_dir}web/js/{$v}"></script>
{/foreach}
{/if}
<script type="text/javascript" src="{$config.url}{$config.url_dir}themes/bootstrap/js/bootstrap.min.js"></script>
{if isset($header_code) && !empty($header_code)}{$header_code}{/if}
</head>
<body data-spy="scroll" data-target=".navbar">
{strip}
	<!-- NAVBAR -->
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse" date-target=".nav-collapse">
					<span class="icon-bar"></sapn>
					<span class="icon-bar"></sapn>
					<span class="icon-bar"></sapn>
				</a>
				<a class="brand" href="{getLink("index")}"><i class="icon-home icon-white"></i></a>
				<div class="nav-collapse">
					<ul class="nav">
						{if $smarty.session.utilisateur.id != "Visiteur"}
							{if $smarty.session.acl.view_all_fiche == true}
								<li class="dropdown">
									<a href="{getLink("joueur")}" title="" class="dropdown-toggle" data-toggle="dropdown">
										{$lang.Joueurs}
										<b class="caret"></b>
									</a>
									<ul class="dropdown-menu">
										<li><a href="{getLink("joueur")}" title="">{$lang.Liste}</a></li>
										<li><a href="{getLink("joueur/add")}" title="">{$lang.Nouveau}</a></li>
									</ul>
								</li>
							{/if}
							{if $smarty.session.utilisateur.type == 'joueur'}
								<li><a href="{getLink("joueur")}" title="">{$lang.Fiche}</a></li>
							{/if}

							{if $InfosInstall.i_type == 'full'}
							<!-- Document -->
							<li><a href="{getLink("document")}" title="">{$lang.Documents}</a></li>

							<!-- Musculation -->
							<li class="dropdown">
								<a href="{getLink("musculation")}" title="" class="dropdown-toggle" data-toggle="dropdown">
									{$lang.Musculation}
									<b class="caret"></b>
								</a>
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
							{/if}

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

							{if ($smarty.session.acl.gest_entrainement == 1 || $smarty.session.acl.gest_joueur == 1) && $InfosInstall.i_type == 'full'}
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

							<!-- Deconnexion -->
							<li><a href="{getLink("connexion/logout")}" title=""><i class="icon-off icon-white"></i></a></li>

						{/if}
					</ul>
				</div>
			</div>
		</div>
	</div><!-- /navbar -->
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