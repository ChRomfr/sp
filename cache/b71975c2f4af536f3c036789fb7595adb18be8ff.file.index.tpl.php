<?php /* Smarty version Smarty-3.1.13, created on 2014-01-20 17:03:32
         compiled from "D:\wamp\www\goliathv2\app\view\index\index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2385352dd344e4c9112-05636102%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'b71975c2f4af536f3c036789fb7595adb18be8ff' => 
    array (
      0 => 'D:\\wamp\\www\\goliathv2\\app\\view\\index\\index.tpl',
      1 => 1390233173,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2385352dd344e4c9112-05636102',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_52dd344e78e532_11346666',
  'variables' => 
  array (
    'Blessures' => 0,
    'lang' => 0,
    'Trombi' => 0,
    'config' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_52dd344e78e532_11346666')) {function content_52dd344e78e532_11346666($_smarty_tpl) {?><!-- START view/index/index.tpl -->
<div id="widget_contener"><ul id="sortable"><?php if ($_SESSION['acl']['gest_joueur']==1&&$_SESSION['utilisateur']['widget_index_blessure']==1&&count($_smarty_tpl->tpl_vars['Blessures']->value)>0){?><li><div class="well" id="widget-blessure"><h4>Blessure</h4><div id="widget-blessure-data"></div></div></li><?php }?><?php if ($_SESSION['utilisateur']['widget_index_rss']==1){?><?php if ($_SESSION['utilisateur']['flux_rss_1']!=''){?><li><div class="well" id="widget-blessure"><h4>Flux RSS 1</h4><div id="widget-frss1-data"></div></div></li><?php }?><?php }?><?php if ($_SESSION['utilisateur']['widget_index_rss']==1){?><?php if ($_SESSION['utilisateur']['flux_rss_2']!=''){?><li><div class="well" id="widget-blessure"><h4>Flux RSS 2</h4><div id="widget-frss2-data"></div></div></li><?php }?><?php }?><!-- Actualite du site --><li><div class="well" id="widget-blessure"><h4><?php echo $_smarty_tpl->tpl_vars['lang']->value['Actualite'];?>
</h4><div id="widget-actualite-data"></div></div></li><!-- Gcalendar --><?php if ($_SESSION['utilisateur']['gmail_adr']!=''&&$_SESSION['utilisateur']['gmail_password']!=''){?><li><div class="well" id="widget-blessure"><h4><?php echo $_smarty_tpl->tpl_vars['lang']->value['Calendrier'];?>
</h4><div id="widget-gcalendar-data"></div><div style="text-align:right;"><a href="<?php echo getLink("gcalendar");?>
" title="" style="color:#000"><small><?php echo $_smarty_tpl->tpl_vars['lang']->value['Calendrier'];?>
</small></a></div></div></li><?php }?></ul><div class="clear"></div></div><!-- /widget_contener --><!-- Modal index --><div id="modal-index" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button><h4 id="myModalLabel"></h4></div><div class="modal-body" id="modal-index-contenu"></div><div class="modal-footer"><button class="btn" data-dismiss="modal" aria-hidden="true">Close</button></div></div><?php if ($_SESSION['acl']['gest_joueur']==1&&$_SESSION['utilisateur']['index_trombi']==1){?>	<?php echo $_smarty_tpl->tpl_vars['Trombi']->value;?>
<?php }?>
<script type="text/javascript">
<!--
$(function() {
	$(function() {
        $( "#sortable" ).sortable();
        $( "#sortable" ).disableSelection();
    });
});

<?php if ($_SESSION['acl']['gest_joueur']==1&&$_SESSION['utilisateur']['widget_index_blessure']==1){?>
function getWidgetBlessure(){
    $('#widget-blessure-data').html('<div class="center"><img src="<?php echo $_smarty_tpl->tpl_vars['config']->value['url'];?>
<?php echo $_smarty_tpl->tpl_vars['config']->value['url_dir'];?>
web/images/lightbox-ico-loading.gif" alt="" /></div>');
    $.get(
        '<?php echo getLink("widget/getWidgetBlessure");?>
',
        {nohtml:'nohtml'},
        function(data){ $('#widget-blessure-data').html(data); }
    )
    
}
<?php }?>

function getWidgetRSS(flux){
    
    var div_data;
    
    if( flux == 'flux_1'){
        div_data = 'widget-frss1-data';
    }else if(flux == 'flux_2'){
        div_data = 'widget-frss2-data';
    }
    
    $('#'+div_data).html('<div class="center"><i class="icon-spinner"></i></div>');
    $.get(
        '<?php echo getLink("widget/getWidgetRSS");?>
',
        {flux: flux, nohtml:'nohtml'},
        function(data){ $('#'+div_data).html(data); }
    )
        
}

function getGCalendar(){
	$('#widget-gcalendar-data').html('<div class="text-center"><i class="icon-spinner"></i></div>');
    $.get(
        '<?php echo getLink("gcalendar/widgetgcalendar");?>
',
        {nohtml:'nohtml'},
        function(data){ $('#widget-gcalendar-data').html(data); }
    )
    
}

function getActualite(){
    $('#widget-actualite-data').html('<div class="center"><i class="icon-spinner"></i></div>');
    $.get(
        '<?php echo getLink("widget/getWidgetActualite");?>
',
        {nohtml:'nohtml'},
        function(data){ $('#widget-actualite-data').html(data); }
    )
    
}

	<?php if ($_SESSION['acl']['gest_joueur']==1&&$_SESSION['utilisateur']['widget_index_blessure']==1){?>getWidgetBlessure();<?php }?>
	<?php if ($_SESSION['utilisateur']['widget_index_rss']==1){?>
		<?php if ($_SESSION['utilisateur']['flux_rss_1']!=''){?>getWidgetRSS('flux_1');<?php }?>
		<?php if ($_SESSION['utilisateur']['flux_rss_2']!=''){?>getWidgetRSS('flux_2');<?php }?>
	<?php }?>
	<?php if ($_SESSION['utilisateur']['gmail_adr']!=''&&$_SESSION['utilisateur']['gmail_password']!=''){?>getGCalendar();<?php }?>
	getActualite();
//-->
</script><?php }} ?>