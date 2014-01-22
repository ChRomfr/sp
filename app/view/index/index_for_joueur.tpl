{* JAVASCRIPT AJAX WIDGET *}
<script type="text/javascript">
<!--
$(function() {
	$(function() {
        $( "#sortable" ).sortable();
        $( "#sortable" ).disableSelection();
    });
});

function getWidgetRSS(flux){
    
    var div_data;
    
    if( flux == 'flux_1'){
        div_data = 'widget-frss1-data';
    }else if(flux == 'flux_2'){
        div_data = 'widget-frss2-data';
    }
    
    $('#'+div_data).html('<div class="center"><img src="{$config.url}{$config.url_dir}web/images/lightbox-ico-loading.gif" alt="" /></div>');
    $.get(
        '{getLink("widget/getWidgetRSS")}',{literal}
        {flux: flux, nohtml:'nohtml'},
        function(data){ $('#'+div_data).html(data); }
    )
    {/literal}    
}

function getGCalendar(){
	$('#widget-gcalendar-data').html('<div class="center"><img src="{$config.url}{$config.url_dir}web/images/lightbox-ico-loading.gif" alt="" /></div>');
    $.get(
        '{getLink("gcalendar/widgetgcalendar")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#widget-gcalendar-data').html(data); }
    )
    {/literal}
}

function getActualite(){
    $('#widget-actualite-data').html('<div class="center"><img src="{$config.url}{$config.url_dir}web/images/lightbox-ico-loading.gif" alt="" /></div>');
    $.get(
        '{getLink("widget/getWidgetActualite")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#widget-actualite-data').html(data); }
    )
    {/literal}
}

//-->
</script>{strip}

<div id="widget_contener">
	
	<ul id="sortable">
		
		{if $smarty.session.utilisateur.widget_index_rss == 1}
			{if $smarty.session.utilisateur.flux_rss_1 != ""}
				<li>
				    <div class="ui-dialog" style="width: 98%; border: 1px solid #A6C9E2; position:static" id="widget-blessure">
					    <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
						    <span id="ui-dialog-title-diag-form" class="ui-dialog-title">Flux RSS 1</span>
					    </div>    
					    <div class="ui-dialog-content ui-widget-content" style="width: auto; min-height: 114.967px; height: auto;" scrolltop="0" scrollleft="0" id="widget-frss1-data">
					    </div>
				    </div>
				</li>
			{/if}
		{/if}
		
		{if $smarty.session.utilisateur.widget_index_rss == 1}
			{if $smarty.session.utilisateur.flux_rss_2 != ""}
		    <li>
		        <div class="ui-dialog" style="width: 98%; border: 1px solid #A6C9E2; position:static" id="widget-blessure">
		            <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
		                <span id="ui-dialog-title-diag-form" class="ui-dialog-title">Flux RSS 2</span>
		            </div>    
		            <div class="ui-dialog-content ui-widget-content" style="width: auto; min-height: 114.967px; height: auto;" scrolltop="0" scrollleft="0" id="widget-frss2-data">
		            </div>
		        </div>
		    </li>
		    {/if}
		{/if}
		
		{* AFFICHAGE DES ACTU DU SITE *}
		<li>
	        <div class="ui-dialog" style="width: 98%; border: 1px solid #A6C9E2; position:static" id="widget-actualite">
	            <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
	                <span id="ui-dialog-title-diag-form" class="ui-dialog-title">{$lang.Actualite}</span>
	            </div>    
	            <div class="ui-dialog-content ui-widget-content" style="width: auto; min-height: 114.967px; height: auto;" scrolltop="0" scrollleft="0" id="widget-actualite-data">
	            </div>
	        </div>
	    </li>
	    
	    {* CYCLE DE MUSCULATION *}
	    {if count($Cycles) > 0}
	    <li>
	    	<div class="ui-dialog" style="width: 98%; border: 1px solid #A6C9E2; position:static" id="widget-muscu">
	            <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
	                <span id="ui-dialog-title-diag-form" class="ui-dialog-title">{$lang.Musculation}</span>
	            </div>    
	            <div class="ui-dialog-content ui-widget-content" style="width: auto; min-height: 114.967px; height: auto;" scrolltop="0" scrollleft="0" id="widget-muscu-data">
	            	{foreach $Cycles as $Row}
	            	<a href="{getLink("muscu/detailCycle/{$Row.id}")}" title="{$Row.nom}">{$Row.nom}</a>&nbsp;
	            	<a href="{getLink("muscu/detailCycle/{$Row.id}?pdf")}" title="{$Row.nom}" target="_blank">
	            		<img src="{$config.url}{$config.url_dir}web/images/pdf2.png" alt="" style="width:14px;" />
	            	</a>
	            	{/foreach}
	            </div>
	        </div>
	    </li>
	    {/if}
		
		{* AFFICHAGE GOOGLE CALENDAR *}
		{if $smarty.session.utilisateur.gmail_adr != '' && $smarty.session.utilisateur.gmail_password != ''}
		<li>
			 <div class="ui-dialog" style="width: 98%; border: 1px solid #A6C9E2; position:static" id="widget-gcalendar">
				<div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
					<span id="ui-dialog-title-diag-form" class="ui-dialog-title">{$lang.Calendrier}</span>
				</div>    
				<div class="ui-dialog-content ui-widget-content" style="width: auto; min-height: 114.967px; height: auto;" scrolltop="0" scrollleft="0" id="widget-gcalendar-data">
				</div>
				<div style="text-align:right;"><a href="{getLink("gcalendar")}" title="" style="color:#000"><small>{$lang.Calendrier}</small></a></div>
			</div>
		</li>
		{/if}
		
	</ul>
	
	<div class="clear"></div>
	
</div> {* id=widget_contener *}

{/strip}

<script type="text/javascript">
<!--
	{if $smarty.session.utilisateur.widget_index_rss == 1}
		{if $smarty.session.utilisateur.flux_rss_1 != ""}getWidgetRSS('flux_1');{/if}
		{if $smarty.session.utilisateur.flux_rss_2 != ""}getWidgetRSS('flux_2');{/if}
	{/if}
	{if $smarty.session.utilisateur.gmail_adr != '' && $smarty.session.utilisateur.gmail_password != ''}getGCalendar();{/if}
	getActualite();
//-->
</script>