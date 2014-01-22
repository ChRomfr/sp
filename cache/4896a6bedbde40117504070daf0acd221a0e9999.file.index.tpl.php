<?php /* Smarty version Smarty-3.1.13, created on 2014-01-20 16:22:36
         compiled from "D:\wamp\www\goliathv2\app\view\programmation\index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2668152dd3f3c737955-40944940%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '4896a6bedbde40117504070daf0acd221a0e9999' => 
    array (
      0 => 'D:\\wamp\\www\\goliathv2\\app\\view\\programmation\\index.tpl',
      1 => 1364855788,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2668152dd3f3c737955-40944940',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'lang' => 0,
    'Date' => 0,
    'Previous' => 0,
    'Next' => 0,
    'Calendar' => 0,
    'Equipes' => 0,
    'Row' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_52dd3f3c9ced50_66974200',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_52dd3f3c9ced50_66974200')) {function content_52dd3f3c9ced50_66974200($_smarty_tpl) {?>
<div class="well">
	<?php if ($_SESSION['acl']['gest_programmation']==1){?>
	<div class="fright">
		<a href="javascript:getFormAdd();"><i class="icon icon-plus"></i></a>
	</div>
	<?php }?>
	<h1><?php echo $_smarty_tpl->tpl_vars['lang']->value['Programmation'];?>
</h1>
	<div class="clear"></div>
	<div style="margin:auto; width:1000px;">
		<div class="center"><strong><?php echo $_smarty_tpl->tpl_vars['Date']->value['month_txt'];?>
 <?php echo $_smarty_tpl->tpl_vars['Date']->value['year'];?>
</strong></div>
		<div class="fleft"><a href="<?php echo getLink("programmation/index".((string)$_smarty_tpl->tpl_vars['Previous']->value));?>
<?php if (isset($_GET['equipe'])){?>&equipe=<?php echo $_GET['equipe'];?>
<?php }?>" title="Previous"><<</a></div>		
		<div class="fright"><a href="<?php echo getLink("programmation/index".((string)$_smarty_tpl->tpl_vars['Next']->value));?>
<?php if (isset($_GET['equipe'])){?>&equipe=<?php echo $_GET['equipe'];?>
<?php }?>" title="Next">>></a></div>
		<div class="clear"></div>
		<div><?php echo $_smarty_tpl->tpl_vars['Calendar']->value;?>
</div>
	</div>
	<?php if (!empty($_smarty_tpl->tpl_vars['Equipes']->value)&&count($_smarty_tpl->tpl_vars['Equipes']->value)>1){?>
	<div class="fright">
		<?php echo $_smarty_tpl->tpl_vars['lang']->value['Equipes'];?>
 : 
			<select id="equipe" onchange="reloadPage()">
				<option></option>
				<?php  $_smarty_tpl->tpl_vars['Row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['Row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['Equipes']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['Row']->key => $_smarty_tpl->tpl_vars['Row']->value){
$_smarty_tpl->tpl_vars['Row']->_loop = true;
?>
				<option value="<?php echo $_smarty_tpl->tpl_vars['Row']->value['id'];?>
" <?php if (isset($_GET['equipe'])&&$_GET['equipe']==$_smarty_tpl->tpl_vars['Row']->value['id']){?>selected="selected"<?php }?>><?php echo $_smarty_tpl->tpl_vars['Row']->value['nom'];?>
</option>
				<?php } ?>
			</select>
	</div>
	<div class="clear"></div>
	<?php }?>
</div>

<div id="diag-programmation"></div>

<div id="modal-programmation" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"></div>

<script>
<!--
$(function() {
    $("#diag-programmation").dialog({ autoOpen: false, width:600 });
});

function reloadPage(){
	
	var equipe = $("#equipe").val();
	
	if( equipe == '' ){
		window.location.href = '<?php echo getLink("programmation/index");?>
';
	}else{
		window.location.href = '<?php echo getLink("programmation/index?equipe='+ equipe +'");?>
';
	}
	
}

<?php if ($_SESSION['acl']['gest_programmation']==1){?>
function getFormAdd(cdate, moment){

	if (!cdate) { cdate = ''; } 
	if (!moment) { moment = ''; } 
	
	$('#modal-programmation').html("");
	$.get(
		'<?php echo getLink("programmation/ajaxFormAddProg");?>
',
        {nohtml:'nohtml', cdate:cdate, moment:moment},
        function(data){ $('#modal-programmation').html(data); }

    )
    
	$('#modal-programmation').modal('show');
}
<?php }?>

function getDetail(pid){
	$('#modal-programmation').html("");
	$.get(
		'<?php echo getLink("programmation/ajaxDetailProg/'+pid+'");?>
',
        {nohtml:'nohtml'},
        function(data){ $('#modal-programmation').html(data); }
    )
    
	
	$('#modal-programmation').modal('show');
}

//-->
</script><?php }} ?>