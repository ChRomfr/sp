<?php /* Smarty version Smarty-3.1.13, created on 2014-01-21 10:44:36
         compiled from "D:\wamp\www\goliathv2\app\view\joueur\trombi.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1136352de30779ae311-07135195%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '879ffca2e505d880aa00e2c82a3f97914bfb5b15' => 
    array (
      0 => 'D:\\wamp\\www\\goliathv2\\app\\view\\joueur\\trombi.tpl',
      1 => 1390297473,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1136352de30779ae311-07135195',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_52de307813d2e2_58850053',
  'variables' => 
  array (
    'Helper' => 0,
    'lang' => 0,
    'Joueurs' => 0,
    'Joueur' => 0,
    'config' => 0,
    'Equipes' => 0,
    'Row' => 0,
    'Sites' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_52de307813d2e2_58850053')) {function content_52de307813d2e2_58850053($_smarty_tpl) {?><!-- START view/joueur/tombi.tpl -->
<ol class="breadcrumb"><li><a href="<?php echo $_smarty_tpl->tpl_vars['Helper']->value->getLink("index");?>
" title="<?php echo $_smarty_tpl->tpl_vars['lang']->value['Accueil'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Accueil'];?>
</a></li><li class="active"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Joueur'];?>
</li></ol><div class="well"><?php if ($_SESSION['utilisateur']['isAdmin']>0||$_SESSION['acl']['gest_joueur']==true){?><div class="pull-right"><a href="<?php echo $_smarty_tpl->tpl_vars['Helper']->value->getLink("joueur/add");?>
" title=""><i class="fa fa-plus fa-lg"></i></a></div><?php }?><h3><?php echo $_smarty_tpl->tpl_vars['lang']->value['Joueurs'];?>
</h3><div class="clearfix"></div><table class="table"><tbody><tr><?php  $_smarty_tpl->tpl_vars['Joueur'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Joueur']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Joueurs']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['foo']['iteration']=0;
foreach ($_from as $_smarty_tpl->tpl_vars['Joueur']->key => $_smarty_tpl->tpl_vars['Joueur']->value){
$_smarty_tpl->tpl_vars['Joueur']->_loop = true;
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['foo']['iteration']++;
?><td class="text-center"><a href="<?php echo $_smarty_tpl->tpl_vars['Helper']->value->getLink("joueur/fiche/".((string)$_smarty_tpl->tpl_vars['Joueur']->value['id']));?>
" title=""><?php if (isset($_smarty_tpl->tpl_vars['Joueur']->value['photo_id'])){?><img src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
web/upload/joueurs/<?php echo $_smarty_tpl->tpl_vars['Joueur']->value['id'];?>
/photo_id/<?php echo $_smarty_tpl->tpl_vars['Joueur']->value['photo_id'];?>
" style="width:100px;" /><br/><?php echo $_smarty_tpl->tpl_vars['Joueur']->value['nom'];?>
 <?php echo $_smarty_tpl->tpl_vars['Joueur']->value['prenom'];?>
<?php }else{ ?><img src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
web/images/avatar/no_image.jpg" style="width:100px;" /><br/><?php echo $_smarty_tpl->tpl_vars['Joueur']->value['nom'];?>
 <?php echo $_smarty_tpl->tpl_vars['Joueur']->value['prenom'];?>
<?php }?></a></td><?php if ($_smarty_tpl->getVariable('smarty')->value['foreach']['foo']['iteration']%5==0){?></tr><tr><?php }?><?php } ?></tr></tbody></table><div class="pull-right"><?php if (!isset($_GET['sexe'])){?><a href="<?php echo getLink("joueur/index?sexe=h&trombi");?>
" title="<?php echo $_smarty_tpl->tpl_vars['lang']->value['Homme'];?>
"><img src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
web/images/male-icone.png" alt="" style="width:16px;"/></a>&nbsp;<a href="<?php echo getLink("joueur/index?sexe=f&trombi");?>
" title="<?php echo $_smarty_tpl->tpl_vars['lang']->value['Femme'];?>
"><img src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
web/images/female-icone.png" alt="" style="width:16px;"/></a><img src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
web/images/male-female.png" alt="" style="width:24px;"/><?php }elseif(isset($_GET['sexe'])&&$_GET['sexe']=="h"){?><img src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
web/images/male-icone.png" alt="" style="width:24px;"/>&nbsp;<a href="<?php echo getLink("joueur/index?sexe=f&trombi");?>
" title=""><img src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
web/images/female-icone.png" alt="" style="width:16px;"/></a>&nbsp;<a href="<?php echo getLink("joueur/index?trombi");?>
" title=""><img src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
web/images/male-female.png" alt="" style="width:16px;"/></a><?php }elseif(isset($_GET['sexe'])&&$_GET['sexe']=="f"){?><a href="<?php echo getLink("joueur/index?sexe=h&trombi");?>
" title="<?php echo $_smarty_tpl->tpl_vars['lang']->value['Homme'];?>
"><img src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
web/images/male-icone.png" alt="" style="width:16px;"/></a>&nbsp;<strong><img src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
web/images/female-icone.png" alt="" style="width:24px;"/></strong>&nbsp;<a href="<?php echo getLink("joueur/index?trombi");?>
" title=""><img src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
web/images/male-female.png" alt="" style="width:16px;"/></a><?php }?><!-- option list des equipes --><?php if (count($_smarty_tpl->tpl_vars['Equipes']->value)>1){?><span>&nbsp;&nbsp;<select id="equipe" onchange="reloadPage('equipe');"><option></option><?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Equipes']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?><option value="<?php echo $_smarty_tpl->tpl_vars['Row']->value['id'];?>
" <?php if (isset($_GET['equipe'])&&$_GET['equipe']==$_smarty_tpl->tpl_vars['Row']->value['id']){?>selected="selected"<?php }?>><?php echo $_smarty_tpl->tpl_vars['Row']->value['nom'];?>
 <?php if ($_smarty_tpl->tpl_vars['config']->value['sport_champ_structure']==1){?> - <?php echo $_smarty_tpl->tpl_vars['Row']->value['structure'];?>
<?php }?></option><?php } ?></select></span><?php }?><?php if ($_smarty_tpl->tpl_vars['config']->value['multi_site']==1){?><select id="site" onchange="reloadPage();"><option></option><?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Sites']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?><option value="<?php echo $_smarty_tpl->tpl_vars['Row']->value['id'];?>
" <?php if (isset($_GET['site'])&&$_GET['site']==$_smarty_tpl->tpl_vars['Row']->value['id']){?>selected="selected"<?php }?>><?php echo $_smarty_tpl->tpl_vars['Row']->value['nom'];?>
</option><?php } ?></select><?php }?><?php if ($_SESSION['utilisateur']['joueur_trombi']==1&&!isset($_GET['liste'])){?><a href="<?php echo getLink('joueur/index?liste');?>
" title="" class="submit"><i class="icon-list"></i></a><?php }?><?php if ($_SESSION['utilisateur']['joueur_trombi']==0&&isset($_GET['trombi'])){?><a href="<?php echo getLink('joueur/index');?>
" title="" class="submit"><i class="icon-list"></i></a><?php }?></div><div class="clearfix"></div></div>
<script type="text/javascript">
function reloadPage(filtre){
	var url = '<?php echo getLink("joueur/index?");?>
';
	<?php if (isset($_GET['sexe'])){?> url = url + '&sexe=<?php echo $_GET['sexe'];?>
';<?php }?>
	<?php if (isset($_GET['equipe'])){?>
		if( filtre != 'equipe' ){
			url = url + '&equipe=<?php echo $_GET['equipe'];?>
';
		}
	<?php }?>
	<?php if (isset($_GET['site'])){?> 
		if( filtre != 'site' ){
			url = url + '&equipe=<?php echo $_GET['site'];?>
';
		}
	<?php }?>
	
	if( filtre == 'site' ){
		if( $("#site").val() != '' ){
			url = url + '&site='+ $("#site").val() ;
		}
	}
	
	if( filtre == 'equipe' ){
		if( $("#equipe").val() != '' ){
			url = url + '&equipe='+ $("#equipe").val() ;
		}
	}
	
	window.location.href = url;
}
</script>
<!-- END view/joueur/tombi.tpl --><?php }} ?>