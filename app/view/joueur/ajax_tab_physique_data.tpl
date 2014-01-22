<div class="pull-left">
	<div class="well">
		<h4>{$lang.Poids}</h4>
		<table class="table">
			<thead>
				<tr>
					<td>{$lang.Date}</td>
					<td>{$lang.Poids}</td>
					<td></td>
				</tr>
			</thead>
			<tbody>
				{foreach $poids as $Data}
				<tr id="poids_{$Data.id}">
					<td>{$Data.date_saisie|date_format:$config.format_date_day}</td>
					<td>{$Data.poids}</td>
					<td>
						<a href="javascript:deleteData({$Data.id},'poids', 'poids_{$Data.id}');">
							<img src="{$config.url}{$config.url_dir}web/images/delete.png" alt=""  />
						</a>
					</td>
				</tr>
				{/foreach}
			</tbody>
		</table>
	</div>
</div>

<div class="pull-right">
	<div class="well">
		<h4>{$lang.Taille}</h4>
		<table class="table">
			<thead>
				<tr>
					<td>{$lang.Date}</td>
					<td>{$lang.Taille}</td>
					<td></td>
				</tr>
			</thead>
			<tbody>
				{foreach $tailles as $Data}
				<tr id="taille_{$Data.id}">
					<td>{$Data.date_saisie|date_format:$config.format_date_day}</td>
					<td>{$Data.taille}</td>
					<td class="center">
						<a href="javascript:deleteData({$Data.id},'taille', 'taille_{$Data.id}');">
							<img src="{$config.url}{$config.url_dir}web/images/delete.png" alt=""  />
						</a>
					</td>
				</tr>
				{/foreach}
			</tbody>
		</table>
	</div>
</div>

<div class="clearfix"></div>

<div class="pull-left">
	<div class="well">
		<h4>IMG</h4>
		<table class="table">
			<thead>
				<tr>
					<td>{$lang.Date}</td>
					<td>IMG</td>
					<td></td>
				</tr>
			</thead>
			<tbody>
				{foreach $imgs as $Data}
				<tr id="img_{$Data.id}">
					<td>{$Data.date_saisie|date_format:$config.format_date_day}</td>
					<td>{$Data.img}</td>
					<td class="center">
						<a href="javascript:deleteData({$Data.id},'img', 'img_{$Data.id}');">
							<img src="{$config.url}{$config.url_dir}web/images/delete.png" alt=""  />
						</a>
					</td>
				</tr>
				{/foreach}
			</tbody>
		</table>	
	</div>
</div>

<script type="text/javascript">
<!--
	function deleteData(id, type, tr_id){
		$.get(
			'{getLink("joueur/deleteDataPhysique")}',{literal}
			{id:id, type:type, nohtml:'nohtml'},
			function(data){ }
		)
    {/literal}	
	$('#' + tr_id).remove()
	}
//-->
</script>