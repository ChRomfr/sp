<!-- START view/index/index.tpl -->
{strip}
<div id="widget_contener">
	
	
	
	<ul id="sortable">
		{* AFFICHAGE WIDGET BLESSURE *}
		{if $smarty.session.acl.gest_joueur == 1 &&  $smarty.session.utilisateur.widget_index_blessure == 1 && count($Blessures) > 0}
		<li>			
			<div class="well" id="widget-blessure">
				<h4>Blessure</h4>
				<div id="widget-blessure-data"></div>
			</div>
		</li>
		{/if}
		
		{if $smarty.session.utilisateur.widget_index_rss == 1}
			{if $smarty.session.utilisateur.flux_rss_1 != ""}
				<li>
				    <div class="well" id="widget-blessure">
						<h4>Flux RSS 1</h4>
						<div id="widget-frss1-data"></div>
					</div>
				</li>
			{/if}
		{/if}
		
		{if $smarty.session.utilisateur.widget_index_rss == 1}
			{if $smarty.session.utilisateur.flux_rss_2 != ""}
		    <li> 
	            <div class="well" id="widget-blessure">
					<h4>Flux RSS 2</h4>
					<div id="widget-frss2-data"></div>
				</div>
		    </li>
		    {/if}
		{/if}
		
		<!-- Actualite du site -->
		<li>
	        <div class="well" id="widget-blessure">
				<h4>{$lang.Actualite}</h4>
				<div id="widget-actualite-data"></div>
			</div>
	    </li>
		
		<!-- Gcalendar -->
		{if $smarty.session.utilisateur.gmail_adr != '' && $smarty.session.utilisateur.gmail_password != ''}
		<li>
			<div class="well" id="widget-blessure">
				<h4>{$lang.Calendrier}</h4>
				<div id="widget-gcalendar-data"></div>
				<div style="text-align:right;"><a href="{getLink("gcalendar")}" title="" style="color:#000"><small>{$lang.Calendrier}</small></a></div>
			</div>
		</li>
		{/if}
		
	</ul>
	
	<div class="clear"></div>
	
</div><!-- /widget_contener -->

<!-- Modal index -->
<div id="modal-index" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h4 id="myModalLabel"></h4>
	</div>
	<div class="modal-body" id="modal-index-contenu">
		
	</div>
	<div class="modal-footer">
	<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
	</div>
</div>
{if $smarty.session.acl.gest_joueur == 1 &&  $smarty.session.utilisateur.index_trombi == 1}	{$Trombi}{/if}

{/strip}
<script type="text/javascript">
<!--
$(function() {
	$(function() {
        $( "#sortable" ).sortable();
        $( "#sortable" ).disableSelection();
    });
});

{if $smarty.session.acl.gest_joueur == 1 &&  $smarty.session.utilisateur.widget_index_blessure == 1}
function getWidgetBlessure(){
    $('#widget-blessure-data').html('<div class="center"><img src="{$config.url}{$config.url_dir}web/images/lightbox-ico-loading.gif" alt="" /></div>');
    $.get(
        '{getLink("widget/getWidgetBlessure")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#widget-blessure-data').html(data); }
    )
    {/literal}
}
{/if}

function getWidgetRSS(flux){
    
    var div_data;
    
    if( flux == 'flux_1'){
        div_data = 'widget-frss1-data';
    }else if(flux == 'flux_2'){
        div_data = 'widget-frss2-data';
    }
    
    $('#'+div_data).html('<div class="center"><i class="icon-spinner"></i></div>');
    $.get(
        '{getLink("widget/getWidgetRSS")}',{literal}
        {flux: flux, nohtml:'nohtml'},
        function(data){ $('#'+div_data).html(data); }
    )
    {/literal}    
}

function getGCalendar(){
	$('#widget-gcalendar-data').html('<div class="text-center"><i class="icon-spinner"></i></div>');
    $.get(
        '{getLink("gcalendar/widgetgcalendar")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#widget-gcalendar-data').html(data); }
    )
    {/literal}
}

function getActualite(){
    $('#widget-actualite-data').html('<div class="center"><i class="icon-spinner"></i></div>');
    $.get(
        '{getLink("widget/getWidgetActualite")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#widget-actualite-data').html(data); }
    )
    {/literal}
}

	{if $smarty.session.acl.gest_joueur == 1 &&  $smarty.session.utilisateur.widget_index_blessure == 1}getWidgetBlessure();{/if}
	{if $smarty.session.utilisateur.widget_index_rss == 1}
		{if $smarty.session.utilisateur.flux_rss_1 != ""}getWidgetRSS('flux_1');{/if}
		{if $smarty.session.utilisateur.flux_rss_2 != ""}getWidgetRSS('flux_2');{/if}
	{/if}
	{if $smarty.session.utilisateur.gmail_adr != '' && $smarty.session.utilisateur.gmail_password != ''}getGCalendar();{/if}
	getActualite();
//-->
</script>