<?php /* Smarty version Smarty-3.1.13, created on 2014-01-20 16:10:10
         compiled from "D:\wamp\www\goliathv2\app\view\document\index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2456352dd3c52dd8268-56254792%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'bd6eb5c165d3cb8e03f17130f21e70bf9e7c0bda' => 
    array (
      0 => 'D:\\wamp\\www\\goliathv2\\app\\view\\document\\index.tpl',
      1 => 1361038347,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2456352dd3c52dd8268-56254792',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'lang' => 0,
    'Fichiers' => 0,
    'Fichier' => 0,
    'config' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_52dd3c53141f08_06305907',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_52dd3c53141f08_06305907')) {function content_52dd3c53141f08_06305907($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include 'D:\\wamp\\www\\goliathv2\\kernel\\lib\\smarty\\plugins\\modifier.date_format.php';
?><script type="text/javascript">
<!--
<?php if ($_SESSION['utilisateur']['type']=='admin'||$_SESSION['acl']['gest_document']==1){?>
    function deleteFichier(fichier_id){
        if( confirm('<?php echo $_smarty_tpl->tpl_vars['lang']->value['Confirm_suppression_fichier'];?>
 ?') ){
            window.location.href = '<?php echo getLink("document/delete/'+ fichier_id +'?token=".((string)$_SESSION['token']));?>
'
        }
    }
<?php }?>
//-->
</script>
<ul class="breadcrumb"><li><a href="<?php echo getLink("index/index");?>
" title="<?php echo $_smarty_tpl->tpl_vars['lang']->value['Accueil'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Accueil'];?>
</a><span class="divider">/</span></li><li class="active"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Documents'];?>
</li></ul><div class="well"><div class="fright"><?php if ($_SESSION['utilisateur']['type']=='admin'||$_SESSION['acl']['gest_document']==1){?><a href="<?php echo getLink("document/add");?>
" title=""><i class="icon-plus"></i></a><?php }?></div><h1><?php echo $_smarty_tpl->tpl_vars['lang']->value['Documents'];?>
</h1><div class="clear"></div><table class="table table-bordered table-condensed table-striped table-hover"><thead><tr><th>#</td><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Fichier'];?>
</th><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Date'];?>
</th><th></th><?php if ($_SESSION['utilisateur']['type']=='admin'||$_SESSION['acl']['gest_document']==1){?><th></th><?php }?></tr></thead><tbody><?php  $_smarty_tpl->tpl_vars['Fichier'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Fichier']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Fichiers']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Fichier']->key => $_smarty_tpl->tpl_vars['Fichier']->value){
$_smarty_tpl->tpl_vars['Fichier']->_loop = true;
?><tr><td><?php echo $_smarty_tpl->tpl_vars['Fichier']->value['id'];?>
</td><td><?php echo $_smarty_tpl->tpl_vars['Fichier']->value['nom'];?>
</td><td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['Fichier']->value['add_on'],$_smarty_tpl->tpl_vars['config']->value['format_date_day']);?>
</td><td class="center"><a href="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
web/upload/documents/<?php echo $_smarty_tpl->tpl_vars['Fichier']->value['fichier'];?>
" title=""><img src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
web/images/Save.png" alt="" style="width:18px;" /></a></td><?php if ($_SESSION['utilisateur']['type']=='admin'||$_SESSION['acl']['gest_document']==1){?><td class="center"><!-- Edition --><a href="<?php echo getLink("document/edit/".((string)$_smarty_tpl->tpl_vars['Fichier']->value['id']));?>
" title=""><i class="icon-pencil"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<!-- Suppression --><a href="javascript:deleteFichier(<?php echo $_smarty_tpl->tpl_vars['Fichier']->value['id'];?>
);" title=""><i class="icon-trash"></i></a></td><?php }?></tr><?php } ?></tbody></table></div><?php }} ?>