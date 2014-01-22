<script>
	{literal}
	$(document).ready(function(){ 
        $("#tableau_test").tablesorter(); 
    });
	{/literal}
	
	$(function() {
		$( "#diag-more-data" ).dialog({ autoOpen: false, width:600 });
	});
	
	function getFormAddUser(){
		$('#diag-more-data').html("");
		$.get(
			'{getLink("muscu/addJoueurInTest/{$Test.id}")}',{literal}
			{nohtml:'nohtml'},
			function(data){ $('#diag-more-data').html(data); }
		)
		{/literal}
    
		$('#diag-more-data').dialog('open');
	}	
 
</script>

{strip}

{if $smarty.const.BREAD == true && !isset($smarty.get.nohtml)}
<a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a>&nbsp;>>&nbsp;
<a href="{getLink("muscu/index")}" title="{$lang.Musculation}">{$lang.Musculation}</a>&nbsp;>>&nbsp;
<a href="{getLink("muscu/testListe")}" title="{$lang.Test}">{$lang.Test}</a>&nbsp;>>&nbsp;
{$lang.Detail}
{/if}

<div class="showData">

	<div class="fright">
		{if $smarty.session.acl.gest_muscu == 1}<a href="javascript:getFormAddUser();"><img src="{$config.url}{$config.url_dir}web/images/user_add.png" style="width:16px;"/></a>&nbsp;&nbsp;{/if}
	</div>
	
	<h1>{$lang.Test_du} {$Test.date_test|date_format:$config.format_date_day}</h1>
	<div class="clear"></div>
	
	{$Tableau}
</div>
<div id="diag-more-data"></div>
{/strip}