{strip}
{if $smarty.const.BREAD == 1}
<ul class="breadcrumb">
	<li><a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a><span class="divider">/</span></li>
	<li>{$lang.Match}</li>
</ul>
{/if}

<div class="well">
	<div class="pull-right">
		{if $smarty.session.acl.gest_match == 1}
		<a href="{getLink("matchRugby/add")}"><i class="icon icon-plus"></i></a>
		{/if}
	</div>
	<h4>{$lang.Matchs}</h4>
	<div class="clearfix"></div>
	<table class="table table-striped table-bordered">
		<thead>
			<tr>
				<td>{$lang.Equipe}</td>
				<td>{$lang.Adversaire}</td>
				<td>{$lang.Score}</td>
				<td>{$lang.Date}</td>
				<td>{$lang.Action}</td>
			</tr>
		</thead>
		<tbody>
			{foreach $Matchs as $Row}
			<tr>
				<td><a href="{getLink("matchRugby/detail/{$Row.id}")}" title="{$lang.Detail}">{$Row.equipe}{if !empty($Row.structure)} - {$Row.structure}{/if}</a></td>
				<td>{$Row.adversaire}</td>
				<td class="text-center" {if $Row.score_equipe > $Row.score_adversaire}style="background-color:green; color:#fff; font-weight:bold;"{elseif $Row.score_equipe < $Row.score_adversaire}style="background-color:red; color:#fff; font-weight:bold;"{else if $Row.score_equipe == $Row.score_adversaire}style="background-color:black; color:#fff; font-weight:bold;"{/if}><span {if $Row.score_equipe > $Row.score_adversaire}style="background-color:green; color:#fff; font-weight:bold;"{elseif $Row.score_equipe < $Row.score_adversaire}style="background-color:red; color:#fff; font-weight:bold;"{else if $Row.score_equipe == $Row.score_adversaire}style="background-color:black; color:#fff; font-weight:bold;"{/if} >{$Row.score_equipe} - {$Row.score_adversaire}</span></td>
				<td>{$Row.date_timestamp|date_format:$config.format_date_day}</td>
				<td class="text-center">
					{if $smarty.session.acl.gest_match == 1}
					<a href="javascript:deleteMatch({$Row.id})" title=""><i class="icon icon-trash"></i></a>
					{/if}
				</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
</div>
{/strip}
<script>
function deleteMatch(match_id){
	if( confirm('{$lang.Confirm_suppression_match} ?') ){
		window.location.href = '{getLink("matchRugby/delete/'+ match_id +'")}';
	}
}
</script>