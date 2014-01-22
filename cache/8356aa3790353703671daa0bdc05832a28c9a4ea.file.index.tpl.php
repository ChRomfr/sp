<?php /* Smarty version Smarty-3.1.13, created on 2014-01-21 09:11:34
         compiled from "D:\wamp\www\goliathv2\kernel\base_app\view\connexion\index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2800952de2bb6656f06-85976042%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '8356aa3790353703671daa0bdc05832a28c9a4ea' => 
    array (
      0 => 'D:\\wamp\\www\\goliathv2\\kernel\\base_app\\view\\connexion\\index.tpl',
      1 => 1384763269,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2800952de2bb6656f06-85976042',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'config' => 0,
    'Error_login' => 0,
    'lang' => 0,
    'Helper' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_52de2bb6a08ce1_57460486',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_52de2bb6a08ce1_57460486')) {function content_52de2bb6a08ce1_57460486($_smarty_tpl) {?><!-- base_app/view/connexion/index.tpl --><?php if (isset($_smarty_tpl->tpl_vars['config']->value['bootstrap_version'])&&$_smarty_tpl->tpl_vars['config']->value['bootstrap_version']==3){?><ol class="breadcrumb"><li><a href="" title="">Accueil</a></li><li class="active">Connexion</li></ol><div class="well"><?php if (isset($_smarty_tpl->tpl_vars['Error_login']->value)&&!empty($_smarty_tpl->tpl_vars['Error_login']->value)){?><div class="alert"><button type="button" class="close" data-dismiss="alert">&times;</button><strong><?php echo $_smarty_tpl->tpl_vars['Error_login']->value;?>
</strong></div><?php }?><form method="post" action="#" id="formLogin"><fieldset><legend><?php echo $_smarty_tpl->tpl_vars['lang']->value['Connexion'];?>
</legend><div class="container"><div class="row"><div class="col-md-4"><label for="identifiant"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Identifiant'];?>
 :</label><div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span><input autofocus type="text" name="login[identifiant]" id="identifiant" required class="form-control" /></div></div><!-- /span4 --><div class="col-md-4"><label class="control-label" for="password"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Mot_de_passe'];?>
 :</label><div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span><input type="password" name="login[password]" id="password" required class="form-control"/></div><span class="help-block"><a href="<?php echo $_smarty_tpl->tpl_vars['Helper']->value->getLink("connexion/lostPassword");?>
" title="<?php echo $_smarty_tpl->tpl_vars['lang']->value['Mot_de_passe_perdu'];?>
" class="muted"><small><?php echo $_smarty_tpl->tpl_vars['lang']->value['Mot_de_passe_perdu'];?>
</small></a></span></div><!-- /span4 --></div><!-- /row --><div class="row"><div class="col-md-8"><div class="form-actions text-center"><?php if (isset($_SERVER['HTTP_REFERER'])){?><input type="hidden" name="referer" value="<?php echo $_SERVER['HTTP_REFERER'];?>
" /><?php }?><button type="submit" name="send" class="btn btn-primary"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Connexion'];?>
</button></div></div></div><!-- /row --><div class="row"><hr/><div class="col-md-1"><i class="glyphicon glyphicon-flag"></i></div><div class="col-md-7"><div>Pas encore inscrit ?</div><div><a href="<?php echo $_smarty_tpl->tpl_vars['Helper']->value->getLink("utilisateur/register");?>
" title="<?php echo $_smarty_tpl->tpl_vars['lang']->value['S_enregistrer'];?>
">Creer un compte</a></div></div></div><!-- /row --></div><!-- /container --><?php if ($_smarty_tpl->tpl_vars['config']->value['register_open']==1){?>&nbsp;&nbsp;<?php }?><!-- </div> --></fieldset></form></div><!-- /well --><?php }else{ ?><div style="padding-top:15px;"></div><div class="well"><?php if (isset($_smarty_tpl->tpl_vars['Error_login']->value)&&!empty($_smarty_tpl->tpl_vars['Error_login']->value)){?><div class="alert"><button type="button" class="close" data-dismiss="alert">&times;</button><strong><?php echo $_smarty_tpl->tpl_vars['Error_login']->value;?>
</strong></div><?php }?><form method="post" action="" id="formLogin"><fieldset><legend><?php echo $_smarty_tpl->tpl_vars['lang']->value['Connexion'];?>
</legend><div class="container-fluid"><div class="row-fluid"><div class="span4"><label for="identifiant"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Identifiant'];?>
 :</label><div class="input-prepend"><span class="add-on"><i class="icon-user"></i></span><input autofocus type="text" name="login[identifiant]" id="identifiant" required /></div></div><!-- /span4 --><div class="span4"><label class="control-label" for="password"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Mot_de_passe'];?>
 :</label><div class="input-prepend"><span class="add-on"><i class="icon-lock"></i></span><input type="password" name="login[password]" id="password" required /></div><span class="help-block"><a href="<?php echo $_smarty_tpl->tpl_vars['Helper']->value->getLink("connexion/lostPassword");?>
" title="<?php echo $_smarty_tpl->tpl_vars['lang']->value['Mot_de_passe_perdu'];?>
" class="muted"><small><?php echo $_smarty_tpl->tpl_vars['lang']->value['Mot_de_passe_perdu'];?>
</small></a></span></div><!-- /span4 --></div><!-- /row --><div class="row-fluid"><div class="span8"><div class="form-actions text-center"><?php if (isset($_SERVER['HTTP_REFERER'])){?><input type="hidden" name="referer" value="<?php echo $_SERVER['HTTP_REFERER'];?>
" /><?php }?><button type="submit" name="send" class="btn btn-primary"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Connexion'];?>
</button></div></div></div><div class="row-fluid"><div class="span1"><i class="icon-flag icon-4x"></i></div><div class="span7"><div>Pas encore inscrit ?</div><div><a href="<?php echo $_smarty_tpl->tpl_vars['Helper']->value->getLink("utilisateur/register");?>
" title="<?php echo $_smarty_tpl->tpl_vars['lang']->value['S_enregistrer'];?>
">Creer un compte</a></div></div></div></div><!-- /container --><?php if ($_smarty_tpl->tpl_vars['config']->value['register_open']==1){?>&nbsp;&nbsp;<?php }?></div></fieldset></form></div><!-- /well --><?php }?>
<script type="text/javascript">
<!--
jQuery(document).ready(function(){
	$("#formLogin").validate({
		rules:{
			"login[password]":{
				required:true,
			},
			"login[identifiant]":{
				required:true,
			},
		},
		highlight:function(element)
        {
            $(element).parents('.control-group').removeClass('success');
            $(element).parents('.control-group').addClass('error');
        },
        unhighlight: function(element)
        {
            $(element).parents('.control-group').removeClass('error');
            $(element).parents('.control-group').addClass('success');
        }
	});
});
//-->
</script><?php }} ?>