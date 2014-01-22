<form method="post" id="formAdd" class="form well">
	<h1>{$lang.Match}</h1>
	<dl>
		<dt><label for="date_match">{$lang.Date} :</label></dt>
		<dd><input type="text" name="match[m_date]" id="date_match" required class="validate[required,custom[date]]" size="10"/></dd>
	</dl>
	<dl>
		<dt><label for="equipe_a">{$lang.Equipe} A :</label></dt>
		<dd><input type="text" name="match[equipe_a]" required class="validate[required]" id="equipe_a" /></dd>
	</dl>
	<dl>
		<dt><label for="equipe_b">{$lang.Equipe} B :</label></dt>
		<dd><input type="text" name="match[equipe_b]" required class="validate[required]" id="equipe_b" /></dd>
	</dl>
	<dl>
		<dt><label for="score_a">{$lang.Score} A :</label></dt>
		<dd><input type="text" name="match[score_a]" required class="validate[required]" id="score_a" size="3" /></dd>
	</dl>
	<dl>
		<dt><label for="score_b">{$lang.Score} B :</label></dt>
		<dd><input type="text" name="match[score_b]" required class="validate[required]" id="score_b" size="3" /></dd>
	</dl>
	
	<div class="fright">
		<a href="javascript:addJoueur();"><img src="{$config.url}{$config.url_dir}web/images/add.png" alt="" /></a>
	</div>
	<h1>{$lang.Joueur}</h1>
	<div class="clear"></div>
	{* TABLEAU DES JOUEURS AYANT PARTICIPER AU MATCH *}
	<table id="joueurs_list" class="tadmin">
		<thead>
			<tr>
				<td>{$lang.Joueur}</td>
				<td>{$lang.Equipe}</td>
				<td>{$lang.Temps_de_jeu}</td>
				<td>{$lang.Poste}</td>
				<td>{$lang.Points}</td>
				<td>{$lang.Commentaire}</td>
			</tr>
		</thead>
		<tbody>
			
		</tbody>		
	</table>
	<div class="center">
		<input type="submit" value="{$lang.Enregistrer}" />
	</div>
</form>

<script type="text/javascript">
<!--
var nb_joueur = 0;

function addJoueur(){
	$.get(
        '{getLink("rugby/matchJoueurAdd")}',{literal}
        {nb_joueur: nb_joueur, nohtml:'nohtml'},
        function(data){ 
        	$("#joueurs_list").append(data); 
        	nb_joueur = nb_joueur + 1;
    	}
    )
	{/literal}
}

$(function() {
	$( "#date_match" ).datepicker({ dateFormat: 'dd/mm/yy', changeMonth:true, changeYear:true, showButtonPanel: true });
    $( "#date_match" ).datepicker( "option", "showAnim", "clip" );
});
//-->
</script>