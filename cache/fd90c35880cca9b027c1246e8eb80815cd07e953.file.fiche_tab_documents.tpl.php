<?php /* Smarty version Smarty-3.1.13, created on 2014-01-21 09:31:59
         compiled from "D:\wamp\www\goliathv2\app\view\joueur\fiche_tab_documents.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1648052de307feacd59-46380702%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'fd90c35880cca9b027c1246e8eb80815cd07e953' => 
    array (
      0 => 'D:\\wamp\\www\\goliathv2\\app\\view\\joueur\\fiche_tab_documents.tpl',
      1 => 1365363804,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1648052de307feacd59-46380702',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'lang' => 0,
    'Documents' => 0,
    'config' => 0,
    'joueur_id' => 0,
    'Row' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_52de308022a721_09395347',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_52de308022a721_09395347')) {function content_52de308022a721_09395347($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include 'D:\\wamp\\www\\goliathv2\\kernel\\lib\\smarty\\plugins\\modifier.date_format.php';
?><div class="well"><h4><?php echo $_smarty_tpl->tpl_vars['lang']->value['Documents'];?>
</h4><table class="table table-striped table-hover table-bordered"><thead><tr><td><?php echo $_smarty_tpl->tpl_vars['lang']->value['Nom'];?>
</td><td><?php echo $_smarty_tpl->tpl_vars['lang']->value['Extension'];?>
</td><td><?php echo $_smarty_tpl->tpl_vars['lang']->value['Date_ajout'];?>
</td><?php if ($_SESSION['acl']['gest_joueur']==true){?><td></td><?php }?></tr></thead><tbody><?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Documents']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?><tr><td><a href="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
web/upload/joueurs/<?php echo $_smarty_tpl->tpl_vars['joueur_id']->value;?>
/documents/<?php echo $_smarty_tpl->tpl_vars['Row']->value['file_name'];?>
" title="" target="_blank"><?php echo $_smarty_tpl->tpl_vars['Row']->value['nom'];?>
</a></td><td><?php echo $_smarty_tpl->tpl_vars['Row']->value['extension'];?>
</td><td><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['Row']->value['date_add'],$_smarty_tpl->tpl_vars['config']->value['format_date']);?>
</td><?php if ($_SESSION['acl']['gest_joueur']==true){?><td class="center"><a href="javascript:deleteDocument(<?php echo $_smarty_tpl->tpl_vars['Row']->value['id'];?>
)"><img src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
web/images/delete.png" alt="" /></a></td><?php }?></tr><?php } ?></tbody></table></div><?php if ($_SESSION['acl']['gest_joueur']==1){?><form method="post" enctype="multipart/form-data" action="<?php echo getLink('joueur/uploadFile?nohtml');?>
" target="uploadFrame" onsubmit="return sendUpload();" id="formUpload" class="form"><dl><dt><label><?php echo $_smarty_tpl->tpl_vars['lang']->value['Fichier'];?>
 :</label></dt><dd><input type="file" name="doc" class="validate[required]" id="fichier_doc"/></dd></dl><dl><dt><label><?php echo $_smarty_tpl->tpl_vars['lang']->value['Nom'];?>
 :</label></dt><dd><input type="text" name="fichier[nom]" id="fichier_nom" class="validate[required]"/></dd></dl><dl><dt><label><?php echo $_smarty_tpl->tpl_vars['lang']->value['Description'];?>
 :</label></dt><dd><textarea name="fichier[description]" rows="2" cols="40"></textarea></dd></dl><div class="center"><input type="hidden" name="fichier[joueur_id]" value="<?php echo $_smarty_tpl->tpl_vars['joueur_id']->value;?>
" /><input type="submit" value="<?php echo $_smarty_tpl->tpl_vars['lang']->value['Enregistrer'];?>
" /></div></form><div id="uploadInfos"><div id="uploadStatus"></div><iframe id="uploadFrame" name="uploadFrame" style="display:none;"></iframe></div><?php }?>
<script type="text/javascript">
<!--
jQuery(document).ready(function(){
    // binds form submission and fields to the validation engine
    jQuery("#formUpload").validationEngine();
});

function sendUpload(){
    if( $('#fichier_nom').val() != '' && $('#fichier_doc').val() != ''){
        $("#uploadStatus").html('<div class="center"><img src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
web/images/lightbox-ico-loading.gif" alt="" /><br/>Uploading ...</div>');
        return true;
    }
    return false;
}

function endUpload(){
    $("#uploadStatus").html('<div class="center">Upload done !</div>');
    $.get(
        '<?php echo getLink("joueur/getDocuments/".((string)$_smarty_tpl->tpl_vars['joueur_id']->value));?>
',
        {nohtml:'nohtml'},
        function(data){ $('#ui-tabs-8').html(data); }
    )
    
}

function deleteDocument(did){
    if( confirm('<?php echo $_smarty_tpl->tpl_vars['lang']->value['Confirm_suppression_document'];?>
 ?') ){
        $.get(
            '<?php echo getLink("joueur/deleteDocument/'+did+'");?>
',
            {nohtml:'nohtml'},
            function(data){ $('#ui-tabs-8').html(data); }
        )
          
    }
     
}

//-->
</script><?php }} ?>