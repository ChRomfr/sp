<?php /* Smarty version Smarty-3.1.13, created on 2014-01-21 09:32:01
         compiled from "D:\wamp\www\goliathv2\app\view\paren\tab_fiche.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1739052de3081a67242-42691618%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'a10be53f01f140b9a03a67e157790e197aece82b' => 
    array (
      0 => 'D:\\wamp\\www\\goliathv2\\app\\view\\paren\\tab_fiche.tpl',
      1 => 1360933494,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1739052de3081a67242-42691618',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'lang' => 0,
    'Joueur' => 0,
    'Parents' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_52de308207cc19_81890164',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_52de308207cc19_81890164')) {function content_52de308207cc19_81890164($_smarty_tpl) {?><!--
PAREN/TAB FICHE
-->
<script type="text/javascript">
<!--
$(document).ready(function() {
    $("a#fbformaddparent").fancybox();
    $("a.fbformeditparent").fancybox();
});





<?php if ($_SESSION['acl']['gest_joueur']==1){?>
function deleteParent(pid){
    if( confirm('<?php echo $_smarty_tpl->tpl_vars['lang']->value['Confirm_suppression_parent'];?>
 ?') ){
        window.location.href = '<?php echo getLink("paren/delete/' + pid +'");?>
';   
    }
}
<?php }?>

<?php if ($_SESSION['acl']['gest_joueur']==1){?>
function deleteJoueur( joueur_id ){
	if( confirm('<?php echo $_smarty_tpl->tpl_vars['lang']->value['Confirm_suppression_joueur'];?>
 ?') ){
		window.location.href = '<?php echo getLink("joueur/delete/'+ joueur_id +'");?>
';
	}
}
<?php }?>

//-->
</script>
<div class="well"><!-- IMPRESSION --><div class="fright"><a href="<?php echo getLink("joueur/printTabSituationFamiliale/".((string)$_smarty_tpl->tpl_vars['Joueur']->value['id'])."?nohtml&print");?>
" title="Print" target="_blank"><i class="icon-print"></i></a></div><div class="clear"></div><!-- Action haut droite --><div style="float:right"><?php if (count($_smarty_tpl->tpl_vars['Parents']->value)<2&&$_SESSION['acl']['gest_joueur']==1){?><a href="<?php echo getLink("paren/add?joueur_id=".((string)$_smarty_tpl->tpl_vars['Joueur']->value['id'])."&nohtml");?>
" id="fbformaddparent" title=""><i class="icon-plus"></i></a><?php }?></div><div style="clear:both"></div><!-- End Action --><div style="width:95%; margin:auto;"><p><?php echo $_smarty_tpl->tpl_vars['lang']->value['Situation'];?>
 : <strong><?php echo $_smarty_tpl->tpl_vars['Joueur']->value['parent_situation'];?>
</strong></p></div><?php if (isset($_smarty_tpl->tpl_vars['Parents']->value[0])){?><table class="table table-bordered table-condensed"><caption><?php echo $_smarty_tpl->tpl_vars['lang']->value['Parents'];?>
</caption><tr><th></th><td><?php if ($_smarty_tpl->tpl_vars['Parents']->value[0]['type']=="p"){?><?php echo $_smarty_tpl->tpl_vars['lang']->value['Pere'];?>
<?php }elseif($_smarty_tpl->tpl_vars['Parents']->value[0]['type']=="m"){?><?php echo $_smarty_tpl->tpl_vars['lang']->value['Mere'];?>
<?php }?><?php if ($_SESSION['acl']['gest_joueur']==true){?><a href="<?php echo getLink("paren/edit/".((string)$_smarty_tpl->tpl_vars['Parents']->value[0]['id'])."?nohtml");?>
" class="fbformeditparent" title=""><i class="icon-pencil"></i></a>&nbsp;<a href="javascript:deleteParent(<?php echo $_smarty_tpl->tpl_vars['Parents']->value[0]['id'];?>
)"><i class="icon-trash"></i></a><?php }?></td><?php if (isset($_smarty_tpl->tpl_vars['Parents']->value[1])){?><td><?php if ($_smarty_tpl->tpl_vars['Parents']->value[1]['type']=="p"){?><?php echo $_smarty_tpl->tpl_vars['lang']->value['Pere'];?>
<?php }elseif($_smarty_tpl->tpl_vars['Parents']->value[1]['type']=="m"){?><?php echo $_smarty_tpl->tpl_vars['lang']->value['Mere'];?>
<?php }?><?php if ($_SESSION['acl']['gest_joueur']==true){?><a href="<?php echo getLink("paren/edit/".((string)$_smarty_tpl->tpl_vars['Parents']->value[1]['id'])."?nohtml");?>
" class="fbformeditparent" title=""><i class="icon-pencil"></i></a><a href="javascript:deleteParent(<?php echo $_smarty_tpl->tpl_vars['Parents']->value[1]['id'];?>
)"><i class="icon-trash"></i></a><?php }?></td><?php }?></tr><tr><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Nom'];?>
</th><td><?php echo $_smarty_tpl->tpl_vars['Parents']->value[0]['nom'];?>
</td><?php if (isset($_smarty_tpl->tpl_vars['Parents']->value[1])){?><td><?php echo $_smarty_tpl->tpl_vars['Parents']->value[1]['nom'];?>
</td><?php }?></tr><tr><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Prenom'];?>
</th><td><?php echo $_smarty_tpl->tpl_vars['Parents']->value[0]['prenom'];?>
</td><?php if (isset($_smarty_tpl->tpl_vars['Parents']->value[1])){?><td><?php echo $_smarty_tpl->tpl_vars['Parents']->value[1]['prenom'];?>
</td><?php }?></tr><tr><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Adresse'];?>
</th><td><?php echo $_smarty_tpl->tpl_vars['Parents']->value[0]['adresse'];?>
<br/><?php echo $_smarty_tpl->tpl_vars['Parents']->value[0]['code_postal'];?>
 <?php echo $_smarty_tpl->tpl_vars['Parents']->value[0]['ville'];?>
</td><?php if (isset($_smarty_tpl->tpl_vars['Parents']->value[1])){?><td><?php echo $_smarty_tpl->tpl_vars['Parents']->value[1]['adresse'];?>
<br/><?php echo $_smarty_tpl->tpl_vars['Parents']->value[1]['code_postal'];?>
 <?php echo $_smarty_tpl->tpl_vars['Parents']->value[1]['ville'];?>
</td><?php }?></tr><tr><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Telephone'];?>
</th><td><?php echo $_smarty_tpl->tpl_vars['Parents']->value[0]['telephone'];?>
</td><?php if (isset($_smarty_tpl->tpl_vars['Parents']->value[1])){?><td><?php echo $_smarty_tpl->tpl_vars['Parents']->value[1]['telephone'];?>
</td><?php }?></tr><tr><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Portable'];?>
</th><td><?php echo $_smarty_tpl->tpl_vars['Parents']->value[0]['portable'];?>
</td><?php if (isset($_smarty_tpl->tpl_vars['Parents']->value[1])){?><td><?php echo $_smarty_tpl->tpl_vars['Parents']->value[1]['portable'];?>
</td><?php }?></tr><tr><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Profession'];?>
</th><td><?php echo $_smarty_tpl->tpl_vars['Parents']->value[0]['emploi'];?>
</td><?php if (isset($_smarty_tpl->tpl_vars['Parents']->value[1])){?><td><?php echo $_smarty_tpl->tpl_vars['Parents']->value[1]['emploi'];?>
</td><?php }?></tr><tr><th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Telephone'];?>
 pro</th><td><?php echo $_smarty_tpl->tpl_vars['Parents']->value[0]['telephone_pro'];?>
</td><?php if (isset($_smarty_tpl->tpl_vars['Parents']->value[1])){?><td><?php echo $_smarty_tpl->tpl_vars['Parents']->value[1]['telephone_pro'];?>
</td><?php }?></tr></table><?php }?></div></div><?php }} ?>