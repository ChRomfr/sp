<?php /* Smarty version Smarty-3.1.13, created on 2014-01-21 12:15:59
         compiled from "D:\wamp\www\goliathv2\app\view\joueur\fiche.tpl" */ ?>
<?php /*%%SmartyHeaderCode:3128252de307d2c8168-83509191%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '95d506d6a4d238142605b0ea91b3041779ca8847' => 
    array (
      0 => 'D:\\wamp\\www\\goliathv2\\app\\view\\joueur\\fiche.tpl',
      1 => 1390302956,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '3128252de307d2c8168-83509191',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_52de307de2fba1_91983538',
  'variables' => 
  array (
    'Helper' => 0,
    'lang' => 0,
    'Joueur' => 0,
    'config' => 0,
    'Site' => 0,
    'Structure' => 0,
    'module' => 0,
    'Exercices' => 0,
    'Row' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_52de307de2fba1_91983538')) {function content_52de307de2fba1_91983538($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include 'D:\\wamp\\www\\goliathv2\\kernel\\lib\\smarty\\plugins\\modifier.date_format.php';
?><!-- START view/joueur/fiche.tpl -->
<ol class="breadcrumb"><li><a href="<?php echo $_smarty_tpl->tpl_vars['Helper']->value->getLink("index");?>
" title="<?php echo $_smarty_tpl->tpl_vars['lang']->value['Accueil'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Accueil'];?>
</a></li><li><a href="<?php echo $_smarty_tpl->tpl_vars['Helper']->value->getLink("joueur");?>
" title="<?php echo $_smarty_tpl->tpl_vars['lang']->value['Joueurs'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Joueurs'];?>
</a></li><li class="active"><?php echo $_smarty_tpl->tpl_vars['Joueur']->value['nom'];?>
 <?php echo $_smarty_tpl->tpl_vars['Joueur']->value['prenom'];?>
</li></ol><div class="well"><div class="pull-right"><?php if ($_SESSION['acl']['gest_joueur']==true){?><a href="<?php echo $_smarty_tpl->tpl_vars['Helper']->value->getLink("joueur/edit/".((string)$_smarty_tpl->tpl_vars['Joueur']->value['id']));?>
" title=""><i class="fa fa-edit fa-lg"></i></a>&nbsp;&nbsp;<a href="javascript:deleteJoueur(<?php echo $_smarty_tpl->tpl_vars['Joueur']->value['id'];?>
)" title="<?php echo $_smarty_tpl->tpl_vars['lang']->value['Supprimer'];?>
"><i class="fa fa-trash-o fa-lg"></i></a><?php }?></div><div class="clearfix"></div><div class="container"><h1><?php echo $_smarty_tpl->tpl_vars['Joueur']->value['prenom'];?>
 <?php echo $_smarty_tpl->tpl_vars['Joueur']->value['nom'];?>
</h1><div style="height:5px;"></div><div class="row"><?php if (!empty($_smarty_tpl->tpl_vars['Joueur']->value['photo_id'])){?><div class="col-md-4"><div class="center"><img src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
web/upload/joueurs/<?php echo $_smarty_tpl->tpl_vars['Joueur']->value['id'];?>
/photo_id/<?php echo $_smarty_tpl->tpl_vars['Joueur']->value['photo_id'];?>
" style="width:150px;" /></div></div><?php }?><?php if (!empty($_smarty_tpl->tpl_vars['Joueur']->value['photo_id'])){?><div class="col-md-7"><?php }else{ ?><div class="col-md-11"><?php }?><table class="table table-condensed"><?php if ($_smarty_tpl->tpl_vars['config']->value['multi_site']==1){?><tr><td><?php echo $_smarty_tpl->tpl_vars['lang']->value['Site'];?>
 :</td><td><?php echo $_smarty_tpl->tpl_vars['Site']->value['nom'];?>
</td></tr><?php }?><tr><td><?php echo $_smarty_tpl->tpl_vars['lang']->value['Nom'];?>
 :</td><td><?php echo $_smarty_tpl->tpl_vars['Joueur']->value['nom'];?>
</td></tr><tr><td><?php echo $_smarty_tpl->tpl_vars['lang']->value['Prenom'];?>
 :</td><td><?php echo $_smarty_tpl->tpl_vars['Joueur']->value['prenom'];?>
</td></tr><tr><td><?php echo $_smarty_tpl->tpl_vars['lang']->value['Date_de_naissance'];?>
 :</td><td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['Joueur']->value['date_naissance'],$_smarty_tpl->tpl_vars['config']->value['format_date_day']);?>
</td></tr><tr><td><?php echo $_smarty_tpl->tpl_vars['lang']->value['Lieu_de_naissance'];?>
 :</td><td><?php echo $_smarty_tpl->tpl_vars['Joueur']->value['lieu_naissance'];?>
</td></tr><tr><td><?php echo $_smarty_tpl->tpl_vars['lang']->value['Adresse'];?>
</td><td><?php echo $_smarty_tpl->tpl_vars['Joueur']->value['adresse'];?>
<br/><?php echo $_smarty_tpl->tpl_vars['Joueur']->value['code_postal'];?>
 <?php echo $_smarty_tpl->tpl_vars['Joueur']->value['ville'];?>
</td></tr><tr><td><?php echo $_smarty_tpl->tpl_vars['lang']->value['Contact'];?>
</td><td><ul class="unstyled"><?php if ($_smarty_tpl->tpl_vars['Joueur']->value['telephone']!=''){?><li><?php echo $_smarty_tpl->tpl_vars['Joueur']->value['telephone'];?>
</li><?php }?><?php if ($_smarty_tpl->tpl_vars['Joueur']->value['portable']!=''){?><li><?php echo $_smarty_tpl->tpl_vars['Joueur']->value['portable'];?>
</li><?php }?><?php if ($_smarty_tpl->tpl_vars['Joueur']->value['email']!=''){?><li><a href="mailto:<?php echo $_smarty_tpl->tpl_vars['Joueur']->value['email'];?>
"><?php echo $_smarty_tpl->tpl_vars['Joueur']->value['email'];?>
</a></li><?php }?></ul></td></tr><?php if ($_smarty_tpl->tpl_vars['config']->value['sport_champ_structure']==1){?><tr><td><?php echo $_smarty_tpl->tpl_vars['lang']->value['Structure'];?>
 :</td><td><a href="javascript:showTab(1)" title=""><?php echo $_smarty_tpl->tpl_vars['Structure']->value['nom'];?>
</a></td></tr><?php }?><?php if ($_smarty_tpl->tpl_vars['Joueur']->value['taille']!=''){?><tr><td><?php echo $_smarty_tpl->tpl_vars['lang']->value['Taille'];?>
 :</td><td><?php echo $_smarty_tpl->tpl_vars['Joueur']->value['taille'];?>
 cm</td></tr><?php }?><?php if ($_smarty_tpl->tpl_vars['Joueur']->value['poids']!=''){?><tr><td><?php echo $_smarty_tpl->tpl_vars['lang']->value['Poids'];?>
 :</td><td><?php echo $_smarty_tpl->tpl_vars['Joueur']->value['poids'];?>
 kg</td></tr><?php }?><tr><td><?php echo $_smarty_tpl->tpl_vars['lang']->value['Date_entree'];?>
 :</td><td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['Joueur']->value['date_entree'],$_smarty_tpl->tpl_vars['config']->value['format_date_day']);?>
</td></tr><?php if ($_smarty_tpl->tpl_vars['Joueur']->value['date_sortie']>0){?><tr><td><?php echo $_smarty_tpl->tpl_vars['lang']->value['Date_de_sortie'];?>
 :</td><td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['Joueur']->value['date_sortie'],$_smarty_tpl->tpl_vars['config']->value['format_date_day']);?>
</td></tr><?php }?></table></div><!-- /col-md-xx --></div><!-- /row --></div><!-- /container --><hr/><!-- Tabs --><!-- <div class="container"><div class="row"><div class="col-md-11"> --><ul id="myTab" class="nav nav-tabs"><li class="active"><a href="#tabstructure" data-toggle="tab"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Structure'];?>
/<?php echo $_smarty_tpl->tpl_vars['lang']->value['Equipe'];?>
</a></li><?php if ($_smarty_tpl->tpl_vars['config']->value['joueur_suivi_scolaire']==1){?><li><a href="#tabscolaire" data-toggle="tab"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Scolaire'];?>
</a></li><?php }?><li><a href="#tabmorphologie" data-toggle="tab"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Morphologie'];?>
</a></li><?php if ($_smarty_tpl->tpl_vars['config']->value['entrainement_type']==1){?><li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Entrainements'];?>
<b class="caret"></b></a><ul class="dropdown-menu"><li><a href="#tabentrainementphysique" data-toggle="tab"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Physique'];?>
</a></li><li><a href="#tabentrainementtechnique" data-toggle="tab"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Tactique_technique'];?>
</a></li></ul></li><?php }else{ ?><li><a href="#tabentrainement" data-toggle="tab"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Entrainements'];?>
</a></li><?php }?><?php if ($_SESSION['acl']['view_suivimed']==1){?><li><a href="#tabmedical" data-toggle="tab"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Medical'];?>
</a></li><?php }?><li><a href="#tabmusculation" data-toggle="tab"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Musculation'];?>
</a></li><li><a href="#tabtests" data-toggle="tab"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Tests'];?>
</a></li><li><a href="#tabressenti" data-toggle="tab"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Ressenti'];?>
</a></li><li><a href="#tabdocuments" data-toggle="tab"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Documents'];?>
</a></li><?php  $_smarty_tpl->tpl_vars['module'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['module']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['config']->value['modules']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['module']->key => $_smarty_tpl->tpl_vars['module']->value){
$_smarty_tpl->tpl_vars['module']->_loop = true;
?><?php if ($_smarty_tpl->tpl_vars['module']->value['m_view_in_fiche']==1){?><li><a href="#tab<?php echo $_smarty_tpl->tpl_vars['module']->value['m_module'];?>
" data-toggle="tab"><?php echo $_smarty_tpl->tpl_vars['module']->value['m_name'];?>
</a></li><?php }?><?php } ?><li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">+<b class="caret"></b></a><ul class="dropdown-menu"><li><a href="#tabplus" data-toggle="tab">Infos</a></li><li><a href="#tabparents" data-toggle="tab"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Environnement_familiale'];?>
</a></li></ul></li></ul><div class="tab-content"><div class="tab-pane active" id="tabstructure" ></div><div class="tab-pane" id="tabmorphologie"></div><?php if ($_smarty_tpl->tpl_vars['config']->value['joueur_suivi_scolaire']==1){?><div class="tab-pane" id="tabscolaire"></div><?php }?><?php if ($_smarty_tpl->tpl_vars['config']->value['entrainement_type']==1){?><div class="tab-pane" id="tabentrainementphysique"></div><div class="tab-pane" id="tabentrainementtechnique"></div><?php }else{ ?><div class="tab-pane" id="tabentrainement"></div><?php }?><?php if ($_SESSION['acl']['view_suivimed']==1){?><div class="tab-pane" id="tabmedical"></div><?php }?><div class="tab-pane" id="tabmusculation"></div><div class="tab-pane" id="tabtests"></div><div class="tab-pane" id="tabressenti"></div><div class="tab-pane" id="tabdocuments"></div><?php  $_smarty_tpl->tpl_vars['module'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['module']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['config']->value['modules']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['module']->key => $_smarty_tpl->tpl_vars['module']->value){
$_smarty_tpl->tpl_vars['module']->_loop = true;
?><?php if ($_smarty_tpl->tpl_vars['module']->value['m_view_in_fiche']==1){?><div class="tab-pane" id="tab<?php echo $_smarty_tpl->tpl_vars['module']->value['m_module'];?>
"></div><?php }?><?php } ?><div class="tab-pane" id="tabplus"></div><div class="tab-pane" id="tabparents"></div></div><!-- /tab-content --><!-- </div> --><!-- </div></div></div> --></div><!-- /well -->
<!-- Requete AJAX DE RECUPERATION DES TABS -->
<script type="text/javascript">
<!--
	// Structure
	$.get(
		'<?php echo getLink("joueur/getStructureInfo/".((string)$_smarty_tpl->tpl_vars['Joueur']->value['id']));?>
',
		{nohtml:'nohtml'},
		function(data){ $('#tabstructure').html(data); }
	);

	// Morphologique
	$.get(
		'<?php echo getLink("joueur/getPhysiqueInfo/".((string)$_smarty_tpl->tpl_vars['Joueur']->value['id']));?>
',
		{nohtml:'nohtml'},
		function(data){ $('#tabmorphologie').html(data); }
	);

	<?php if ($_smarty_tpl->tpl_vars['config']->value['joueur_suivi_scolaire']==1){?>
	// Scolaire
	$.get(
		'<?php echo getLink("joueur/getEtabInfo/".((string)$_smarty_tpl->tpl_vars['Joueur']->value['id']));?>
',
		{nohtml:'nohtml'},
		function(data){ $('#tabscolaire').html(data); }
	);
	<?php }?>
	
	<?php if ($_smarty_tpl->tpl_vars['config']->value['entrainement_type']==1){?>
	// Entrainement physique
	$.get(
		'<?php echo getLink("joueur/getEntrainementInfo/".((string)$_smarty_tpl->tpl_vars['Joueur']->value['id']));?>
',
		{nohtml:'nohtml',type:'2'},
		function(data){ $('#tabentrainementphysique').html(data); }
	);

	// Entrainement technique
	$.get(
		'<?php echo getLink("joueur/getEntrainementInfo/".((string)$_smarty_tpl->tpl_vars['Joueur']->value['id']));?>
',
		{nohtml:'nohtml',type:'1'},
		function(data){ $('#tabentrainementtechnique').html(data); }
	);
	<?php }else{ ?>
	$.get(
		'<?php echo getLink("joueur/getEntrainementInfo/".((string)$_smarty_tpl->tpl_vars['Joueur']->value['id']));?>
',
		{nohtml:'nohtml'},
		function(data){ $('#tabentrainement').html(data); }
	);
	<?php }?>

	<?php if ($_SESSION['acl']['view_suivimed']==1){?>
	$.get(
		'<?php echo getLink("joueur/getSuiviMedical/".((string)$_smarty_tpl->tpl_vars['Joueur']->value['id']));?>
',
		{nohtml:'nohtml'},
		function(data){ $('#tabmedical').html(data); }
	);
	<?php }?>

	$.get(
		'<?php echo getLink("joueur/getMuscuInfo/".((string)$_smarty_tpl->tpl_vars['Joueur']->value['id']));?>
',
		{nohtml:'nohtml'},
		function(data){ $('#tabmusculation').html(data); }
	);
	
	// Test physique
	$.get(
		'<?php echo getLink("joueur/getTestInfo/".((string)$_smarty_tpl->tpl_vars['Joueur']->value['id']));?>
',
		{nohtml:'nohtml'},
		function(data){ $('#tabtests').html(data); }
	);

	$.get(
		'<?php echo getLink("joueur/getTabRessentie/".((string)$_smarty_tpl->tpl_vars['Joueur']->value['id']));?>
',
		{nohtml:'nohtml'},
		function(data){ $('#tabressenti').html(data); }
	);

	$.get(
		'<?php echo getLink("joueur/getDocuments/".((string)$_smarty_tpl->tpl_vars['Joueur']->value['id']));?>
',
		{nohtml:'nohtml'},
		function(data){ $('#tabdocuments').html(data); }
	);

	$.get(
		'<?php echo getLink("joueur/getChampPlus/".((string)$_smarty_tpl->tpl_vars['Joueur']->value['id']));?>
',
		{nohtml:'nohtml'},
		function(data){ $('#tabplus').html(data); }
	);

	<?php  $_smarty_tpl->tpl_vars['module'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['module']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['config']->value['modules']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['module']->key => $_smarty_tpl->tpl_vars['module']->value){
$_smarty_tpl->tpl_vars['module']->_loop = true;
?>
		<?php if ($_smarty_tpl->tpl_vars['module']->value['m_view_in_fiche']==1){?>
		$.get(
			'<?php echo getLink(((string)$_smarty_tpl->tpl_vars['module']->value['m_module'])."/tabFiche?joueur_id=".((string)$_smarty_tpl->tpl_vars['Joueur']->value['id']));?>
',
			{nohtml:'nohtml'},
			function(data){ $('#tab<?php echo $_smarty_tpl->tpl_vars['module']->value['m_module'];?>
').html(data); }
		);
		<?php }?>
	<?php } ?>

	$.get(
		'<?php echo getLink("paren/tabFiche/".((string)$_smarty_tpl->tpl_vars['Joueur']->value['id']));?>
',
		{nohtml:'nohtml'},
		function(data){ $('#tabparents').html(data); }
	);

$('a[href="#tabmorphologie"]').on('shown', function (e) {
  e.target // activated tab
  e.relatedTarget // previous tab

  // Taille
  $.get(
		'<?php echo getLink("joueur/ajaxGetTailleData/".((string)$_smarty_tpl->tpl_vars['Joueur']->value['id']));?>
', 
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
	

  // Poids
  $.get(
		'<?php echo getLink("joueur/ajaxGetPoidsData/".((string)$_smarty_tpl->tpl_vars['Joueur']->value['id']));?>
', 
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
	


	// Img
	$.get(
		'<?php echo getLink("joueur/ajaxGetImgData/".((string)$_smarty_tpl->tpl_vars['Joueur']->value['id']));?>
', 
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
	
});

<?php if (!empty($_smarty_tpl->tpl_vars['Exercices']->value)){?>
$('a[href="#tabtests"]').on('shown', function (e) {
  e.target // activated tab
  e.relatedTarget // previous tab
  <?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Exercices']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?>
  	
  	$.get(
		'<?php echo getLink("test/ajaxGetExerciceData");?>
',{
			eid : '<?php echo $_smarty_tpl->tpl_vars['Row']->value['exercice_id'];?>
',
			jid : '<?php echo $_smarty_tpl->tpl_vars['Joueur']->value['id'];?>
',
			nohtml:'nohtml'
		},  
		function(data){
			
			if(data[0].length !== 0){
				
				var plot1 = $.jqplot ('testgraphexo<?php echo $_smarty_tpl->tpl_vars['Row']->value['exercice_id'];?>
', [data[0]],{
					title: '<?php echo $_smarty_tpl->tpl_vars['Row']->value['TE_NOM'];?>
',
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
	
  <?php } ?>
});
<?php }?>
//-->
</script><?php }} ?>