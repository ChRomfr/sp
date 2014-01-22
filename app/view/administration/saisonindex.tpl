<!-- view/administration/saisonindex.tpl -->
<ul class="breadcrumb">
	<li><a href="{getLink("administration")}" title="{$lang.Administration}">{$lang.Administration}</a><span class="divider">/</span></li>
	<li>{$lang.Saisons}</li>
</ul>

<div class="well">
    
    <div class="pull-right">
        <a href="{$Helper->getLink("administration/saisonadd")}" title="{$lang.Nouvelle}"><i class="icon-plus"></i></a>
    </div>
    
    <div class="clearfix"></div>

	<h4>{$lang.Saisons}</h4>

	<table class="table table-bordered table-striped">
		<thead>
			<tr>
				<td>#</td>
				<td>{$lang.Saison}</td>
				<td>{$lang.Action}</td>
			</tr>
		</thead>
		<tbody>
            {foreach $saisons as $saison}
            <tr>
                <td>{$saison.id}</td>
                <td>{$saison.name}</td>
                <td></td>
            </tr>
            {/foreach}
		</tbody>
	</table>
</div><!-- /well -->