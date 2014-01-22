<?php /* Smarty version Smarty-3.1.13, created on 2014-01-20 15:36:31
         compiled from "D:\wamp\www\goliathv2\app\view\administration\index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2997652dd346fc15d44-20174165%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '84e4ae6791b8cd11e399241895279a1983cef968' => 
    array (
      0 => 'D:\\wamp\\www\\goliathv2\\app\\view\\administration\\index.tpl',
      1 => 1357493799,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2997652dd346fc15d44-20174165',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'lang' => 0,
    'Stats' => 0,
    'InfosInstall' => 0,
    'config' => 0,
    'Row' => 0,
    'Module_form_perso' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_52dd346feb4403_83996449',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_52dd346feb4403_83996449')) {function content_52dd346feb4403_83996449($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_date_format')) include 'D:\\wamp\\www\\goliathv2\\kernel\\lib\\smarty\\plugins\\modifier.date_format.php';
?><script type="text/javascript">
function getDevUpdate(){
  $.get(
        '<?php echo getLink("administration/devActuAjaxGet");?>
',
        {nohtml:'nohtml'},
        function(data){ $('#contener_dev_actus').html(data); }
    )
    
}
</script>
<div id="bread"><a href="<?php echo getLink("index/index");?>
" title="<?php echo $_smarty_tpl->tpl_vars['lang']->value['Accueil'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Accueil'];?>
</a>&nbsp;>>&nbsp;<?php echo $_smarty_tpl->tpl_vars['lang']->value['Administration'];?>
</div><div class="showData"><h1>Stats</h1><ul><li><?php echo $_smarty_tpl->tpl_vars['lang']->value['Joueurs'];?>
 : <?php echo $_smarty_tpl->tpl_vars['Stats']->value['NbJoueurs'];?>
</li><li><?php echo $_smarty_tpl->tpl_vars['lang']->value['Utilisateurs'];?>
 : <?php echo $_smarty_tpl->tpl_vars['Stats']->value['NbUtilisateurs'];?>
</li><li><?php echo $_smarty_tpl->tpl_vars['lang']->value['Clubs'];?>
 : <?php echo $_smarty_tpl->tpl_vars['Stats']->value['NbClubs'];?>
</li><li><?php echo $_smarty_tpl->tpl_vars['lang']->value['Entrainements'];?>
 : <?php echo $_smarty_tpl->tpl_vars['Stats']->value['NbEntrainements'];?>
</li></ul></div><div class="showData"><h1>Install information</h1><ul><li>Date of installation : <strong><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['InfosInstall']->value['i_date_install'],$_smarty_tpl->tpl_vars['config']->value['format_date_day']);?>
</strong></li><li>Date of expiration: <strong><?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['InfosInstall']->value['i_date_expire'],$_smarty_tpl->tpl_vars['config']->value['format_date_day']);?>
</strong></li><li>ID : <strong><?php echo $_smarty_tpl->tpl_vars['config']->value['id_install'];?>
</strong></li><li>Type of install : <strong><?php echo $_smarty_tpl->tpl_vars['InfosInstall']->value['i_type'];?>
</strong></li><?php if ($_smarty_tpl->tpl_vars['InfosInstall']->value['i_type']=='full'){?><li>Password default player : <strong>aze.123</strong></li><?php }?><?php if (count($_smarty_tpl->tpl_vars['config']->value['modules'])>0){?><li>Modules :<ul><?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['config']->value['modules']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?><li><?php echo $_smarty_tpl->tpl_vars['Row']->value['m_name'];?>
</li><?php } ?></ul></li><?php }?></ul></div><div class="showData"><li><a href="<?php echo getLink("administration/etabScolaireIndex");?>
" title="<?php echo $_smarty_tpl->tpl_vars['lang']->value['Etablissement_scolaire'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Etablissement_scolaire'];?>
</a></li><li><a href="<?php echo getLink("administration/setting");?>
" title="<?php echo $_smarty_tpl->tpl_vars['lang']->value['Preferences'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Preferences'];?>
</a></li><?php if ($_smarty_tpl->tpl_vars['Module_form_perso']->value==true){?><li><a href="<?php echo getLink("administration/formIndex");?>
" title=""><?php echo $_smarty_tpl->tpl_vars['lang']->value['Personnalisation_formulaires'];?>
</a></li><?php }?></div><div id="contener_dev_actus"></div>
<script type="text/javascript">
  getDevUpdate();
</script>
<?php }} ?>