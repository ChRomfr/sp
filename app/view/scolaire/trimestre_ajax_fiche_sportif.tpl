{if count($Trimestres) > 0}
	<table class="table table-bordered table-condensed table-striped">
		<thead>
			<tr>
				<th>{$lang.Trimestre}</th>
				<th>{$lang.Annee}</th>
				<th>{$lang.Suivi}</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			{foreach $Trimestres as $Row}
			<tr>
				<td>{$lang.Trimestre} {$Row.number}</td>
				<td>{$Row.annee}</td>
				<td>
					{if isset($Row.suivis) && count($Row.suivis) > 0}
						{foreach $Row.suivis as $Data}
						<span><a href="javascript:showSuiviScolaire({$Data.id})">{$lang.Suivi_du} {$Data.timestamp_suivi|date_format:$config.format_date_day}</a></span><br/>
						{/foreach}
					{/if}
				</td>
				<td class="center">
					{if $smarty.session.acl.gest_joueur == 1}
						<a href="javascript:getFormSuivi({$Row.id})" title="{$lang.Ajouter_un_suivi}">{$lang.Ajouter_un_suivi}</a>
					{/if}
				</td>
			</tr>	
			{/foreach}
		</tbody>
	</table>	
{/if}	