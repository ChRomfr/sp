<?php /* Smarty version Smarty-3.1.13, created on 2014-01-20 16:25:06
         compiled from "D:\wamp\www\goliathv2\app\view\utilisateur\profil.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2828652dd3fd275b3c8-02736724%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '66b310834e6e0547b6f6cf07928dd00f65b8ad06' => 
    array (
      0 => 'D:\\wamp\\www\\goliathv2\\app\\view\\utilisateur\\profil.tpl',
      1 => 1348785164,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2828652dd3fd275b3c8-02736724',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'lang' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_52dd3fd283f1b3_70034990',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_52dd3fd283f1b3_70034990')) {function content_52dd3fd283f1b3_70034990($_smarty_tpl) {?><div class="showData">
    <h1><?php echo $_smarty_tpl->tpl_vars['lang']->value['Your_profil'];?>
</h1>
    <form>
    <dl>
        <dt><label><?php echo $_smarty_tpl->tpl_vars['lang']->value['Identifiant'];?>
 :</label></dt>
        <dt><strong><?php echo $_SESSION['utilisateur']['identifiant'];?>
</strong></dt>
    </dl>
    <dl>
        <dt><label><?php echo $_smarty_tpl->tpl_vars['lang']->value['Account_type'];?>
 :</label></dt>
        <dt><strong><?php echo $_SESSION['utilisateur']['type'];?>
</strong></dt>
    </dl>
    </form>
</div><?php }} ?>