<?php /* Smarty version Smarty-3.1.13, created on 2014-01-20 16:51:09
         compiled from "D:\wamp\www\goliathv2\themes\sp\layout.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1882652dd31979eb2d2-51483007%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '973bd2e2b46af73ebba0edc08ee98ac1f4db6ffd' => 
    array (
      0 => 'D:\\wamp\\www\\goliathv2\\themes\\sp\\layout.tpl',
      1 => 1390233056,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1882652dd31979eb2d2-51483007',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_52dd3198279bd6_96281880',
  'variables' => 
  array (
    'config' => 0,
    'ctitre' => 0,
    'css_add' => 0,
    'v' => 0,
    'js_add' => 0,
    'header_code' => 0,
    'Helper' => 0,
    'lang' => 0,
    'module' => 0,
    'clear_notification' => 0,
    'all_notification' => 0,
    'content' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_52dd3198279bd6_96281880')) {function content_52dd3198279bd6_96281880($_smarty_tpl) {?><!DOCTYPE html>
<html>
<head>
<title><?php echo $_smarty_tpl->tpl_vars['config']->value['structure_name'];?>
 <?php if (isset($_smarty_tpl->tpl_vars['ctitre']->value)){?> - <?php echo $_smarty_tpl->tpl_vars['ctitre']->value;?>
<?php }?></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!--[if IE]><link rel="shortcut icon" type="image/x-icon" href="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
themes/sharkphp/images/sharkphp.ico" /><![endif]-->
<link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
themes/font-awesome/css/font-awesome.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
themes/bootstrap3/css/bootstrap.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
themes/afpi2/css/afpi2.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
themes/sp/sp.css" type="text/css" media="screen" />
<?php if (!empty($_smarty_tpl->tpl_vars['css_add']->value)){?>
<?php  $_smarty_tpl->tpl_vars['v'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['v']->_loop = false;
 $_smarty_tpl->tpl_vars['k'] = new Smarty_Variable;
 $_from = $_smarty_tpl->tpl_vars['css_add']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['v']->key => $_smarty_tpl->tpl_vars['v']->value){
$_smarty_tpl->tpl_vars['v']->_loop = true;
 $_smarty_tpl->tpl_vars['k']->value = $_smarty_tpl->tpl_vars['v']->key;
?>
<link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
web/css/<?php echo $_smarty_tpl->tpl_vars['v']->value;?>
" type="text/css" media="screen" />
<?php } ?>
<?php }?>
<?php  $_smarty_tpl->tpl_vars['v'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['v']->_loop = false;
 $_smarty_tpl->tpl_vars['k'] = new Smarty_Variable;
 $_from = registry::$css_lib; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['v']->key => $_smarty_tpl->tpl_vars['v']->value){
$_smarty_tpl->tpl_vars['v']->_loop = true;
 $_smarty_tpl->tpl_vars['k']->value = $_smarty_tpl->tpl_vars['v']->key;
?>
<link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
web/lib/<?php echo $_smarty_tpl->tpl_vars['v']->value;?>
" type="text/css" media="screen" />
<?php } ?>
<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
web/js/javascript.js"></script>  
<?php  $_smarty_tpl->tpl_vars['v'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['v']->_loop = false;
 $_smarty_tpl->tpl_vars['k'] = new Smarty_Variable;
 $_from = registry::$js_lib; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['v']->key => $_smarty_tpl->tpl_vars['v']->value){
$_smarty_tpl->tpl_vars['v']->_loop = true;
 $_smarty_tpl->tpl_vars['k']->value = $_smarty_tpl->tpl_vars['v']->key;
?>
<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
web/lib/<?php echo $_smarty_tpl->tpl_vars['v']->value;?>
"></script>
<?php } ?>  
<?php if (!empty($_smarty_tpl->tpl_vars['js_add']->value)){?>
<?php  $_smarty_tpl->tpl_vars['v'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['v']->_loop = false;
 $_smarty_tpl->tpl_vars['k'] = new Smarty_Variable;
 $_from = $_smarty_tpl->tpl_vars['js_add']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['v']->key => $_smarty_tpl->tpl_vars['v']->value){
$_smarty_tpl->tpl_vars['v']->_loop = true;
 $_smarty_tpl->tpl_vars['k']->value = $_smarty_tpl->tpl_vars['v']->key;
?>
<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
web/js/<?php echo $_smarty_tpl->tpl_vars['v']->value;?>
"></script>
<?php } ?>
<?php }?>
<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
themes/bootstrap3/js/bootstrap.min.js"></script>
<?php if (isset($_smarty_tpl->tpl_vars['header_code']->value)&&!empty($_smarty_tpl->tpl_vars['header_code']->value)){?><?php echo $_smarty_tpl->tpl_vars['header_code']->value;?>
<?php }?>
</head>

<body>
<!-- START navbar header --><div class="navbar navbar-default navbar-fixed-top navbar-inverse" role="navigation"><div class="container"><div class="navbar-header"><button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><a class="brand" href="<?php echo $_smarty_tpl->tpl_vars['Helper']->value->getLink("index");?>
"><i class="fa fa-home"></i></a></div><div class="navbar-collapse collapse"><ul class="nav navbar-nav navbar-right"><?php if ($_SESSION['utilisateur']['id']!='Visiteur'){?><?php if ($_SESSION['acl']['view_all_fiche']==true){?><li class="dropdown"><a href="<?php echo $_smarty_tpl->tpl_vars['Helper']->value->getLink("joueur");?>
" title="" class="dropdown-toggle" data-toggle="dropdown"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Joueurs'];?>
<b class="caret"></b></a><ul class="dropdown-menu"><li><a href="<?php echo $_smarty_tpl->tpl_vars['Helper']->value->getLink("joueur");?>
" title=""><?php echo $_smarty_tpl->tpl_vars['lang']->value['Liste'];?>
</a></li><li><a href="<?php echo $_smarty_tpl->tpl_vars['Helper']->value->getLink("joueur/add");?>
" title=""><?php echo $_smarty_tpl->tpl_vars['lang']->value['Nouveau'];?>
</a></li></ul></li><?php }?><?php if ($_SESSION['utilisateur']['type']=='joueur'){?><li><a href="<?php echo getLink("joueur");?>
" title=""><?php echo $_smarty_tpl->tpl_vars['lang']->value['Fiche'];?>
</a></li><?php }?><li><a href="<?php echo $_smarty_tpl->tpl_vars['Helper']->value->getLink("document");?>
" title="<?php echo $_smarty_tpl->tpl_vars['lang']->value['Documents'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Documents'];?>
</a></li><!-- Musculation --><li class="dropdown"><a href="#" title="" class="dropdown-toggle" data-toggle="dropdown"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Musculation'];?>
 <b class="caret"></b></a><ul class="dropdown-menu"><li><a href="<?php echo getLink("musculation");?>
" title=""><?php echo $_smarty_tpl->tpl_vars['lang']->value['Exercice'];?>
</a></li><li><a href="<?php echo getLink("muscu/cycleListe?all");?>
" title=""><?php echo $_smarty_tpl->tpl_vars['lang']->value['Cycle'];?>
</a></li><li class="dropdown-submenu"><a href="<?php echo getLink("muscu/seanceListe");?>
" title="" class="dropdown-toggle" data-toggle="dropdown"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Seance'];?>
</a><ul class="dropdown-menu"><li><a href="<?php echo getLink("muscu/seanceListe");?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Liste'];?>
</a></li><?php if ($_SESSION['acl']['gest_muscu']==1){?><li><a href="<?php echo getLink("muscu/seanceAdd");?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Ajouter_un_modele'];?>
</a></li><?php }?></ul></li><li><a href="<?php echo getLink("muscu/testListe");?>
" title=""><?php echo $_smarty_tpl->tpl_vars['lang']->value['Test'];?>
</a></li></ul></li><?php if ($_SESSION['acl']['gest_entrainement']==1){?><!-- Test physique --><li class="dropdown"><a href="#" title="" class="dropdown-toggle" data-toggle="dropdown"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Tests'];?>
<b class="caret"></b></a><ul class="dropdown-menu"><li><a href="<?php echo getLink("test");?>
" title=""><?php echo $_smarty_tpl->tpl_vars['lang']->value['Liste'];?>
</a></li><li><a href="<?php echo getLink("test/indexExercice");?>
" title=""><?php echo $_smarty_tpl->tpl_vars['lang']->value['Exercice'];?>
</a></li></ul></li><?php }?><?php if ($_SESSION['acl']['gest_entrainement']==1){?><!-- Entrainements --><li class="dropdown"><a href="#" title="" class="dropdown-toggle" data-toggle="dropdown"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Entrainements'];?>
<b class="caret"></b></a><ul class="dropdown-menu"><li><a href="<?php echo getLink("entrainement");?>
" title=""><?php echo $_smarty_tpl->tpl_vars['lang']->value['Liste'];?>
</a></li><li><a href="<?php echo getLink("entrainement/add");?>
" title=""><?php echo $_smarty_tpl->tpl_vars['lang']->value['Nouveau'];?>
</a></li></ul></li><?php }?><?php if (($_SESSION['acl']['gest_entrainement']==1||$_SESSION['acl']['gest_joueur']==1)){?><!-- Ressenti --><li><a href="<?php echo getLink("ressentie");?>
" title=""><?php echo $_smarty_tpl->tpl_vars['lang']->value['Ressenti'];?>
</a></li><?php }?><!-- Programmation --><li><a href="<?php echo getLink("programmation");?>
" title=""><?php echo $_smarty_tpl->tpl_vars['lang']->value['Programmation'];?>
</a></li><!-- Module complementaire --><?php  $_smarty_tpl->tpl_vars['module'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['module']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['config']->value['modules']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['module']->key => $_smarty_tpl->tpl_vars['module']->value){
$_smarty_tpl->tpl_vars['module']->_loop = true;
?><?php if ($_smarty_tpl->tpl_vars['module']->value['m_view_in_menu']==1){?><li><a href="<?php echo getLink(((string)$_smarty_tpl->tpl_vars['module']->value['m_module'])."/index");?>
" title=""><?php echo $_smarty_tpl->tpl_vars['module']->value['m_name'];?>
</a></li><?php }?><?php } ?><!-- Organigramme --><li><a href="<?php echo getLink("organigramme");?>
" title=""><?php echo $_smarty_tpl->tpl_vars['lang']->value['Organigramme'];?>
</a></li><!-- Profil --><li><a href="<?php echo getLink("utilisateur");?>
" title=""><i class="icon-user icon-white"></i></a></li><!-- Administration --><li class="dropdown"><a href="#" title="" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-wrench icon-white"></i><b class="caret"></b></a><ul class="dropdown-menu"><li><a href="<?php echo getLink("administration/aclIndex");?>
" title="">ACLs</a></li><li><a href="<?php echo getLink("administration/actuIndex");?>
" title=""><?php echo $_smarty_tpl->tpl_vars['lang']->value['Actualite'];?>
</a></li><li><a href="<?php echo getLink("administration/equipeIndex");?>
" title=""><?php echo $_smarty_tpl->tpl_vars['lang']->value['Equipe'];?>
</a></li><li><a href="<?php echo getLink("administration/etabScolaireIndex");?>
" title=""><?php echo $_smarty_tpl->tpl_vars['lang']->value['Etablissement_scolaire'];?>
</a></li><li><a href="<?php echo getLink("administration/matiereIndex");?>
" title=""><?php echo $_smarty_tpl->tpl_vars['lang']->value['Matieres'];?>
</a></li><li><a href="<?php echo getLink("administration/OrganigrammeIndex");?>
" title="">Encadrement</a></li><li><a href="<?php echo getLink("administration/setting");?>
" title=""><?php echo $_smarty_tpl->tpl_vars['lang']->value['Preferences'];?>
</a></li><li><a href="<?php echo getLink("structure");?>
" title=""><?php echo $_smarty_tpl->tpl_vars['lang']->value['Structures'];?>
</a></li><li><a href="<?php echo getLink("administration/programmationTypeIndex");?>
" title=""><?php echo $_smarty_tpl->tpl_vars['lang']->value['Type_de_programmation'];?>
</a></li><li><a href="<?php echo $_smarty_tpl->tpl_vars['Helper']->value->getLink("administration/saisonindex");?>
" title="<?php echo $_smarty_tpl->tpl_vars['lang']->value['Saisons'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Saisons'];?>
</a></li><li class="dropdown-submenu"><a href="" title="" class="dropdown-toggle" data-toggle="dropdown"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Utilisateurs'];?>
</a><ul class="dropdown-menu"><li><a href="<?php echo getLink("administration/userIndex");?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Liste'];?>
</a></li><li><a href="<?php echo getLink("administration/userAdd");?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Nouveau'];?>
</a></li></ul></li><li class="dropdown-submenu"><a href="" title="" class="dropdown-toggle" data-toggle="dropdown">System</a><ul class="dropdown-menu"><li><a href="<?php echo getLink("administration/errorPhpListe");?>
">Errors</a></li><li><a href="<?php echo getLink("administration/connexionListe");?>
">Log acces</a></li><li><a href="<?php echo getLink("administration/resizeImageJoueur");?>
">Resize images</a></li></ul></li></ul></li><li class="dropdown"><a id="notification-icon" class="notifications notification-icon dropdown-toggle" data-toggle="dropdown" href="#"><i class="glyphicon glyphicon-globe"></i><span class="notification-counter" id="notification-counter" style="display: none;">0</span></a><ul id="notification-items" class="dropdown-menu" aria-labelledby="notification-icon"><?php if (isset($_smarty_tpl->tpl_vars['clear_notification']->value)){?><li class="notification-button">Clear notification</li><li class="divider"></li><?php }?><li id="notification-spinner"><img src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
web/lib/notifications/img/loading.gif" alt="Loading" /></li><?php if (isset($_smarty_tpl->tpl_vars['all_notification']->value)){?><li class="divider"></li><li class="notification-button">All notifications</li><?php }?></ul></li><li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-user"></i> <?php if (!empty($_SESSION['utilisateur']['prenom'])){?>&nbsp;<strong><?php echo $_SESSION['utilisateur']['prenom'];?>
</strong><?php }?> <b class="caret"></b></a><ul class="dropdown-menu"><li><a href="<?php echo $_smarty_tpl->tpl_vars['Helper']->value->getLink("utilisateur");?>
" title="Mon compte"><i class="glyphicon glyphicon-user"></i> Profil</a></li><li class="divider"></li><li><a href="<?php echo $_smarty_tpl->tpl_vars['Helper']->value->getLink("tasks/mytasks");?>
" title="Mes tâches"><i class="fa fa-tasks"></i> Tâches</a></li><li><a href="<?php echo $_smarty_tpl->tpl_vars['Helper']->value->getLink("notifications/viewall");?>
" title="Notifications"><i class="fa fa-globe"></i> Notifications</a></li><li class="divider"></li><li><a href="<?php echo $_smarty_tpl->tpl_vars['Helper']->value->getLink("connexion/logout");?>
" title="Deconnexion"><i class="glyphicon glyphicon-off"></i> Deconnexion</a></li></ul></li><?php }?></ul></div><!--/.nav-collapse --></div></div><!-- END navbar header --><!-- Header --><div id="header" style="padding-top:40px;"><div class="container"><div class="pull-left" id="header_left"></div><div class="pull-left" style="margin-left:50px; margin-top:10px;" id="header_center"></div><div class="pull-right" id="header_right"></div><div class="clearfix"></div></div><!-- /container --></div><!-- Contenu --><div class="container"><div class="row-fluid"><div class="span12"><?php echo $_smarty_tpl->tpl_vars['content']->value;?>
</div></div></div><!-- Footer -->
<script type="text/javascript">
$(function (){
   $('a').tooltip();
});
</script>	
</body></html><?php }} ?>