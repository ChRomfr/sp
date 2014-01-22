<div id="container-table" class="fake-container">
	<table class="table table-condensed table-hover table-bordered" id="table-players">
		<TBODY>
			<tr>
				<th><small>{$lang.Sportif}</small></th>
				<th><small>{$lang.Temps_de_jeu}</small></th>
				<th><small>{$lang.Poste}</small></th>
				<th><small>{$lang.Essai}</small></th>
				<th><small>{$lang.Transformation}</small></th>
				<th><small>{$lang.Penalite}</small></th>
				<th><small>Passes</small></th>
				<th><small>Plaquage</small></th>
				<th><small>En avant</small></th>
				<th><small>{$lang.Carton_blanc}</small></th>
				<th><small>{$lang.Carton_jaune}</small></th>
				<th><small>{$lang.Carton_rouge}</small></th>
				<th><small>{$lang.Observation}</small></th>
			</tr>
		
		
			{foreach $Sportifs as $Row}
			<tr>
				<td>
					<input type="hidden" name="sportif[{$Row.id}][joueur_id]" value="{$Row.id}" />
					{$Row.prenom} {$Row.nom}
				</td>
				<td class="center"><input type="text" name="sportif[{$Row.id}][temps_jeu]" value="" size="3" class="input-mini"/></td>
				<td class="center"><input type="text" name="sportif[{$Row.id}][poste]" value="" size="10" class="input-mini"/></td>
				<td class="center"><input type="text" name="sportif[{$Row.id}][essaie]" value="" size="2" class="input-mini"/></td>
				<td class="center"><input type="text" name="sportif[{$Row.id}][transformation]" value="" size="2" class="input-mini" /></td>
				<td class="center"><input type="text" name="sportif[{$Row.id}][penalite]" value="" size="2" class="input-mini" /></td>
				<td class="text-center"><input type="text" name="sportif[{$Row.id}][passes]" value="" size="2" class="input-mini" /></td>
				<td class="text-center"><input type="text" name="sportif[{$Row.id}][plaquage]" value="" size="2" class="input-mini" /></td>
				<td class="text-center"><input type="text" name="sportif[{$Row.id}][enavant]" value="" size="2" class="input-mini" /></td>
				<td class="center"><input type="text" name="sportif[{$Row.id}][c_blanc]" value="" size="1" class="input-mini" /></td>
				<td class="center"><input type="text" name="sportif[{$Row.id}][c_jaune]" value="" size="1" class="input-mini" /></td>
				<td class="center"><input type="text" name="sportif[{$Row.id}][c_rouge]" value="" size="1" class="input-mini" /></td>
				<td class="center"><textarea name="sportif[{$Row.id}][observation]" cols="40" rows="4"></textarea></td>
			</tr>
			{/foreach}
		</TBODY>
	</table>
</div><!-- /fake-container -->

<script type="text/javascript">
<!--
(function() {
	var mySt = new superTable("table-players", {
		cssSkin : "sDefault",
		fixedCols : 1,
		headerRows : 1,
		/*onStart : function () {
			this.start = new Date();
		},
		onFinish : function () {
			document.getElementById("testDiv").innerHTML += "Finished...<br>" + ((new Date()) - this.start) + "ms.<br>";
		}*/
	});
})();
//-->
</script>