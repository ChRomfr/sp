<?php /* Smarty version Smarty-3.1.13, created on 2014-01-21 09:32:01
         compiled from "D:\wamp\www\goliathv2\app\view\joueur\fiche_tab_plus.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1593952de308149f775-43252504%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '2e4e6d2937606340b3bb6f2d0c9c94e30106e897' => 
    array (
      0 => 'D:\\wamp\\www\\goliathv2\\app\\view\\joueur\\fiche_tab_plus.tpl',
      1 => 1365364080,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1593952de308149f775-43252504',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'DataSup' => 0,
    'lang' => 0,
    'Joueur' => 0,
    'config' => 0,
    'InfosInstall' => 0,
    'Account' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_52de3081658d91_36493510',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_52de3081658d91_36493510')) {function content_52de3081658d91_36493510($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include 'D:\\wamp\\www\\goliathv2\\kernel\\lib\\smarty\\plugins\\modifier.date_format.php';
?><div class="well"><!-- On affiche les champs si present dans la base --><?php echo $_smarty_tpl->tpl_vars['DataSup']->value;?>
<br/><br/><!-- Affichage infos ajout et edition date pour suivi --><div><span><?php echo $_smarty_tpl->tpl_vars['lang']->value['Ajoute_le'];?>
 <strong><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['Joueur']->value['creat_on'],$_smarty_tpl->tpl_vars['config']->value['format_date']);?>
</strong> <?php echo $_smarty_tpl->tpl_vars['lang']->value['par'];?>
 <strong><?php echo $_smarty_tpl->tpl_vars['Joueur']->value['creat_auteur'];?>
</strong></span></div><?php if ($_smarty_tpl->tpl_vars['Joueur']->value['creat_on']!=$_smarty_tpl->tpl_vars['Joueur']->value['edit_on']){?><div><span><?php echo $_smarty_tpl->tpl_vars['lang']->value['Modifie_le'];?>
 <strong><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['Joueur']->value['edit_on'],$_smarty_tpl->tpl_vars['config']->value['format_date']);?>
</strong> <?php echo $_smarty_tpl->tpl_vars['lang']->value['par'];?>
 <strong><?php echo $_smarty_tpl->tpl_vars['Joueur']->value['edit_auteur'];?>
</strong></span></div><?php }?><!-- Affichage des infos sur le compte + bouton si en version full --><?php if ($_smarty_tpl->tpl_vars['InfosInstall']->value['i_type']=='full'){?><?php if ($_smarty_tpl->tpl_vars['Account']->value==0){?><br/><div><?php if ($_SESSION['utilisateur']['type']=='admin'){?><a href="<?php echo getLink("administration/userCreatSportifAccount/".((string)$_smarty_tpl->tpl_vars['Joueur']->value['id']));?>
" class="submit"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Creer_un_utilisateur'];?>
</a><?php }?></div><?php }?><?php }?></div><?php }} ?>