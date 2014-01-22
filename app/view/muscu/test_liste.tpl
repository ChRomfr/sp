<script type="text/javascript">
<!--
function deleteTest(TID){
    if( confirm('{$lang.Confirm_suppression_test} ?') ){
        window.location.href = '{getLink("muscu/testDelete/'+TID+'")}';
    }
}
//-->
</script>{strip}

{if $smarty.const.BREAD == true}
<div id="bread">
    <a href="{getLink("index/index")}" title="">{$lang.Accueil}</a>&nbsp;>>&nbsp;
    <a href="{getLink("musculation/index")}" title="">{$lang.Musculation}</a>&nbsp;>>&nbsp;
    {$lang.Tests}
</div>
{/if}

{if $smarty.session.acl.gest_muscu == true}
	<div class="showData">
	<div class="fright">
		<a href="{getLink("muscu/testAdd")}" title=""><img src="{$config.url}{$config.url_dir}web/images/add.png" alt="" /></a>        
	</div>
	{/if}
	<h1>{$lang.Liste_des_tests}</h1>
	<div class="clear"></div>
	<br/>
	<table class="tadmin">
		<thead>
			<tr>
				<td>{$lang.Date}</td>
				<td></td>
			</tr>
		</thead>
		<tbody>
			{foreach $Tests as $Row}
			<tr>
				<td>{$Row.date_test|date_format:$config.format_date_day}</td>
				<td class="center">
					<a href="{getLink("muscu/testDetail/{$Row.id}")}" title=""><img src="{$config.url}{$config.url_dir}web/images/detail.png" alt="" /></a>
					{if $smarty.session.acl.gest_muscu == true}
					<a href="javascript:deleteTest({$Row.id});" title=""><img src="{$config.url}{$config.url_dir}web/images/delete.png" alt="" /></a>
					{/if}
				</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
</div>
{/strip}