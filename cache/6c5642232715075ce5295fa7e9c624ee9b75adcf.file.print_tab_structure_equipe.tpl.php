<?php /* Smarty version Smarty-3.1.13, created on 2014-01-21 12:18:58
         compiled from "D:\wamp\www\goliathv2\app\view\joueur\print_tab_structure_equipe.tpl" */ ?>
<?php /*%%SmartyHeaderCode:334252de57a2e9d916-54741103%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '6c5642232715075ce5295fa7e9c624ee9b75adcf' => 
    array (
      0 => 'D:\\wamp\\www\\goliathv2\\app\\view\\joueur\\print_tab_structure_equipe.tpl',
      1 => 1359052355,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '334252de57a2e9d916-54741103',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'config' => 0,
    'js_add' => 0,
    'v' => 0,
    'Joueur' => 0,
    'lang' => 0,
    'Structure' => 0,
    'EquipesJoueur' => 0,
    'Row' => 0,
    'Joueurs' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_52de57a331f224_00286596',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_52de57a331f224_00286596')) {function content_52de57a331f224_00286596($_smarty_tpl) {?><!DOCTYPE html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
themes/default/design.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
themes/default/print.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
themes/default/design.css" type="text/css" media="print" />
	<link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
themes/default/print.css" type="text/css" media="print" />
	<?php if (!empty($_smarty_tpl->tpl_vars['js_add']->value)){?>
		<?php  $_smarty_tpl->tpl_vars['v'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['v']->_loop = false;
 $_smarty_tpl->tpl_vars['k'] = new Smarty_Variable;
 $_from = $_smarty_tpl->tpl_vars['js_add']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['v']->key => $_smarty_tpl->tpl_vars['v']->value){
$_smarty_tpl->tpl_vars['v']->_loop = true;
 $_smarty_tpl->tpl_vars['k']->value = $_smarty_tpl->tpl_vars['v']->key;
?>
		<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
web/js/<?php echo $_smarty_tpl->tpl_vars['v']->value;?>
"></script>
		<?php } ?>
	<?php }?>
</head>
<body>
	
<script>
function getEnTete(){
    $.get(
        '<?php echo getLink("joueur/ajaxGetEnTetePourImpression/".((string)$_smarty_tpl->tpl_vars['Joueur']->value->id));?>
',
        {nohtml:'nohtml'},
        function(data){ $('#enTete').html(data); }
    )
    
}	
</script>
	
	<div id="enTete"></div>
	
	<table class="tadmin" >
		
		<?php if ($_smarty_tpl->tpl_vars['config']->value['sport_champ_poste']==1){?>
	    <tr>
	        <th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Poste'];?>
</th>
	        <td><?php echo $_smarty_tpl->tpl_vars['Joueur']->value->poste;?>
</td>
	    </tr>
	    <?php }?>
	    
	    <?php if ($_smarty_tpl->tpl_vars['config']->value['sport_champ_selection']==1){?>
	    <tr>
	        <th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Selection'];?>
</th>
	        <td><?php echo $_smarty_tpl->tpl_vars['Joueur']->value->selection;?>
</td>
	    </tr>
	    <?php }?>
	    
	    <?php if ($_smarty_tpl->tpl_vars['config']->value['sport_champ_structure']==1&&!empty($_smarty_tpl->tpl_vars['Structure']->value)){?>
	    <tr><td class="center" colspan="2"><strong><?php echo $_smarty_tpl->tpl_vars['lang']->value['Structure'];?>
</strong></td></tr>
		<tr>
			<th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Structure'];?>
</td>
			<td><?php echo $_smarty_tpl->tpl_vars['Structure']->value['nom'];?>
</td>
		</tr>
		<tr>
			<th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Adresse'];?>
</th>
			<td><?php echo $_smarty_tpl->tpl_vars['Structure']->value['adresse'];?>
<br/><?php echo $_smarty_tpl->tpl_vars['Structure']->value['code_postal'];?>
 <?php echo $_smarty_tpl->tpl_vars['Structure']->value['ville'];?>
</td>
		</tr>
		<tr>
			<th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Telephone'];?>
</th>
			<td><?php echo $_smarty_tpl->tpl_vars['Structure']->value['telephone'];?>
</td>
		</tr>
	    	<?php if ($_smarty_tpl->tpl_vars['Structure']->value['email']!=''){?>
		<tr>
			<th><?php echo $_smarty_tpl->tpl_vars['lang']->value['Email'];?>
</th>
			<td><?php echo $_smarty_tpl->tpl_vars['Structure']->value['email'];?>
</th>
		</tr>
	    	<?php }?>
	    <?php }?>
	</table>
	
	<?php if (isset($_smarty_tpl->tpl_vars['EquipesJoueur']->value)&&count($_smarty_tpl->tpl_vars['EquipesJoueur']->value)>0){?>
	<h1><?php echo $_smarty_tpl->tpl_vars['lang']->value['Equipes'];?>
</h1>
	<div class="clear"></div>	
	<table class="tadmin">
		<thead>
			<tr>
				<td><?php echo $_smarty_tpl->tpl_vars['lang']->value['Equipe'];?>
</td>
			</tr>
		</thead>
		<tbody>
		<?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['EquipesJoueur']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?>
		<tr>
			<td><a href="javascript:getEquipeDetail(<?php echo $_smarty_tpl->tpl_vars['Row']->value['id'];?>
);" title="<?php echo $_smarty_tpl->tpl_vars['lang']->value['Detail'];?>
"><?php echo $_smarty_tpl->tpl_vars['Row']->value['nom'];?>
</a></td>
		</tr>
		<?php } ?>
		</tbody>
	</table>
	<?php }?>
	
	<?php if ($_smarty_tpl->tpl_vars['config']->value['view_joueur_club']==true&&$_smarty_tpl->tpl_vars['config']->value['sport_champ_structure']==1&&!empty($_smarty_tpl->tpl_vars['Joueurs']->value)){?>
	<h1><?php echo $_smarty_tpl->tpl_vars['lang']->value['Joueurs_dans_la_meme_stucture'];?>
</h1>
	<table class="tadmin">
		<thead>
			<td><?php echo $_smarty_tpl->tpl_vars['lang']->value['Nom'];?>
</td>
			<td><?php echo $_smarty_tpl->tpl_vars['lang']->value['Prenom'];?>
</td>
		</thead>
		<tbody>
			<?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Joueurs']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?>
			<tr>
				<td><?php echo $_smarty_tpl->tpl_vars['Row']->value['nom'];?>
</td>
				<td><?php echo $_smarty_tpl->tpl_vars['Row']->value['prenom'];?>
</td>
			</tr>
			<?php } ?>
		</tbody>
	</table>
	<?php }?>
		
<script>
getEnTete();
</script>	
</body>
</html>
<?php }} ?>