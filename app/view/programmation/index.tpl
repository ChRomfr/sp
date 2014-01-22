
<div class="well">
	{if $smarty.session.acl.gest_programmation == 1}
	<div class="fright">
		<a href="javascript:getFormAdd();"><i class="icon icon-plus"></i></a>
	</div>
	{/if}
	<h1>{$lang.Programmation}</h1>
	<div class="clear"></div>
	<div style="margin:auto; width:1000px;">
		<div class="center"><strong>{$Date.month_txt} {$Date.year}</strong></div>
		<div class="fleft"><a href="{getLink("programmation/index{$Previous}")}{if isset($smarty.get.equipe)}&equipe={$smarty.get.equipe}{/if}" title="Previous"><<</a></div>		
		<div class="fright"><a href="{getLink("programmation/index{$Next}")}{if isset($smarty.get.equipe)}&equipe={$smarty.get.equipe}{/if}" title="Next">>></a></div>
		<div class="clear"></div>
		<div>{$Calendar}</div>
	</div>
	{if !empty($Equipes) && count($Equipes) > 1}
	<div class="fright">
		{$lang.Equipes} : 
			<select id="equipe" onchange="reloadPage()">
				<option></option>
				{foreach $Equipes as $Row}
				<option value="{$Row.id}" {if isset($smarty.get.equipe) && $smarty.get.equipe == $Row.id}selected="selected"{/if}>{$Row.nom}</option>
				{/foreach}
			</select>
	</div>
	<div class="clear"></div>
	{/if}
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
		window.location.href = '{getLink("programmation/index")}';
	}else{
		window.location.href = '{getLink("programmation/index?equipe='+ equipe +'")}';
	}
	
}

{if $smarty.session.acl.gest_programmation == 1}
function getFormAdd(cdate, moment){

	if (!cdate) { cdate = ''; } 
	if (!moment) { moment = ''; } 
	
	$('#modal-programmation').html("");
	$.get(
		'{getLink("programmation/ajaxFormAddProg")}',{literal}
        {nohtml:'nohtml', cdate:cdate, moment:moment},
        function(data){ $('#modal-programmation').html(data); }

    )
    {/literal}
	$('#modal-programmation').modal('show');
}
{/if}

function getDetail(pid){
	$('#modal-programmation').html("");
	$.get(
		'{getLink("programmation/ajaxDetailProg/'+pid+'")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#modal-programmation').html(data); }
    )
    {/literal}
	
	$('#modal-programmation').modal('show');
}

//-->
</script>