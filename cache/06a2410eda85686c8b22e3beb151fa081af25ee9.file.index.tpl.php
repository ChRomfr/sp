<?php /* Smarty version Smarty-3.1.13, created on 2014-01-20 16:29:13
         compiled from "D:\wamp\www\goliathv2\app\view\organigramme\index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1819252dd40c937c8c5-54631850%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '06a2410eda85686c8b22e3beb151fa081af25ee9' => 
    array (
      0 => 'D:\\wamp\\www\\goliathv2\\app\\view\\organigramme\\index.tpl',
      1 => 1362639127,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1819252dd40c937c8c5-54631850',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'lang' => 0,
    'Personnes' => 0,
    'Row' => 0,
    'config' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_52dd40ca5af8a6_26686519',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_52dd40ca5af8a6_26686519')) {function content_52dd40ca5af8a6_26686519($_smarty_tpl) {?><ul class="breadcrumb"><li><a href="<?php echo getLink("index");?>
" title=""><?php echo $_smarty_tpl->tpl_vars['lang']->value['Accueil'];?>
</a><span class="divider">/</span></li><li><?php echo $_smarty_tpl->tpl_vars['lang']->value['Organigramme'];?>
</li></ul><div class="well"><h4><?php echo $_smarty_tpl->tpl_vars['lang']->value['Organigramme'];?>
</h4><div style="margin:auto; width:75%;"><?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Personnes']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?><?php if ($_smarty_tpl->tpl_vars['Row']->value['fonction']=='014'){?><div class="organigramme_directeur_administratif"><div><strong><?php echo $_smarty_tpl->tpl_vars['Row']->value['nom'];?>
 <?php echo $_smarty_tpl->tpl_vars['Row']->value['prenom'];?>
</strong></div><div><?php echo $_smarty_tpl->tpl_vars['Row']->value['fonction_libelle'];?>
</div><?php if (empty($_SESSION['utilisateur']['id_liaison'])){?><?php if (!empty($_smarty_tpl->tpl_vars['Row']->value['email'])){?><div><a href="mailto:<?php echo $_smarty_tpl->tpl_vars['Row']->value['email'];?>
"><?php echo $_smarty_tpl->tpl_vars['Row']->value['email'];?>
</a></div><?php }?><?php if (!empty($_smarty_tpl->tpl_vars['Row']->value['telephone'])){?><div><?php echo $_smarty_tpl->tpl_vars['Row']->value['telephone'];?>
</div><?php }?><?php }?><?php if ($_smarty_tpl->tpl_vars['config']->value['multi_site']==1&&!empty($_smarty_tpl->tpl_vars['Row']->value['site_id'])&&!empty($_smarty_tpl->tpl_vars['Row']->value['site'])){?><?php echo $_smarty_tpl->tpl_vars['Row']->value['site'];?>
<?php }?></div><?php }?><?php } ?><div class="clear"></div></div><div class="organigramme_seperator"></div><div style="margin:auto; width:75%;"><?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Personnes']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?><?php if ($_smarty_tpl->tpl_vars['Row']->value['fonction']=='001'){?><div class="organigramme_directeur"><div><strong><?php echo $_smarty_tpl->tpl_vars['Row']->value['nom'];?>
 <?php echo $_smarty_tpl->tpl_vars['Row']->value['prenom'];?>
</strong></div><div><?php echo $_smarty_tpl->tpl_vars['Row']->value['fonction_libelle'];?>
</div><?php if (empty($_SESSION['utilisateur']['id_liaison'])){?><?php if (!empty($_smarty_tpl->tpl_vars['Row']->value['email'])){?><div><a href="mailto:<?php echo $_smarty_tpl->tpl_vars['Row']->value['email'];?>
"><?php echo $_smarty_tpl->tpl_vars['Row']->value['email'];?>
</a></div><?php }?><?php if (!empty($_smarty_tpl->tpl_vars['Row']->value['telephone'])){?><div><?php echo $_smarty_tpl->tpl_vars['Row']->value['telephone'];?>
</div><?php }?><?php }?><?php if ($_smarty_tpl->tpl_vars['config']->value['multi_site']==1&&!empty($_smarty_tpl->tpl_vars['Row']->value['site_id'])&&!empty($_smarty_tpl->tpl_vars['Row']->value['site'])){?><?php echo $_smarty_tpl->tpl_vars['Row']->value['site'];?>
<?php }?></div><?php }?><?php } ?><div class="clear"></div></div><div class="organigramme_seperator"></div><div style="margin:auto; width:75%;"><?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Personnes']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?><?php if ($_smarty_tpl->tpl_vars['Row']->value['fonction']=='002'){?><div class="organigramme_coordinateur"><div><strong><?php echo $_smarty_tpl->tpl_vars['Row']->value['nom'];?>
 <?php echo $_smarty_tpl->tpl_vars['Row']->value['prenom'];?>
</strong></div><div><?php echo $_smarty_tpl->tpl_vars['Row']->value['fonction_libelle'];?>
</div><?php if (empty($_SESSION['utilisateur']['id_liaison'])){?><?php if (!empty($_smarty_tpl->tpl_vars['Row']->value['email'])){?><div><a href="mailto:<?php echo $_smarty_tpl->tpl_vars['Row']->value['email'];?>
"><?php echo $_smarty_tpl->tpl_vars['Row']->value['email'];?>
</a></div><?php }?><?php if (!empty($_smarty_tpl->tpl_vars['Row']->value['telephone'])){?><div><?php echo $_smarty_tpl->tpl_vars['Row']->value['telephone'];?>
</div><?php }?><?php }?><?php if ($_smarty_tpl->tpl_vars['config']->value['multi_site']==1&&!empty($_smarty_tpl->tpl_vars['Row']->value['site_id'])&&!empty($_smarty_tpl->tpl_vars['Row']->value['site'])){?><?php echo $_smarty_tpl->tpl_vars['Row']->value['site'];?>
<?php }?></div><?php }?><?php } ?><div class="clear"></div></div><div class="organigramme_seperator"></div><div style="margin:auto; width:75%;"><?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Personnes']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?><?php if ($_smarty_tpl->tpl_vars['Row']->value['fonction']==003){?><div class="organigramme_entraineur"><div><strong><?php echo $_smarty_tpl->tpl_vars['Row']->value['nom'];?>
 <?php echo $_smarty_tpl->tpl_vars['Row']->value['prenom'];?>
</strong></div><div><?php echo $_smarty_tpl->tpl_vars['Row']->value['fonction_libelle'];?>
</div><?php if (empty($_SESSION['utilisateur']['id_liaison'])){?><?php if (!empty($_smarty_tpl->tpl_vars['Row']->value['email'])){?><div><a href="mailto:<?php echo $_smarty_tpl->tpl_vars['Row']->value['email'];?>
"><?php echo $_smarty_tpl->tpl_vars['Row']->value['email'];?>
</a></div><?php }?><?php if (!empty($_smarty_tpl->tpl_vars['Row']->value['telephone'])){?><div><?php echo $_smarty_tpl->tpl_vars['Row']->value['telephone'];?>
</div><?php }?><?php }?><?php if ($_smarty_tpl->tpl_vars['config']->value['multi_site']==1&&!empty($_smarty_tpl->tpl_vars['Row']->value['site_id'])&&!empty($_smarty_tpl->tpl_vars['Row']->value['site'])){?><?php echo $_smarty_tpl->tpl_vars['Row']->value['site'];?>
<?php }?></div><?php }?><?php } ?><div class="clear"></div></div><div class="organigramme_seperator"></div><div style="margin:auto; width:75%;"><?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Personnes']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?><?php if ($_smarty_tpl->tpl_vars['Row']->value['fonction']==004){?><div class="organigramme_prepateur_physique"><div><strong><?php echo $_smarty_tpl->tpl_vars['Row']->value['nom'];?>
 <?php echo $_smarty_tpl->tpl_vars['Row']->value['prenom'];?>
</strong></div><div><?php echo $_smarty_tpl->tpl_vars['Row']->value['fonction_libelle'];?>
</div><?php if (empty($_SESSION['utilisateur']['id_liaison'])){?><?php if (!empty($_smarty_tpl->tpl_vars['Row']->value['email'])){?><div><a href="mailto:<?php echo $_smarty_tpl->tpl_vars['Row']->value['email'];?>
"><?php echo $_smarty_tpl->tpl_vars['Row']->value['email'];?>
</a></div><?php }?><?php if (!empty($_smarty_tpl->tpl_vars['Row']->value['telephone'])){?><div><?php echo $_smarty_tpl->tpl_vars['Row']->value['telephone'];?>
</div><?php }?><?php }?><?php if ($_smarty_tpl->tpl_vars['config']->value['multi_site']==1&&!empty($_smarty_tpl->tpl_vars['Row']->value['site_id'])&&!empty($_smarty_tpl->tpl_vars['Row']->value['site'])){?><?php echo $_smarty_tpl->tpl_vars['Row']->value['site'];?>
<?php }?></div><?php }?><?php } ?><div class="clear"></div></div><div class="organigramme_seperator"></div><div style="margin:auto; width:75%;"><?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Personnes']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?><?php if ($_smarty_tpl->tpl_vars['Row']->value['fonction']==005){?><div class="organigramme_responsable_musculation"><div><strong><?php echo $_smarty_tpl->tpl_vars['Row']->value['nom'];?>
 <?php echo $_smarty_tpl->tpl_vars['Row']->value['prenom'];?>
</strong></div><div><?php echo $_smarty_tpl->tpl_vars['Row']->value['fonction_libelle'];?>
</div><?php if (empty($_SESSION['utilisateur']['id_liaison'])){?><?php if (!empty($_smarty_tpl->tpl_vars['Row']->value['email'])){?><div><a href="mailto:<?php echo $_smarty_tpl->tpl_vars['Row']->value['email'];?>
"><?php echo $_smarty_tpl->tpl_vars['Row']->value['email'];?>
</a></div><?php }?><?php if (!empty($_smarty_tpl->tpl_vars['Row']->value['telephone'])){?><div><?php echo $_smarty_tpl->tpl_vars['Row']->value['telephone'];?>
</div><?php }?><?php }?><?php if ($_smarty_tpl->tpl_vars['config']->value['multi_site']==1&&!empty($_smarty_tpl->tpl_vars['Row']->value['site_id'])&&!empty($_smarty_tpl->tpl_vars['Row']->value['site'])){?><?php echo $_smarty_tpl->tpl_vars['Row']->value['site'];?>
<?php }?></div><?php }?><?php } ?><div class="clear"></div></div><div class="organigramme_seperator"></div><div style="margin:auto; width:75%;"><?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Personnes']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?><?php if ($_smarty_tpl->tpl_vars['Row']->value['fonction']==006){?><div class="organigramme_coordinateur_medicale"><div><strong><?php echo $_smarty_tpl->tpl_vars['Row']->value['nom'];?>
 <?php echo $_smarty_tpl->tpl_vars['Row']->value['prenom'];?>
</strong></div><div><?php echo $_smarty_tpl->tpl_vars['Row']->value['fonction_libelle'];?>
</div><?php if (empty($_SESSION['utilisateur']['id_liaison'])){?><?php if (!empty($_smarty_tpl->tpl_vars['Row']->value['email'])){?><div><a href="mailto:<?php echo $_smarty_tpl->tpl_vars['Row']->value['email'];?>
"><?php echo $_smarty_tpl->tpl_vars['Row']->value['email'];?>
</a></div><?php }?><?php if (!empty($_smarty_tpl->tpl_vars['Row']->value['telephone'])){?><div><?php echo $_smarty_tpl->tpl_vars['Row']->value['telephone'];?>
</div><?php }?><?php }?><?php if ($_smarty_tpl->tpl_vars['config']->value['multi_site']==1&&!empty($_smarty_tpl->tpl_vars['Row']->value['site_id'])&&!empty($_smarty_tpl->tpl_vars['Row']->value['site'])){?><?php echo $_smarty_tpl->tpl_vars['Row']->value['site'];?>
<?php }?></div><?php }?><?php } ?><div class="clear"></div></div><div class="organigramme_seperator"></div><div style="margin:auto; width:75%;"><?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Personnes']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?><?php if ($_smarty_tpl->tpl_vars['Row']->value['fonction']==007){?><div class="organigramme_kine"><div><strong><?php echo $_smarty_tpl->tpl_vars['Row']->value['nom'];?>
 <?php echo $_smarty_tpl->tpl_vars['Row']->value['prenom'];?>
</strong></div><div><?php echo $_smarty_tpl->tpl_vars['Row']->value['fonction_libelle'];?>
</div><?php if (empty($_SESSION['utilisateur']['id_liaison'])){?><?php if (!empty($_smarty_tpl->tpl_vars['Row']->value['email'])){?><div><a href="mailto:<?php echo $_smarty_tpl->tpl_vars['Row']->value['email'];?>
"><?php echo $_smarty_tpl->tpl_vars['Row']->value['email'];?>
</a></div><?php }?><?php if (!empty($_smarty_tpl->tpl_vars['Row']->value['telephone'])){?><div><?php echo $_smarty_tpl->tpl_vars['Row']->value['telephone'];?>
</div><?php }?><?php }?><?php if ($_smarty_tpl->tpl_vars['config']->value['multi_site']==1&&!empty($_smarty_tpl->tpl_vars['Row']->value['site_id'])&&!empty($_smarty_tpl->tpl_vars['Row']->value['site'])){?><?php echo $_smarty_tpl->tpl_vars['Row']->value['site'];?>
<?php }?></div><?php }?><?php } ?><div class="clear"></div></div><div class="organigramme_seperator"></div><div style="margin:auto; width:75%;"><?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Personnes']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?><?php if ($_smarty_tpl->tpl_vars['Row']->value['fonction']=='008'){?><div class="organigramme_medecin"><div><strong><?php echo $_smarty_tpl->tpl_vars['Row']->value['nom'];?>
 <?php echo $_smarty_tpl->tpl_vars['Row']->value['prenom'];?>
</strong></div><div><?php echo $_smarty_tpl->tpl_vars['Row']->value['fonction_libelle'];?>
</div><?php if (empty($_SESSION['utilisateur']['id_liaison'])){?><?php if (!empty($_smarty_tpl->tpl_vars['Row']->value['email'])){?><div><a href="mailto:<?php echo $_smarty_tpl->tpl_vars['Row']->value['email'];?>
"><?php echo $_smarty_tpl->tpl_vars['Row']->value['email'];?>
</a></div><?php }?><?php if (!empty($_smarty_tpl->tpl_vars['Row']->value['telephone'])){?><div><?php echo $_smarty_tpl->tpl_vars['Row']->value['telephone'];?>
</div><?php }?><?php }?><?php if ($_smarty_tpl->tpl_vars['config']->value['multi_site']==1&&!empty($_smarty_tpl->tpl_vars['Row']->value['site_id'])&&!empty($_smarty_tpl->tpl_vars['Row']->value['site'])){?><?php echo $_smarty_tpl->tpl_vars['Row']->value['site'];?>
<?php }?></div><?php }?><?php } ?><div class="clear"></div></div><div class="organigramme_seperator"></div><div style="margin:auto; width:75%;"><?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Personnes']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?><?php if ($_smarty_tpl->tpl_vars['Row']->value['fonction']=='009'){?><div class="organigramme_diete"><div><strong><?php echo $_smarty_tpl->tpl_vars['Row']->value['nom'];?>
 <?php echo $_smarty_tpl->tpl_vars['Row']->value['prenom'];?>
</strong></div><div><?php echo $_smarty_tpl->tpl_vars['Row']->value['fonction_libelle'];?>
</div><?php if (empty($_SESSION['utilisateur']['id_liaison'])){?><?php if (!empty($_smarty_tpl->tpl_vars['Row']->value['email'])){?><div><a href="mailto:<?php echo $_smarty_tpl->tpl_vars['Row']->value['email'];?>
"><?php echo $_smarty_tpl->tpl_vars['Row']->value['email'];?>
</a></div><?php }?><?php if (!empty($_smarty_tpl->tpl_vars['Row']->value['telephone'])){?><div><?php echo $_smarty_tpl->tpl_vars['Row']->value['telephone'];?>
</div><?php }?><?php }?><?php if ($_smarty_tpl->tpl_vars['config']->value['multi_site']==1&&!empty($_smarty_tpl->tpl_vars['Row']->value['site_id'])&&!empty($_smarty_tpl->tpl_vars['Row']->value['site'])){?><?php echo $_smarty_tpl->tpl_vars['Row']->value['site'];?>
<?php }?></div><?php }?><?php } ?><div class="clear"></div></div><div class="organigramme_seperator"></div><div style="margin:auto; width:75%;"><?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Personnes']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?><?php if ($_smarty_tpl->tpl_vars['Row']->value['fonction']=='010'){?><div class="organigramme_psycho"><div><strong><?php echo $_smarty_tpl->tpl_vars['Row']->value['nom'];?>
 <?php echo $_smarty_tpl->tpl_vars['Row']->value['prenom'];?>
</strong></div><div><?php echo $_smarty_tpl->tpl_vars['Row']->value['fonction_libelle'];?>
</div><?php if (empty($_SESSION['utilisateur']['id_liaison'])){?><?php if (!empty($_smarty_tpl->tpl_vars['Row']->value['email'])){?><div><a href="mailto:<?php echo $_smarty_tpl->tpl_vars['Row']->value['email'];?>
"><?php echo $_smarty_tpl->tpl_vars['Row']->value['email'];?>
</a></div><?php }?><?php if (!empty($_smarty_tpl->tpl_vars['Row']->value['telephone'])){?><div><?php echo $_smarty_tpl->tpl_vars['Row']->value['telephone'];?>
</div><?php }?><?php }?><?php if ($_smarty_tpl->tpl_vars['config']->value['multi_site']==1&&!empty($_smarty_tpl->tpl_vars['Row']->value['site_id'])&&!empty($_smarty_tpl->tpl_vars['Row']->value['site'])){?><?php echo $_smarty_tpl->tpl_vars['Row']->value['site'];?>
<?php }?></div><?php }?><?php } ?><div class="clear"></div></div><div class="organigramme_seperator"></div><div style="margin:auto; width:75%;"><?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Personnes']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?><?php if ($_smarty_tpl->tpl_vars['Row']->value['fonction']=='011'){?><div class="organigramme_podologue"><div><strong><?php echo $_smarty_tpl->tpl_vars['Row']->value['nom'];?>
 <?php echo $_smarty_tpl->tpl_vars['Row']->value['prenom'];?>
</strong></div><div><?php echo $_smarty_tpl->tpl_vars['Row']->value['fonction_libelle'];?>
</div><?php if (empty($_SESSION['utilisateur']['id_liaison'])){?><?php if (!empty($_smarty_tpl->tpl_vars['Row']->value['email'])){?><div><a href="mailto:<?php echo $_smarty_tpl->tpl_vars['Row']->value['email'];?>
"><?php echo $_smarty_tpl->tpl_vars['Row']->value['email'];?>
</a></div><?php }?><?php if (!empty($_smarty_tpl->tpl_vars['Row']->value['telephone'])){?><div><?php echo $_smarty_tpl->tpl_vars['Row']->value['telephone'];?>
</div><?php }?><?php }?><?php if ($_smarty_tpl->tpl_vars['config']->value['multi_site']==1&&!empty($_smarty_tpl->tpl_vars['Row']->value['site_id'])&&!empty($_smarty_tpl->tpl_vars['Row']->value['site'])){?><?php echo $_smarty_tpl->tpl_vars['Row']->value['site'];?>
<?php }?></div><?php }?><?php } ?><div class="clear"></div></div><div class="organigramme_seperator"></div><div style="margin:auto; width:75%;"><?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Personnes']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?><?php if ($_smarty_tpl->tpl_vars['Row']->value['fonction']=='012'){?><div class="organigramme_dentiste"><div><strong><?php echo $_smarty_tpl->tpl_vars['Row']->value['nom'];?>
 <?php echo $_smarty_tpl->tpl_vars['Row']->value['prenom'];?>
</strong></div><div><?php echo $_smarty_tpl->tpl_vars['Row']->value['fonction_libelle'];?>
</div><?php if (empty($_SESSION['utilisateur']['id_liaison'])){?><?php if (!empty($_smarty_tpl->tpl_vars['Row']->value['email'])){?><div><a href="mailto:<?php echo $_smarty_tpl->tpl_vars['Row']->value['email'];?>
"><?php echo $_smarty_tpl->tpl_vars['Row']->value['email'];?>
</a></div><?php }?><?php if (!empty($_smarty_tpl->tpl_vars['Row']->value['telephone'])){?><div><?php echo $_smarty_tpl->tpl_vars['Row']->value['telephone'];?>
</div><?php }?><?php }?><?php if ($_smarty_tpl->tpl_vars['config']->value['multi_site']==1&&!empty($_smarty_tpl->tpl_vars['Row']->value['site_id'])&&!empty($_smarty_tpl->tpl_vars['Row']->value['site'])){?><?php echo $_smarty_tpl->tpl_vars['Row']->value['site'];?>
<?php }?></div><?php }?><?php } ?><div class="clear"></div></div><div class="organigramme_seperator"></div><div style="margin:auto; width:75%;"><?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Personnes']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?><?php if ($_smarty_tpl->tpl_vars['Row']->value['fonction']=='013'){?><div class="organigramme_suivi_scolaire"><div><strong><?php echo $_smarty_tpl->tpl_vars['Row']->value['nom'];?>
 <?php echo $_smarty_tpl->tpl_vars['Row']->value['prenom'];?>
</strong></div><div><?php echo $_smarty_tpl->tpl_vars['Row']->value['fonction_libelle'];?>
</div><?php if (empty($_SESSION['utilisateur']['id_liaison'])){?><?php if (!empty($_smarty_tpl->tpl_vars['Row']->value['email'])){?><div><a href="mailto:<?php echo $_smarty_tpl->tpl_vars['Row']->value['email'];?>
"><?php echo $_smarty_tpl->tpl_vars['Row']->value['email'];?>
</a></div><?php }?><?php if (!empty($_smarty_tpl->tpl_vars['Row']->value['telephone'])){?><div><?php echo $_smarty_tpl->tpl_vars['Row']->value['telephone'];?>
</div><?php }?><?php }?><?php if ($_smarty_tpl->tpl_vars['config']->value['multi_site']==1&&!empty($_smarty_tpl->tpl_vars['Row']->value['site_id'])&&!empty($_smarty_tpl->tpl_vars['Row']->value['site'])){?><?php echo $_smarty_tpl->tpl_vars['Row']->value['site'];?>
<?php }?></div><?php }?><?php } ?><div class="clear"></div></div><div class="organigramme_seperator"></div><div style="margin:auto; width:75%;"><?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Personnes']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?><?php if ($_smarty_tpl->tpl_vars['Row']->value['fonction']=='015'){?><div class="organigramme_acc"><div><strong><?php echo $_smarty_tpl->tpl_vars['Row']->value['nom'];?>
 <?php echo $_smarty_tpl->tpl_vars['Row']->value['prenom'];?>
</strong></div><div><?php echo $_smarty_tpl->tpl_vars['Row']->value['fonction_libelle'];?>
</div><?php if (empty($_SESSION['utilisateur']['id_liaison'])){?><?php if (!empty($_smarty_tpl->tpl_vars['Row']->value['email'])){?><div><a href="mailto:<?php echo $_smarty_tpl->tpl_vars['Row']->value['email'];?>
"><?php echo $_smarty_tpl->tpl_vars['Row']->value['email'];?>
</a></div><?php }?><?php if (!empty($_smarty_tpl->tpl_vars['Row']->value['telephone'])){?><div><?php echo $_smarty_tpl->tpl_vars['Row']->value['telephone'];?>
</div><?php }?><?php }?><?php if ($_smarty_tpl->tpl_vars['config']->value['multi_site']==1&&!empty($_smarty_tpl->tpl_vars['Row']->value['site_id'])&&!empty($_smarty_tpl->tpl_vars['Row']->value['site'])){?><?php echo $_smarty_tpl->tpl_vars['Row']->value['site'];?>
<?php }?></div><?php }?><?php } ?><div class="clear"></div></div></div><?php }} ?>