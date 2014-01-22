<script>
function getZone(zone_id){

	if( zone_id < 10 ){
		$('#imgface').html('<img alt="muscu_face_400.png" usemap="#muscu_face_400" src="{$config.url}{$config.url_dir}web/images/muscu_face_400_zone'+zone_id+'.png"/>'); 
	}else{
		$('#imgdos').html('<img alt="muscu_dos_400.png" usemap="#muscu_dos_400" src="{$config.url}{$config.url_dir}web/images/muscu_dos_400_zone'+zone_id+'.png"/>'); 
	}
	
	$.get(
        '{getLink("muscu/getZone")}',{literal}
        {zone:zone_id, nohtml:'nohtml'},
        function(data){ $('#muscles_works').html(data); }
    )
    {/literal}
}

function clearMuscle(){
	$('#imgface').html('<img alt="muscu_face_400.png" usemap="#muscu_face_400" src="{$config.url}{$config.url_dir}web/images/muscu_face_400.png"/>');
	$('#imgdos').html('<img alt="muscu_dos_400.png" usemap="#muscu_dos_400" src="{$config.url}{$config.url_dir}web/images/muscu_dos_400.png"/>');
	$('#muscles_works').html("");
}

</script>
{strip}
{if $smarty.const.BREAD == 1}
	<ul class="breadcrumb">
		<li><a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a><span class="divider">/</span></li>
		<li>{$lang.Musculation}</li>
	</ul>
{/if}

