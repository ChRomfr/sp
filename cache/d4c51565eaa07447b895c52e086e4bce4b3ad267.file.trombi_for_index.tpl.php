<?php /* Smarty version Smarty-3.1.13, created on 2014-01-20 15:35:58
         compiled from "D:\wamp\www\goliathv2\app\view\joueur\trombi_for_index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1440452dd344e279ae6-76606504%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'd4c51565eaa07447b895c52e086e4bce4b3ad267' => 
    array (
      0 => 'D:\\wamp\\www\\goliathv2\\app\\view\\joueur\\trombi_for_index.tpl',
      1 => 1361032765,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1440452dd344e279ae6-76606504',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'lang' => 0,
    'Joueurs' => 0,
    'Joueur' => 0,
    'config' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_52dd344e4786d9_52641379',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_52dd344e4786d9_52641379')) {function content_52dd344e4786d9_52641379($_smarty_tpl) {?><div class="well">
	<h1><?php echo $_smarty_tpl->tpl_vars['lang']->value['Joueurs'];?>
</h1>
	<table class="table">
		<tr>
			<?php  $_smarty_tpl->tpl_vars['Joueur'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Joueur']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Joueurs']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['foo']['iteration']=0;
foreach ($_from as $_smarty_tpl->tpl_vars['Joueur']->key => $_smarty_tpl->tpl_vars['Joueur']->value){
$_smarty_tpl->tpl_vars['Joueur']->_loop = true;
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['foo']['iteration']++;
?>
			<td class="center">
				<a href="<?php echo getLink("joueur/fiche/".((string)$_smarty_tpl->tpl_vars['Joueur']->value['id']));?>
" title="">
				<?php if (isset($_smarty_tpl->tpl_vars['Joueur']->value['photo_id'])){?>
					<img src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
web/upload/joueurs/<?php echo $_smarty_tpl->tpl_vars['Joueur']->value['id'];?>
/photo_id/<?php echo $_smarty_tpl->tpl_vars['Joueur']->value['photo_id'];?>
" style="width:100px;" /><br/><?php echo $_smarty_tpl->tpl_vars['Joueur']->value['nom'];?>
 <?php echo $_smarty_tpl->tpl_vars['Joueur']->value['prenom'];?>

				<?php }else{ ?>
					<img src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
web/images/avatar/no_image.jpg" style="width:100px;" /><br/><?php echo $_smarty_tpl->tpl_vars['Joueur']->value['nom'];?>
 <?php echo $_smarty_tpl->tpl_vars['Joueur']->value['prenom'];?>

				<?php }?>
				</a>
			</td>
			<?php if ($_smarty_tpl->getVariable('smarty')->value['foreach']['foo']['iteration']%5==0){?></tr><tr><?php }?>
			<?php } ?>
		</tr>
	</table>
</div><?php }} ?>