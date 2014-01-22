<?php /* Smarty version Smarty-3.1.13, created on 2014-01-21 12:05:49
         compiled from "D:\wamp\www\goliathv2\app\view\entrainement\entrainement_detail.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2221152de548d1e32a9-24791026%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'b055c9ecf5d4b7c498a0b50b82150833bc9ce1f6' => 
    array (
      0 => 'D:\\wamp\\www\\goliathv2\\app\\view\\entrainement\\entrainement_detail.tpl',
      1 => 1368012663,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2221152de548d1e32a9-24791026',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'lang' => 0,
    'Entrainement' => 0,
    'config' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_52de548d355514_74212562',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_52de548d355514_74212562')) {function content_52de548d355514_74212562($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include 'D:\\wamp\\www\\goliathv2\\kernel\\lib\\smarty\\plugins\\modifier.date_format.php';
?><div class="well">
<?php if (isset($_GET['joueur_id'])){?>

<table class="table table-stripped">
	<tr>
		<td><?php echo $_smarty_tpl->tpl_vars['lang']->value['Date'];?>
 :</td>
		<td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['Entrainement']->value['date_entrainement'],$_smarty_tpl->tpl_vars['config']->value['format_date_day']);?>
</td>
	</tr>
	<tr>
		<td><?php echo $_smarty_tpl->tpl_vars['lang']->value['Entrainement'];?>
 :</td>
		<td><?php echo nl2br($_smarty_tpl->tpl_vars['Entrainement']->value['description']);?>
</td>
	</tr>
	<tr>
		<td><?php echo $_smarty_tpl->tpl_vars['lang']->value['Presence'];?>
 :</td>
		<td><?php echo $_smarty_tpl->tpl_vars['Entrainement']->value['presence'];?>
</td>
	</tr>
	<tr>
		<td><?php echo $_smarty_tpl->tpl_vars['lang']->value['Suivi'];?>
 :</td>
		<td><?php echo nl2br($_smarty_tpl->tpl_vars['Entrainement']->value['suivi']);?>
</td>
	</tr>
	<?php if (!empty($_smarty_tpl->tpl_vars['Entrainement']->value['cycle'])){?>
	<tr>
		<td><?php echo $_smarty_tpl->tpl_vars['lang']->value['Cycle'];?>
 :</td>
		<td><?php echo $_smarty_tpl->tpl_vars['Entrainement']->value['cycle'];?>
</td>
	</tr>
	<?php }?>
</table>
<?php }else{ ?>

<?php }?>
</div><?php }} ?>