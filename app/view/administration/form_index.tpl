<script type="text/javascript">
<!--
function changeStatut(champ_id){
	$.get(
        '{getLink("administration/champChangeStatut/'+ champ_id +'")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#actif_'+champ_id).html(data); }
    )
    {/literal}
}

function changeRequired(champ_id){
	$.get(
        '{getLink("administration/champChangeRequired/'+ champ_id +'")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#required_'+champ_id).html(data); }
    )
    {/literal}
}
//-->
</script>

<div class="showData">
	<h1>{$lang.Personnalisation_formulaires}</h1>
	<table class="tadmin">
		<thead>
			<tr>
				<td>#</td>
				<td>{$lang.Formulaire}</td>
				<td>{$lang.Champ}</td>
				<td>{$lang.Type}</td>
				<td>{$lang.Actif}</td>
				<td>{$lang.Obligatoire}</td>
				<td></td>
			</tr>
		</thead>
		<tbody>
			{foreach $Champs as $Row}
			<tr>
				<td>{$Row.id}</td>
				<td>{$Row.cf_code_form}</td>
				<td>{$Row.cf_name}</td>
				<td>
					{if $Row.cf_type == 1}Text
					{elseif $Row.cf_type == 2}Select
					{/if}
				</td>
				<td class="center">
					<a href="javascript:changeStatut({$Row.id});" title="">
						<span id="actif_{$Row.id}">						
							{if $Row.cf_actif == 1}<img src="{$config.url}{$config.url_dir}web/images/okSmall.png" alt="" />
							{else}<img src="{$config.url}{$config.url_dir}web/images/noSmall.png" alt="" />
							{/if}						
						</span>
					</a>
				</td>
				<td class="center">
					<a href="javascript:changeRequired({$Row.id});" title="">
						<span id="required_{$Row.id}">						
							{if $Row.cf_required == 1}<img src="{$config.url}{$config.url_dir}web/images/okSmall.png" alt="" />
							{else}<img src="{$config.url}{$config.url_dir}web/images/noSmall.png" alt="" />
							{/if}						
						</span>						
					</a>
				</td>
				<td></td>
			</tr>
			{/foreach}
		</tbody>
	</table>
</div>