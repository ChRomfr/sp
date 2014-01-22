<?php /* Smarty version Smarty-3.1.13, created on 2014-01-21 09:31:59
         compiled from "D:\wamp\www\goliathv2\app\view\joueur\fiche_tab_physique.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1258252de307f941042-91285716%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '1d480dc3fcc4018bc95f5a37bb084f0310f67405' => 
    array (
      0 => 'D:\\wamp\\www\\goliathv2\\app\\view\\joueur\\fiche_tab_physique.tpl',
      1 => 1367953743,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1258252de307f941042-91285716',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'lang' => 0,
    'joueur_id' => 0,
    'Helper' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_52de307fb20f04_38039787',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_52de307fb20f04_38039787')) {function content_52de307fb20f04_38039787($_smarty_tpl) {?>	
<!-- LIEN IMPRESSION -->
<?php if (!isset($_GET['printer'])){?>
<div class="pull-right">
	<?php if ($_SESSION['acl']['gest_joueur']==true){?>
	<a href="#modal-form-morpho" role="button" data-toggle="modal" title="<?php echo $_smarty_tpl->tpl_vars['lang']->value['Ajout_donnees'];?>
"><i class="icon icon-plus"></i></a>&nbsp;&nbsp;	
	<a href="javascript:openListeData();"><i class="icon icon-table"></i></a>&nbsp;&nbsp;
	<?php }?>
	<a href="<?php echo getLink("joueur/getPhysiqueInfo/".((string)$_smarty_tpl->tpl_vars['joueur_id']->value)."?printer&sportifinfo&sportif_id=".((string)$_smarty_tpl->tpl_vars['joueur_id']->value));?>
" title="Print" target="_blank"><i class="icon icon-print"></i></a>&nbsp;&nbsp;
</div>
<div class="clearfix"></div>
<?php }?>

<div class="well">
	<div id="chartTaille"></div>
	<div id="chartPoids"></div>
	<div id="chartImg"></div>
</div>
	
<?php if (!isset($_GET['printer'])){?>
	<?php if ($_SESSION['acl']['gest_joueur']==true){?>
	
	<div id="dialog_data_physique" title=""></div>

	<!-- Modal -->
	<div id="modal-morpho" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-header">
	    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	    <h4 id="myModalLabel">Details</h4>
	  </div>
	  <div class="modal-body" id="modal-morpho-content">	    
	  </div>
	  <div class="modal-footer">
	    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
	  </div>
	</div>
 
	<!-- Modal -->
	<div id="modal-form-morpho" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-header">
	    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	    <h4 id="myModalLabel"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Ajout_donnees'];?>
</h4>
	  </div>
	  <div class="modal-body">
	    <form method="post" action="<?php echo $_smarty_tpl->tpl_vars['Helper']->value->getLink("joueur/addDataPhysique/".((string)$_smarty_tpl->tpl_vars['joueur_id']->value));?>
" class="form-horizontal">
            <div class="control-group">
                <label for="" class="control-label"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Taille'];?>
</label>
                <div class="controls">
                    <div class="input-append">
                        <input type="text" name="data[taille]" class="input-small" size="3" />
                        <span class="add-on">cm</span>
                    </div>
                </div>
            </div>
            
            <div class="control-group">
                <label for="" class="control-label"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Poids'];?>
</label>
                <div class="controls">
                    <div class="input-append">
                        <input type="text" name="data[poids]" class="input-small" size="3" />
                        <span class="add-on">kg</span>
                    </div>
                </div>
            </div>
			
            <div class="control-group">
                <label for="" class="control-label">Img</label>
                <div class="controls">
                    <div class="input-append">
                        <input type="text" name="data[img]" class="input-small" size="3" />
                        <span class="add-on">%</span>
                    </div>
                </div>
            </div>

	  </div><!-- /modal-body -->
	  <div class="modal-footer">
	    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
	    <button type="submit" class="btn btn-primary"><?php echo $_smarty_tpl->tpl_vars['lang']->value['Enregistrer'];?>
</button>
	    </form>
	  </div>
	</div>
	<?php }?>
<?php }?>

<?php if ($_SESSION['acl']['gest_joueur']==true){?>
<script type="text/javascript">
<!--
function openListeData(){
	$.get(
        '<?php echo $_smarty_tpl->tpl_vars['Helper']->value->getLink("joueur/getTabPhysiqueData/".((string)$_smarty_tpl->tpl_vars['joueur_id']->value));?>
',
        {nohtml:'nohtml'},
        function(data){ $('#modal-morpho-content').html(data); }
    )
    

	$( "#modal-morpho" ).modal('show');
}
//-->
</script>
<?php }?><?php }} ?>