<?php /* Smarty version Smarty-3.1.13, created on 2014-01-21 12:19:39
         compiled from "D:\wamp\www\goliathv2\app\view\joueur\fiche_tab_structure.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2957152de308055c7c8-30034601%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '4b7d21681f56add69611d2b51e9cbe9541febc7e' => 
    array (
      0 => 'D:\\wamp\\www\\goliathv2\\app\\view\\joueur\\fiche_tab_structure.tpl',
      1 => 1390303174,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2957152de308055c7c8-30034601',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_52de3080a0b560_86839689',
  'variables' => 
  array (
    'Joueur' => 0,
    'Helper' => 0,
    'config' => 0,
    'Structure' => 0,
    'lang' => 0,
    'Equipes' => 0,
    'EquipesJoueur' => 0,
    'Row' => 0,
    'Joueurs' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_52de3080a0b560_86839689')) {function content_52de3080a0b560_86839689($_smarty_tpl) {?><!-- START view/joueur/fiche_tab_structure.tpl -->
<div class="pull-right"><a href="<?php echo $_smarty_tpl->tpl_vars['Helper']->value->getLink("joueur/printTabStructureEquipe/".((string)$_smarty_tpl->tpl_vars['Joueur']->value->id)."?nohtml&print");?>
" title="Print" target="_blank"><i class="fa fa-print"></i></a></div><div class="clearfix"></div><?php if ($_smarty_tpl->tpl_vars['config']->value['sport_champ_poste']==1||$_smarty_tpl->tpl_vars['config']->value['sport_champ_selection']==1||$_smarty_tpl->tpl_vars['config']->value['sport_champ_structure']==1){?><?php if (!empty($_smarty_tpl->tpl_vars['Structure']->value)||!empty($_smarty_tpl->tpl_vars['Joueur']->value->poste)||!empty($_smarty_tpl->tpl_vars['Joueur']->value->selection)){?><div><table class="table table-condensed" ><?php if ($_smarty_tpl->tpl_vars['config']->value['sport_champ_poste']==1){?><tr><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Poste'];?>
</th><td><?php echo $_smarty_tpl->tpl_vars['Joueur']->value->poste;?>
</td></tr><?php }?><?php if ($_smarty_tpl->tpl_vars['config']->value['sport_champ_selection']==1){?><tr><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Selection'];?>
</th><td><?php echo $_smarty_tpl->tpl_vars['Joueur']->value->selection;?>
</td></tr><?php }?><?php if ($_smarty_tpl->tpl_vars['config']->value['sport_champ_structure']==1&&!empty($_smarty_tpl->tpl_vars['Structure']->value)){?><tr><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Structure'];?>
</td><td><?php echo $_smarty_tpl->tpl_vars['Structure']->value['nom'];?>
</td></tr><tr><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Adresse'];?>
</th><td><?php echo $_smarty_tpl->tpl_vars['Structure']->value['adresse'];?>
<br/><?php echo $_smarty_tpl->tpl_vars['Structure']->value['code_postal'];?>
 <?php echo $_smarty_tpl->tpl_vars['Structure']->value['ville'];?>
</td></tr><tr><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Telephone'];?>
</th><td><?php echo $_smarty_tpl->tpl_vars['Structure']->value['telephone'];?>
</td></tr><?php if ($_smarty_tpl->tpl_vars['Structure']->value['email']!=''){?><tr><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Email'];?>
</th><td><?php echo $_smarty_tpl->tpl_vars['Structure']->value['email'];?>
</th></tr><?php }?><?php }?></table></div><?php }?><?php }?><?php if (isset($_smarty_tpl->tpl_vars['Equipes']->value)&&count($_smarty_tpl->tpl_vars['Equipes']->value)>0){?><?php if ($_SESSION['acl']['gest_joueur']==1){?><div class="pull-right"><a href="<?php echo $_smarty_tpl->tpl_vars['Helper']->value->getLink("joueur/addInEquipe?joueur_id=".((string)$_smarty_tpl->tpl_vars['Joueur']->value->id)."&nohtml");?>
" title="" id="fbformaddequipe"><i class="fa fa-plus"></i></a></div><?php }?><div class="clearfix"></div><?php if (isset($_smarty_tpl->tpl_vars['EquipesJoueur']->value)&&count($_smarty_tpl->tpl_vars['EquipesJoueur']->value)>0){?><table class="table table-bordered table-striped  table-condensed"><caption><h4><?php echo $_smarty_tpl->tpl_vars['lang']->value['Equipe'];?>
</h4></caption><thead><tr><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Equipe'];?>
</th><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Structure'];?>
</th><?php if ($_SESSION['acl']['gest_joueur']==1){?><th></th><?php }?></tr></thead><tbody><?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['EquipesJoueur']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?><tr><td><a href="<?php echo getLink("equipe/ajaxDetail/".((string)$_smarty_tpl->tpl_vars['Row']->value['id'])."?nohtml");?>
" class="fbequipedetail" title="<?php echo $_smarty_tpl->tpl_vars['Row']->value['nom'];?>
"><?php echo $_smarty_tpl->tpl_vars['Row']->value['nom'];?>
</a></td><td><?php echo $_smarty_tpl->tpl_vars['Row']->value['structure'];?>
</td><?php if ($_SESSION['acl']['gest_joueur']==1){?><td class="center"><a href="javascript:removeForEquipe(<?php echo $_smarty_tpl->tpl_vars['Row']->value['jeid'];?>
);"><img src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
web/images/delete.png" alt="" /></a></td><?php }?></tr><?php } ?></tbody></table><?php }else{ ?><div class="alert alert-info">	<?php echo $_smarty_tpl->tpl_vars['lang']->value['Joueur_inscrit_dans_aucune_equipe'];?>
</div><?php }?><?php }?><?php if ($_smarty_tpl->tpl_vars['config']->value['view_joueur_club']==true&&$_smarty_tpl->tpl_vars['config']->value['sport_champ_structure']==1&&!empty($_smarty_tpl->tpl_vars['Joueurs']->value)){?><div><table class="table table-bordered table-condensed table-striped"><caption><h4><?php echo $_smarty_tpl->tpl_vars['lang']->value['Joueurs_dans_la_meme_stucture'];?>
</h4></caption><thead><th>#</td><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Nom'];?>
</th><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Prenom'];?>
</th></thead><tbody><?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Joueurs']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?><tr><td><?php if ($_SESSION['acl']['view_all_fiche']==true){?><a href="<?php echo getLink("joueur/fiche/".((string)$_smarty_tpl->tpl_vars['Row']->value['id']));?>
"><?php }?><?php echo $_smarty_tpl->tpl_vars['Row']->value['id'];?>
<?php if ($_SESSION['acl']['view_all_fiche']==true){?></a><?php }?></td><td><?php echo $_smarty_tpl->tpl_vars['Row']->value['nom'];?>
</td><td><?php echo $_smarty_tpl->tpl_vars['Row']->value['prenom'];?>
</td></tr><?php } ?></tbody></table></div><?php }?><div id="diag-form-equipe"></div>
<script type="text/javascript">
<!--
$(document).ready(function() {
    $("a#fbformaddequipe").fancybox();
    $("a.fbequipedetail").fancybox();
});

<?php if ($_SESSION['acl']['gest_joueur']==1){?>
function removeForEquipe(jeid){
	window.location.href = '<?php echo getLink("equipe/removeJoueurEquipe/'+ jeid +'");?>
';
}
<?php }?>
//-->
</script>
<!-- END view/joueur/fiche_tab_structure.tpl --><?php }} ?>