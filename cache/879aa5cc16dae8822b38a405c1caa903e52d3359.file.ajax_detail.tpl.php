<?php /* Smarty version Smarty-3.1.13, created on 2014-01-21 12:18:53
         compiled from "D:\wamp\www\goliathv2\app\view\equipe\ajax_detail.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2489452de579dd91c36-74675550%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '879aa5cc16dae8822b38a405c1caa903e52d3359' => 
    array (
      0 => 'D:\\wamp\\www\\goliathv2\\app\\view\\equipe\\ajax_detail.tpl',
      1 => 1353773448,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2489452de579dd91c36-74675550',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'lang' => 0,
    'Equipe' => 0,
    'Joueurs' => 0,
    'Row' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_52de579de78024_29190417',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_52de579de78024_29190417')) {function content_52de579de78024_29190417($_smarty_tpl) {?><div class="showData">
	<h1><?php echo $_smarty_tpl->tpl_vars['lang']->value['Sportif_dans_l_equipe'];?>
 <?php echo $_smarty_tpl->tpl_vars['Equipe']->value['nom'];?>
</h1>
	<table class="tadmin">
		<thead>
			<tr>
				<td><?php echo $_smarty_tpl->tpl_vars['lang']->value['Sportif'];?>
</td>
			</tr>
		</thead>
		<tbody>
			<?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Joueurs']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?>
			<tr>
				<td><?php echo $_smarty_tpl->tpl_vars['Row']->value['prenom'];?>
 <?php echo $_smarty_tpl->tpl_vars['Row']->value['nom'];?>
</td>
			</tr>
			<?php } ?>
		</tbody>
	</table>
</div><?php }} ?>