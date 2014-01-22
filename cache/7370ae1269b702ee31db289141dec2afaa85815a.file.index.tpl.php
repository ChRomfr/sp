<?php /* Smarty version Smarty-3.1.13, created on 2014-01-20 15:20:28
         compiled from "D:\wamp\www\goliathv2\app\view\connexion\index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2251752dd30ac57d498-94363672%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '7370ae1269b702ee31db289141dec2afaa85815a' => 
    array (
      0 => 'D:\\wamp\\www\\goliathv2\\app\\view\\connexion\\index.tpl',
      1 => 1360852643,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2251752dd30ac57d498-94363672',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'lang' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_52dd30ac732a97_06283038',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_52dd30ac732a97_06283038')) {function content_52dd30ac732a97_06283038($_smarty_tpl) {?><div class="container-fluid"><form method="post" action="" class="form form-horizontal container well"><h1><?php echo $_smarty_tpl->tpl_vars['lang']->value['Identification'];?>
</h1><div class="control-group"><label class="control-label" for="identifiant"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Identifiant'];?>
</label><div class="controls"><input type="text" name="login[identifiant]" id="identifiant" required placeholder="<?php echo $_smarty_tpl->tpl_vars['lang']->value['Identifiant'];?>
" /></div></div><div class="control-group"><label class="control-label" for="password"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Mot_de_passe'];?>
</label><div class="controls"><input type="password" name="login[password]" id="password" required /></div></div ><input type="submit" name="send" value="<?php echo $_smarty_tpl->tpl_vars['lang']->value['Envoyer'];?>
" class="btn btn-primary"/></form></div><?php }} ?>