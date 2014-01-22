<?php /* Smarty version Smarty-3.1.13, created on 2014-01-20 15:36:46
         compiled from "D:\wamp\www\goliathv2\app\view\widget\actualite.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2340952dd347ed07228-66125200%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'd80c9a0b2be3652ae8908a5bf0d411ab938ed5ca' => 
    array (
      0 => 'D:\\wamp\\www\\goliathv2\\app\\view\\widget\\actualite.tpl',
      1 => 1365765408,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2340952dd347ed07228-66125200',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'Actus' => 0,
    'Row' => 0,
    'config' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_52dd347ee05152_24349526',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_52dd347ee05152_24349526')) {function content_52dd347ee05152_24349526($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include 'D:\\wamp\\www\\goliathv2\\kernel\\lib\\smarty\\plugins\\modifier.date_format.php';
?><?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Actus']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?>
	<span><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['Row']->value['creat_on'],$_smarty_tpl->tpl_vars['config']->value['format_date_day']);?>
 - <a href="javascript:getDetailActu(<?php echo $_smarty_tpl->tpl_vars['Row']->value['id'];?>
)" title=""><?php echo $_smarty_tpl->tpl_vars['Row']->value['titre'];?>
</a></span><br/>
<?php } ?>

<!--
<div id="diag-actualite-detail"></div>
-->

<script type="text/javascript">
<!--

function getDetailActu(aid){
	$('#modal-index-contenu').html();
    $.get(
        '<?php echo getLink("widget/getWidgetActualiteDetail/'+ aid +'");?>
',
        {nohtml:'nohtml'},
        function(data){ $('#modal-index-contenu').html(data); }
    )
    
    /*
     $( "#diag-actualite-detail" ).dialog('open');
     */
    $('#modal-index').modal('show')
}

//-->
</script><?php }} ?>