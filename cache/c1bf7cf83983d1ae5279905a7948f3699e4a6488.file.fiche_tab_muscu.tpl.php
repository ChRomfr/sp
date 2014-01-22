<?php /* Smarty version Smarty-3.1.13, created on 2014-01-21 12:02:07
         compiled from "D:\wamp\www\goliathv2\app\view\joueur\fiche_tab_muscu.tpl" */ ?>
<?php /*%%SmartyHeaderCode:41352de53af604777-23034285%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'c1bf7cf83983d1ae5279905a7948f3699e4a6488' => 
    array (
      0 => 'D:\\wamp\\www\\goliathv2\\app\\view\\joueur\\fiche_tab_muscu.tpl',
      1 => 1360798477,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '41352de53af604777-23034285',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'lang' => 0,
    'Cycles' => 0,
    'Data' => 0,
    'config' => 0,
    'joueur_id' => 0,
    'Seances' => 0,
    'Row' => 0,
    'HTML_TABLE' => 0,
    'Exercices' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_52de53af99a881_95528641',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_52de53af99a881_95528641')) {function content_52de53af99a881_95528641($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include 'D:\\wamp\\www\\goliathv2\\kernel\\lib\\smarty\\plugins\\modifier.date_format.php';
?><script type="text/javascript">
<!--
$(function() {
    $('a.fbdetailseance').fancybox();
});

function deleteSeance(sid){
	if( confirm('<?php echo $_smarty_tpl->tpl_vars['lang']->value['Confirm_suppression_seance'];?>
 ?') ){
		$.get(
				'<?php echo getLink("muscu/deleteSeanceById/'+ sid +'");?>
',
				{nohtml:'nohtml'},
				function(data){}
			)
		

		$("tr#"+sid).remove();
	}
}
-->
</script>
<!-- CYCLE START --><div class="well"><table class="table table-bordered table-striped table-condensed"><caption><h4><?php echo $_smarty_tpl->tpl_vars['lang']->value['Cycles'];?>
</h4></caption><thead><tr><th>#</th><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Cycle'];?>
</th><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Date_debut'];?>
</th><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Date_fin'];?>
</th></tr></thead><tbody><?php  $_smarty_tpl->tpl_vars['Data'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Data']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Cycles']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Data']->key => $_smarty_tpl->tpl_vars['Data']->value){
$_smarty_tpl->tpl_vars['Data']->_loop = true;
?><tr><td><?php echo $_smarty_tpl->tpl_vars['Data']->value['id'];?>
</td><td><?php echo $_smarty_tpl->tpl_vars['Data']->value['nom'];?>
</td><td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['Data']->value['date_debut'],$_smarty_tpl->tpl_vars['config']->value['format_date_day']);?>
</td><td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['Data']->value['date_fin'],$_smarty_tpl->tpl_vars['config']->value['format_date_day']);?>
</td></tr><?php } ?></tbody></table></div><!-- CYCLE END --><!-- SEANCES START --><?php if ($_SESSION['acl']['gest_muscu']==true){?><div class="fright"><a href="<?php echo getLink("muscu/addSeanceByJoueurId/".((string)$_smarty_tpl->tpl_vars['joueur_id']->value));?>
" title=""><img src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
web/images/add.png" alt="" /></a></div><?php }?><div class="well"><div style="clear:both;"></div><table class="table table-bordered table-striped table-condensed"><caption><h4><?php echo $_smarty_tpl->tpl_vars['lang']->value['Seances'];?>
</h4></caption><thead><tr><th>#</th><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Date'];?>
</th><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Cycle'];?>
</th><?php if ($_SESSION['acl']['gest_muscu']==true){?><th></th><?php }?></tr></thead><tbody><?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Seances']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?><tr id="s_<?php echo $_smarty_tpl->tpl_vars['Row']->value['id'];?>
"><td><a href="<?php echo getLink("muscu/getExerciceBySeanceId/".((string)$_smarty_tpl->tpl_vars['Row']->value['id'])."?nohtml");?>
" title="" class="fbdetailseance"><?php echo $_smarty_tpl->tpl_vars['Row']->value['id'];?>
</a></td><td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['Row']->value['date_seance'],$_smarty_tpl->tpl_vars['config']->value['format_date_day']);?>
</td><td><?php echo $_smarty_tpl->tpl_vars['Row']->value['cycle'];?>
</td><?php if ($_SESSION['acl']['gest_muscu']==true){?><td class="center"><a href="javascript:deleteSeance('s_<?php echo $_smarty_tpl->tpl_vars['Row']->value['id'];?>
')"><img src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
web/images/delete.png" alt=""/></a></td><?php }?></tr><?php } ?></tbody></table></div><!-- SEANCES END -->

<script>
    $(document).ready(function() 
    { 
        $("#tableau_test").tablesorter({
            dateFormat: "uk",
            headers: {0: {sorter: "shortDate"}},
            sortList: [[0,1]]
        }); 
    } 
);
 
</script>

<div class="well">
	<h1><?php echo $_smarty_tpl->tpl_vars['lang']->value['Tests'];?>
</h1>
	
	<?php echo $_smarty_tpl->tpl_vars['HTML_TABLE']->value;?>

	<div class="fright">
		<a href="javascript:showid('graph_conteneur');" title=""><img src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
web/images/graph.png" style="height:24px;" /></a>
	</div>
	<div class="clear"></div>
	
	
	<div id="graph_conteneur" style="display:none;">
	<?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Exercices']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?>
		<div><img src="<?php echo getLink("muscu/graph?nohtml&joueur=".((string)$_smarty_tpl->tpl_vars['joueur_id']->value)."&exercice=".((string)$_smarty_tpl->tpl_vars['Row']->value['exercice_id']));?>
" alt="" /></div>
	<?php } ?>
	</div>	
</div><?php }} ?>