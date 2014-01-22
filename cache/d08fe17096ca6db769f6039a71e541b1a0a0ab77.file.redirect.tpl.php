<?php /* Smarty version Smarty-3.1.13, created on 2014-01-21 10:34:46
         compiled from "D:\wamp\www\goliathv2\app\view\redirect.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1648152de3f3681b2e6-58927769%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'd08fe17096ca6db769f6039a71e541b1a0a0ab77' => 
    array (
      0 => 'D:\\wamp\\www\\goliathv2\\app\\view\\redirect.tpl',
      1 => 1361038144,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1648152de3f3681b2e6-58927769',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'url' => 0,
    'temp' => 0,
    'error_class' => 0,
    'config' => 0,
    'error_image' => 0,
    'message' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_52de3f36ace661_62550489',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_52de3f36ace661_62550489')) {function content_52de3f36ace661_62550489($_smarty_tpl) {?><script type="text/javascript">
<!--
function redirect() {
    window.location='<?php echo $_smarty_tpl->tpl_vars['url']->value;?>
';
}
setTimeout('redirect()','<?php echo $_smarty_tpl->tpl_vars['temp']->value;?>
');
-->
</script>
<br/><br/><div class="alert alert-info"><span id="errorh"></span><div id="error_msg"><br/><br/><div class="<?php echo $_smarty_tpl->tpl_vars['error_class']->value;?>
" style="width:500px;margin:auto;padding:15px;"><br/><img src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
web/images/<?php echo $_smarty_tpl->tpl_vars['error_image']->value;?>
.png" alt="" style="float:left;padding-right:6px;" /><span style="font-size:17px; font-weight:bold;"><?php echo $_smarty_tpl->tpl_vars['message']->value;?>
</span><br/><br/></div><br/><br/></div><br/><div style="text-align:center;">Vous allez etre redirige dans <strong><?php echo $_smarty_tpl->tpl_vars['temp']->value/1000;?>
</strong> secondes ...</div></div>

<?php }} ?>