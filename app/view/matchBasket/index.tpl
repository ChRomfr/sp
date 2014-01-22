<script>
function deleteMatch(match_id){
	if( confirm('{$lang.Confirm_suppression_match} ?') ){
		window.location.href = '{getLink("matchBasket/delete/'+ match_id +'")}';
	}
}
</script>
{strip}
{if $smarty.const.BREAD == 1}
<div id="bread">
	<a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a>&nbsp;>>&nbsp;
	{$lang.Match}
</div>
{/if}

<div class="showData">
	<div class="fright">
		{if $smarty.session.acl.gest_match == 1}
		<a href="{getLink("matchBasket/add")}"><img src="{$config.url}{$config.url_dir}web/images/add.png" alt="" /></a>
		{/if}
	</div>
	<h1>{$lang.Matchs}</h1>
	<div class="clear"></div>
	<table class="tadmin">
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
				<td><a href="{getLink("matchBasket/detail/{$Row.id}")}" title="{$lang.Detail}">{$Row.equipe}{if !empty($Row.structure)} - {$Row.structure}{/if}</a></td>
				<td>{$Row.adversaire}</td>
				<td class="center" {if $Row.score_equipe > $Row.score_adversaire}style="background-color:green; color:#fff; font-weight:bold;"{elseif $Row.score_equipe < $Row.score_adversaire}style="background-color:red; color:#fff; font-weight:bold;"{else if $Row.score_equipe == $Row.score_adversaire}style="background-color:black; color:#fff; font-weight:bold;"{/if}><span {if $Row.score_equipe > $Row.score_adversaire}style="background-color:green; color:#fff; font-weight:bold;"{elseif $Row.score_equipe < $Row.score_adversaire}style="background-color:red; color:#fff; font-weight:bold;"{else if $Row.score_equipe == $Row.score_adversaire}style="background-color:black; color:#fff; font-weight:bold;"{/if} >{$Row.score_equipe} - {$Row.score_adversaire}</span></td>
				<td>{$Row.date_timestamp|date_format:$config.format_date_day}</td>
				<td class="center">
					{if $smarty.session.acl.gest_match == 1}
					<a href="javascript:deleteMatch({$Row.id})" title=""><img src="{$config.url}{$config.url_dir}web/images/delete.png" alt="" /></a>
					{/if}
				</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
</div>
{/strip}