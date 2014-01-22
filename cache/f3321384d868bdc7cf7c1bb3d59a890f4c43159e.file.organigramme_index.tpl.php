<?php /* Smarty version Smarty-3.1.13, created on 2014-01-20 15:36:31
         compiled from "D:\wamp\www\goliathv2\app\view\administration\organigramme_index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2482752dd346f227854-96826433%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'f3321384d868bdc7cf7c1bb3d59a890f4c43159e' => 
    array (
      0 => 'D:\\wamp\\www\\goliathv2\\app\\view\\administration\\organigramme_index.tpl',
      1 => 1367409961,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2482752dd346f227854-96826433',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'lang' => 0,
    'Rows' => 0,
    'Row' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_52dd346f48a1c9_45030772',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_52dd346f48a1c9_45030772')) {function content_52dd346f48a1c9_45030772($_smarty_tpl) {?><ul class="breadcrumb"><li><a href="<?php echo getLink("index");?>
" title=""><?php echo $_smarty_tpl->tpl_vars['lang']->value['Accueil'];?>
</a><span class="divider">/</span></li><li><a href="<?php echo getLink("administration");?>
" title=""><?php echo $_smarty_tpl->tpl_vars['lang']->value['Administration'];?>
</a><span class="divider">/</span></li><li><?php echo $_smarty_tpl->tpl_vars['lang']->value['Organigramme'];?>
</li></ul><div class="well"><div class="pull-right"><a href="<?php echo getLink("administration/organigrammeAdd");?>
" title=""><i class="icon-plus"></i></a></div><h4><?php echo $_smarty_tpl->tpl_vars['lang']->value['Organigramme'];?>
</h4><div class="clearfix"></div><table class="table"><thead><tr><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Personne'];?>
</th><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Fonction'];?>
</th><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Telephone'];?>
</th><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Email'];?>
</th><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Action'];?>
</th></tr></thead><tbody><?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Rows']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?><tr><td><?php echo $_smarty_tpl->tpl_vars['Row']->value['nom'];?>
 <?php echo $_smarty_tpl->tpl_vars['Row']->value['prenom'];?>
</td><td><?php echo $_smarty_tpl->tpl_vars['Row']->value['fonction_libelle'];?>
</td><td><?php echo $_smarty_tpl->tpl_vars['Row']->value['telephone'];?>
</td><td><?php echo $_smarty_tpl->tpl_vars['Row']->value['email'];?>
</td><td class="center"><a href="<?php echo getLink("administration/organigrammeEdit/".((string)$_smarty_tpl->tpl_vars['Row']->value['id']));?>
" title=""><i class="icon-edit"></i></a><a href="javascript:deletePersonne(<?php echo $_smarty_tpl->tpl_vars['Row']->value['id'];?>
)" title=""><i class="icon-trash"></i></a></td></tr><?php } ?></tbody></table></div>
<script type="text/javascript">
<!--
function deletePersonne(personne_id){
    if( confirm("<?php echo $_smarty_tpl->tpl_vars['lang']->value['Confirm_suppression_personne_organigramme'];?>
 ?") ){
        window.location.href = '<?php echo getLink("administration/organigrammeDelete/'+ personne_id +'");?>
';
    }
}
//-->
</script><?php }} ?>