<div class="well">
	{if $smarty.session.acl.gest_muscu == true}
	<div class="fright">
		<a href="{getLink("musculation/addExercice")}" title=""><img src="{$config.url}{$config.url_dir}web/images/add.png" /></a>
	</div>
	{/if}
	<h1>{$lang.Musculation}</h1>
	<div style="clear:both;"></div>
	
	<div class="fleft" id="muscles_works" style="height:10px;"></div>
	<div style="clear:both;"></div>
	
	<div class="fleft" style="width:100%; margin:auto;">
		<table style="margin:auto;">
			<tr>
				<td>
					<!-- FACE -->		
					<div id="imgface"><img alt="muscu_face_400.png" usemap="#muscu_face_400" src="{$config.url}{$config.url_dir}web/images/muscu_face_400.png"/></div>
					<map id="muscu_face_400" name="muscu_face_400">
						<area alt="zone1" href="{getLink("musculation/index?zone=1")}" onmouseover="javascript:getZone(1);" onmouseout="javascript:clearMuscle();" shape="rect" coords="40,98,110,131"/>
						<area alt="zone2" href="{getLink("musculation/index?zone=2")}" onmouseover="javascript:getZone(2);" onmouseout="javascript:clearMuscle();" shape="rect" coords="40,137,108,182"/>
						<area alt="zone3" href="{getLink("musculation/index?zone=3")}" onmouseover="javascript:getZone(3);" onmouseout="javascript:clearMuscle();" shape="rect" coords="20,75,36,110"/>
						<area alt="zone4" href="{getLink("musculation/index?zone=4")}" onmouseover="javascript:getZone(4);" onmouseout="javascript:clearMuscle();" shape="rect" coords="16,116,34,150"/>
						<area alt="zone5" href="{getLink("musculation/index?zone=5")}" onmouseover="javascript:getZone(5);" onmouseout="javascript:clearMuscle();" shape="rect" coords="8,158,22,206"/>
						<area alt="zone6" href="{getLink("musculation/index?zone=6")}" onmouseover="javascript:getZone(6);" onmouseout="javascript:clearMuscle();" shape="rect" coords="115,160,130,213"/>
						<area alt="zone7" href="{getLink("musculation/index?zone=7")}" onmouseover="javascript:getZone(7);" onmouseout="javascript:clearMuscle();" shape="rect" coords="83,48,97,78"/>
						<area alt="zone8" href="{getLink("musculation/index?zone=8")}" onmouseover="javascript:getZone(8);" onmouseout="javascript:clearMuscle();" shape="rect" coords="45,342,60,364"/>
						<area alt="zone9" href="{getLink("musculation/index?zone=9")}" onmouseover="javascript:getZone(9);" onmouseout="javascript:clearMuscle();" shape="rect" coords="75,207,110,282"/>
					</map>
				</td>
				<td>
					<!-- DOS -->
					<div id="imgdos"><img alt="muscu_dos_400.png" usemap="#muscu_dos_400" src="{$config.url}{$config.url_dir}web/images/muscu_dos_400.png"/></div>
					<map id="muscu_dos_400" name="muscu_dos_400">
						<area title="" alt="zone10" href="{getLink("musculation/index?zone=10")}" onmouseover="javascript:getZone(10);" onmouseout="javascript:clearMuscle();" shape="rect" coords="68,42,105,65"/>
						<area title="" alt="zone11" href="{getLink("musculation/index?zone=11")}" onmouseover="javascript:getZone(11);" onmouseout="javascript:clearMuscle();" shape="rect" coords="20,80,42,112"/>
						<area alt="zone12" href="{getLink("musculation/index?zone=12")}" onmouseover="javascript:getZone(12);" onmouseout="javascript:clearMuscle();" shape="rect" coords="17,116,35,160"/>
						<area alt="zone13" href="{getLink("musculation/index?zone=13")}" onmouseover="javascript:getZone(13);" onmouseout="javascript:clearMuscle();" shape="rect" coords="52,81,119,130"/>
						<area alt="zone14" href="{getLink("musculation/index?zone=14")}" onmouseover="javascript:getZone(14);" onmouseout="javascript:clearMuscle();" shape="rect" coords="55,141,114,176"/>
						<area alt="zone15" href="{getLink("musculation/index?zone=15")}" onmouseover="javascript:getZone(15);" onmouseout="javascript:clearMuscle();" shape="rect" coords="49,191,119,239"/>
						<area alt="zone16" href="{getLink("musculation/index?zone=16")}" onmouseover="javascript:getZone(16);" onmouseout="javascript:clearMuscle();" shape="rect" coords="43,250,70,289"/>
						<area alt="zone16" href="{getLink("musculation/index?zone=16")}" onmouseover="javascript:getZone(16);" onmouseout="javascript:clearMuscle();" shape="rect" coords="91,245,115,285"/>
						<area alt="zone17" href="{getLink("musculation/index?zone=17")}" onmouseover="javascript:getZone(17);" onmouseout="javascript:clearMuscle();" shape="rect" coords="42,340,62,371"/>
						<area alt="zone17" href="{getLink("musculation/index?zone=17")}" onmouseover="javascript:getZone(17);" onmouseout="javascript:clearMuscle();" shape="rect" coords="89,334,105,371"/>
					</map>
				</td>
			</tr>
		</table>
	</div>
	
	
	<table class="table table-condensed table-striped table-bordered">
		{if $smarty.session.acl.gest_muscu == 1}
	<form method="get" action="{getLink("muscu/seanceAdd")}">
	{/if}
		<thead>
			<tr>
				<td>#</td>
				<td>{$lang.Exercice}</td>
				<td>{$lang.Zone}</td>
				<td>{$lang.Muscle_travaille}</td>
				{if $smarty.session.acl.gest_muscu == 1}<td></td>{/if}
			</tr>
		</thead>
		<tbody>
		{foreach $Exercices as $Row}
			<tr>
				<td>{$Row.id}</td>
				<td><a href="{getLink("musculation/ficheExercice/{$Row.id}")}" title="">{$Row.nom}</a></td>
				<td>{$Row.zones}</td>
				<td>{$Row.muscles}</td>
				{if $smarty.session.acl.gest_muscu == 1}<td class="center"><input type="checkbox" name="exercice[{$Row.id}]" value="{$Row.id}" /></td>{/if}
			</tr>
		{/foreach}
		{if $smarty.session.acl.gest_muscu == 1}
			<tr>
				<td colspan="5" style="text-align:right;"><input type="submit" class="btn" value="{$lang.Creer_une_seance}" /></td>
			</tr>
			</form>
		{/if}
		</tbody>
	</table>
	{if isset($smarty.get.zone)}
	<div class="fright"><a href="{getLink("musculation/index")}" title="">{$lang.Tous}</a></div>
	<div class="clear"></div>
	{/if}
</div>{/strip}