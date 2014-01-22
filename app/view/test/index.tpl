{strip}
<ul class="breadcrumb">
    <li><a href="{getLink("index")}" title="">{$lang.Accueil}</a><span class="divider">/</span></li>
    <li>{$lang.Tests}</li>
</ul>


<div class="well">

	{if $smarty.session.acl.gest_entrainement == true}
	<div class="pull-right">
		<a href="{getLink("test/add")}" title=""><i class="icon-plus"></i></a>        
	</div>
	{/if}

	<h4>{$lang.Liste_des_tests}</h4>
	<div class="clearfix"></div>

	<table class="table table-hover table-striped">
		<thead>
			<tr>
				<th>{$lang.Date}</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			{foreach $Tests as $Row}
			<tr>
				<td>{$Row.date_test|date_format:$config.format_date_day}</td>
				<td class="center">
					<a href="{getLink("test/detailTest/{$Row.id}")}" title=""><i class="icon-list"></i></a>&nbsp;&nbsp;
					<a href="{getLink("test/exportCsv/{$Row.id}?nohtml")}" title=""><i class="icon icon-green icon-xls"></i></a>&nbsp;&nbsp;
					{if $smarty.session.acl.gest_entrainement == true}
					<a href="javascript:deleteTest({$Row.id});" title=""><i class="icon-trash"></i></a>
					{/if}
				</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
</div>

<script type="text/javascript">
<!--
function deleteTest(TID){
    if( confirm('{$lang.Confirm_suppression_test} ?') ){
        window.location.href = '{getLink("test/delete/'+TID+'")}';
    }
}
//-->
</script>