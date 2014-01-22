<?php /* Smarty version Smarty-3.1.13, created on 2014-01-20 16:10:58
         compiled from "D:\wamp\www\goliathv2\app\view\musculation\index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:797752dd3c82ab8a81-01962060%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'f3163440903b9d9f01f682eb565904ce7964ddef' => 
    array (
      0 => 'D:\\wamp\\www\\goliathv2\\app\\view\\musculation\\index.tpl',
      1 => 1361035317,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '797752dd3c82ab8a81-01962060',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'config' => 0,
    'lang' => 0,
    'Exercices' => 0,
    'Row' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_52dd3c82f06f15_78675549',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_52dd3c82f06f15_78675549')) {function content_52dd3c82f06f15_78675549($_smarty_tpl) {?><script>
function getZone(zone_id){

	if( zone_id < 10 ){
		$('#imgface').html('<img alt="muscu_face_400.png" usemap="#muscu_face_400" src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
web/images/muscu_face_400_zone'+zone_id+'.png"/>'); 
	}else{
		$('#imgdos').html('<img alt="muscu_dos_400.png" usemap="#muscu_dos_400" src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
web/images/muscu_dos_400_zone'+zone_id+'.png"/>'); 
	}
	
	$.get(
        '<?php echo getLink("muscu/getZone");?>
',
        {zone:zone_id, nohtml:'nohtml'},
        function(data){ $('#muscles_works').html(data); }
    )
    
}

function clearMuscle(){
	$('#imgface').html('<img alt="muscu_face_400.png" usemap="#muscu_face_400" src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
web/images/muscu_face_400.png"/>');
	$('#imgdos').html('<img alt="muscu_dos_400.png" usemap="#muscu_dos_400" src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
web/images/muscu_dos_400.png"/>');
	$('#muscles_works').html("");
}

</script>
<?php if (@constant('BREAD')==1){?><ul class="breadcrumb"><li><a href="<?php echo getLink("index/index");?>
" title="<?php echo $_smarty_tpl->tpl_vars['lang']->value['Accueil'];?>
"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Accueil'];?>
</a><span class="divider">/</span></li><li><?php echo $_smarty_tpl->tpl_vars['lang']->value['Musculation'];?>
</li></ul><?php }?><div class="well"><?php if ($_SESSION['acl']['gest_muscu']==true){?><div class="fright"><a href="<?php echo getLink("musculation/addExercice");?>
" title=""><img src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
web/images/add.png" /></a></div><?php }?><h1><?php echo $_smarty_tpl->tpl_vars['lang']->value['Musculation'];?>
</h1><div style="clear:both;"></div><div class="fleft" id="muscles_works" style="height:10px;"></div><div style="clear:both;"></div><div class="fleft" style="width:100%; margin:auto;"><table style="margin:auto;"><tr><td><!-- FACE --><div id="imgface"><img alt="muscu_face_400.png" usemap="#muscu_face_400" src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
web/images/muscu_face_400.png"/></div><map id="muscu_face_400" name="muscu_face_400"><area alt="zone1" href="<?php echo getLink("musculation/index?zone=1");?>
" onmouseover="javascript:getZone(1);" onmouseout="javascript:clearMuscle();" shape="rect" coords="40,98,110,131"/><area alt="zone2" href="<?php echo getLink("musculation/index?zone=2");?>
" onmouseover="javascript:getZone(2);" onmouseout="javascript:clearMuscle();" shape="rect" coords="40,137,108,182"/><area alt="zone3" href="<?php echo getLink("musculation/index?zone=3");?>
" onmouseover="javascript:getZone(3);" onmouseout="javascript:clearMuscle();" shape="rect" coords="20,75,36,110"/><area alt="zone4" href="<?php echo getLink("musculation/index?zone=4");?>
" onmouseover="javascript:getZone(4);" onmouseout="javascript:clearMuscle();" shape="rect" coords="16,116,34,150"/><area alt="zone5" href="<?php echo getLink("musculation/index?zone=5");?>
" onmouseover="javascript:getZone(5);" onmouseout="javascript:clearMuscle();" shape="rect" coords="8,158,22,206"/><area alt="zone6" href="<?php echo getLink("musculation/index?zone=6");?>
" onmouseover="javascript:getZone(6);" onmouseout="javascript:clearMuscle();" shape="rect" coords="115,160,130,213"/><area alt="zone7" href="<?php echo getLink("musculation/index?zone=7");?>
" onmouseover="javascript:getZone(7);" onmouseout="javascript:clearMuscle();" shape="rect" coords="83,48,97,78"/><area alt="zone8" href="<?php echo getLink("musculation/index?zone=8");?>
" onmouseover="javascript:getZone(8);" onmouseout="javascript:clearMuscle();" shape="rect" coords="45,342,60,364"/><area alt="zone9" href="<?php echo getLink("musculation/index?zone=9");?>
" onmouseover="javascript:getZone(9);" onmouseout="javascript:clearMuscle();" shape="rect" coords="75,207,110,282"/></map></td><td><!-- DOS --><div id="imgdos"><img alt="muscu_dos_400.png" usemap="#muscu_dos_400" src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
web/images/muscu_dos_400.png"/></div><map id="muscu_dos_400" name="muscu_dos_400"><area title="" alt="zone10" href="<?php echo getLink("musculation/index?zone=10");?>
" onmouseover="javascript:getZone(10);" onmouseout="javascript:clearMuscle();" shape="rect" coords="68,42,105,65"/><area title="" alt="zone11" href="<?php echo getLink("musculation/index?zone=11");?>
" onmouseover="javascript:getZone(11);" onmouseout="javascript:clearMuscle();" shape="rect" coords="20,80,42,112"/><area alt="zone12" href="<?php echo getLink("musculation/index?zone=12");?>
" onmouseover="javascript:getZone(12);" onmouseout="javascript:clearMuscle();" shape="rect" coords="17,116,35,160"/><area alt="zone13" href="<?php echo getLink("musculation/index?zone=13");?>
" onmouseover="javascript:getZone(13);" onmouseout="javascript:clearMuscle();" shape="rect" coords="52,81,119,130"/><area alt="zone14" href="<?php echo getLink("musculation/index?zone=14");?>
" onmouseover="javascript:getZone(14);" onmouseout="javascript:clearMuscle();" shape="rect" coords="55,141,114,176"/><area alt="zone15" href="<?php echo getLink("musculation/index?zone=15");?>
" onmouseover="javascript:getZone(15);" onmouseout="javascript:clearMuscle();" shape="rect" coords="49,191,119,239"/><area alt="zone16" href="<?php echo getLink("musculation/index?zone=16");?>
" onmouseover="javascript:getZone(16);" onmouseout="javascript:clearMuscle();" shape="rect" coords="43,250,70,289"/><area alt="zone16" href="<?php echo getLink("musculation/index?zone=16");?>
" onmouseover="javascript:getZone(16);" onmouseout="javascript:clearMuscle();" shape="rect" coords="91,245,115,285"/><area alt="zone17" href="<?php echo getLink("musculation/index?zone=17");?>
" onmouseover="javascript:getZone(17);" onmouseout="javascript:clearMuscle();" shape="rect" coords="42,340,62,371"/><area alt="zone17" href="<?php echo getLink("musculation/index?zone=17");?>
" onmouseover="javascript:getZone(17);" onmouseout="javascript:clearMuscle();" shape="rect" coords="89,334,105,371"/></map></td></tr></table></div><table class="table table-condensed table-striped table-bordered"><?php if ($_SESSION['acl']['gest_muscu']==1){?><form method="get" action="<?php echo getLink("muscu/seanceAdd");?>
"><?php }?><thead><tr><td>#</td><td><?php echo $_smarty_tpl->tpl_vars['lang']->value['Exercice'];?>
</td><td><?php echo $_smarty_tpl->tpl_vars['lang']->value['Zone'];?>
</td><td><?php echo $_smarty_tpl->tpl_vars['lang']->value['Muscle_travaille'];?>
</td><?php if ($_SESSION['acl']['gest_muscu']==1){?><td></td><?php }?></tr></thead><tbody><?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Exercices']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?><tr><td><?php echo $_smarty_tpl->tpl_vars['Row']->value['id'];?>
</td><td><a href="<?php echo getLink("musculation/ficheExercice/".((string)$_smarty_tpl->tpl_vars['Row']->value['id']));?>
" title=""><?php echo $_smarty_tpl->tpl_vars['Row']->value['nom'];?>
</a></td><td><?php echo $_smarty_tpl->tpl_vars['Row']->value['zones'];?>
</td><td><?php echo $_smarty_tpl->tpl_vars['Row']->value['muscles'];?>
</td><?php if ($_SESSION['acl']['gest_muscu']==1){?><td class="center"><input type="checkbox" name="exercice[<?php echo $_smarty_tpl->tpl_vars['Row']->value['id'];?>
]" value="<?php echo $_smarty_tpl->tpl_vars['Row']->value['id'];?>
" /></td><?php }?></tr><?php } ?><?php if ($_SESSION['acl']['gest_muscu']==1){?><tr><td colspan="5" style="text-align:right;"><input type="submit" class="btn" value="<?php echo $_smarty_tpl->tpl_vars['lang']->value['Creer_une_seance'];?>
" /></td></tr></form><?php }?></tbody></table><?php if (isset($_GET['zone'])){?><div class="fright"><a href="<?php echo getLink("musculation/index");?>
" title=""><?php echo $_smarty_tpl->tpl_vars['lang']->value['Tous'];?>
</a></div><div class="clear"></div><?php }?></div><?php }} ?>