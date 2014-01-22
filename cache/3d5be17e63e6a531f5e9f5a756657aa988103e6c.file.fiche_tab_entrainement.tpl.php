<?php /* Smarty version Smarty-3.1.13, created on 2014-01-21 12:05:37
         compiled from "D:\wamp\www\goliathv2\app\view\joueur\fiche_tab_entrainement.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1384252de5481531ef0-65042018%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '3d5be17e63e6a531f5e9f5a756657aa988103e6c' => 
    array (
      0 => 'D:\\wamp\\www\\goliathv2\\app\\view\\joueur\\fiche_tab_entrainement.tpl',
      1 => 1368012002,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1384252de5481531ef0-65042018',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'joueur_id' => 0,
    'Helper' => 0,
    'lang' => 0,
    'Entrainements' => 0,
    'Row' => 0,
    'config' => 0,
    'Cycles' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_52de548189a2b3_27558394',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_52de548189a2b3_27558394')) {function content_52de548189a2b3_27558394($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include 'D:\\wamp\\www\\goliathv2\\kernel\\lib\\smarty\\plugins\\modifier.date_format.php';
?><!-- LIEN IMPRESSION --><?php if (!isset($_GET['printer'])){?><div class="fright"><?php if (isset($_GET['type'])){?><a href="<?php echo $_smarty_tpl->tpl_vars['Helper']->value->getLink("joueur/getEntrainementInfo/".((string)$_smarty_tpl->tpl_vars['joueur_id']->value)."?printer&sportifinfo&sportif_id=".((string)$_smarty_tpl->tpl_vars['joueur_id']->value)."&type=".((string)$_GET['type']));?>
" title="Print" target="_blank"><i class="icon-print"></i></a><?php }else{ ?><a href="<?php echo $_smarty_tpl->tpl_vars['Helper']->value->getLink("joueur/getEntrainementInfo/".((string)$_smarty_tpl->tpl_vars['joueur_id']->value)."?printer&sportifinfo&sportif_id=".((string)$_smarty_tpl->tpl_vars['joueur_id']->value));?>
" title="Print" target="_blank"><i class="icon-print"></i></a><?php }?></div><div class="clear"></div><?php }?><div class="well"><table class="table table-bordered table-striped  table-condensed"><caption><h4><?php echo $_smarty_tpl->tpl_vars['lang']->value['Entrainements'];?>
</h4><thead><tr><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Date'];?>
</th><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Presence'];?>
</th><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Entrainement'];?>
</th><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Cycle'];?>
</th></tr></thead><tbody><?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Entrainements']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?><?php if ($_smarty_tpl->tpl_vars['Row']->value['presence']!=''){?><tr><td style="width:15%"><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['Row']->value['date_entrainement'],$_smarty_tpl->tpl_vars['config']->value['format_date_day']);?>
</td><td style="width:15%"><?php echo $_smarty_tpl->tpl_vars['Row']->value['presence'];?>
</td><td style="width:50%"><a href="<?php echo getLink("entrainement/entrainementDetail/".((string)$_smarty_tpl->tpl_vars['Row']->value['entrainement_id'])."?joueur_id=".((string)$_smarty_tpl->tpl_vars['Row']->value['joueur_id'])."&nohtml");?>
" title="" class="fbdetailentrainement"><?php echo nl2br($_smarty_tpl->tpl_vars['Row']->value['description']);?>
</a></td><td style="width:20%"><?php echo $_smarty_tpl->tpl_vars['Row']->value['cycle'];?>
</td></tr><?php }?><?php } ?></tbody></table></div><!-- CYCLES --><div class="well"><?php if (@constant('USE_ENTRAINEMENT_CYCLE')==true&&$_SESSION['acl']['gest_entrainement']==1&&$_SESSION['acl']['gest_joueur']==1){?><div class="fright"><?php if (!isset($_GET['printer'])){?><a href="<?php echo getLink("entrainement/addCycle/".((string)$_smarty_tpl->tpl_vars['joueur_id']->value)."?nohtml");?>
" title="<?php echo $_smarty_tpl->tpl_vars['lang']->value['Nouveau_cycle'];?>
" id="fbformaddcycle"><i class="icon-plus"></i></a><?php }?></div><?php }?><div style="clear:both"></div><table class="table table-bordered table-striped  table-condensed"><caption><h4><?php echo $_smarty_tpl->tpl_vars['lang']->value['Cycles'];?>
</h4></caption><thead><tr><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Date_debut'];?>
</th><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Date_fin'];?>
</th><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Cycle'];?>
</th><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Nombre_entrainement'];?>
</th></tr></thead><tbody><?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Cycles']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?><tr><td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['Row']->value['date_debut'],$_smarty_tpl->tpl_vars['config']->value['format_date_day']);?>
</td><td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['Row']->value['date_fin'],$_smarty_tpl->tpl_vars['config']->value['format_date_day']);?>
</td><td><a href="<?php echo getLink("entrainement/cycleDetail/".((string)$_smarty_tpl->tpl_vars['Row']->value['id'])."?nohtml");?>
" title="" class="fbdetailcyle"><?php echo $_smarty_tpl->tpl_vars['Row']->value['nom'];?>
</a></td><td><?php echo $_smarty_tpl->tpl_vars['Row']->value['NbEntrainement'];?>
</td></tr><?php } ?></tbody></table></div>

<script type="text/javascript">
<!--

$(document).ready(function() {
    $("a#fbformaddcycle").fancybox();
    $("a.fbdetailcyle").fancybox();
    $('a.fbdetailentrainement').fancybox();
});

//-->
</script><?php }} ?>