{strip}
<div style="overflow:auto;">
	<table class="tadmin">
		<thead>
			<tr>
				<td>{$lang.Sportif}</td>
				<td><small>{$lang.Temps_de_jeu}</small></td>
				<td>{$lang.Poste}</td>
				<td>{$lang.Points}</td>
				<td>{$lang.Tir}</td>
				<td>{$lang.Tir_reussis}</td>
				<td>{$lang.Lancer_franc}</td>
				<td><small>{$lang.Lancer_franc_reussis}</small></td>
				<td>{$lang.Rebonds}</td>
				<td><small>{$lang.Passe_decissive}</small></td>
				<td><smalL>{$lang.Interception}</small></td>
				<td>{$lang.Contre}</td>
				<td>{$lang.Balle_perdu}</td>
				<td>{$lang.Faute}</td>
				<td>{$lang.Observation}</td>
			</tr>
		</thead>
		<tbody >
			{foreach $Sportifs as $Row}
			<tr>
				<td>
					<input type="hidden" name="sportif[{$Row.id}][joueur_id]" value="{$Row.id}" />
					{$Row.prenom} {$Row.nom}
				</td>
				<td class="center"><input type="text" name="sportif[{$Row.id}][temps_jeu]" value="" size="2" style="font-size:10px" /></td>
				<td class="center"><input type="text" name="sportif[{$Row.id}][poste]" value="" size="4" style="font-size:10px"/></td>
				<td class="center"><input type="text" name="sportif[{$Row.id}][points]" value="" size="2" style="font-size:10px"/></td>
				<td class="center">
					2 : <input type="text" name="sportif[{$Row.id}][tir_2]" value="" size="2" style="font-size:10px"/><br/>
					3 : <input type="text" name="sportif[{$Row.id}][tir_3]" value="" size="2" style="font-size:10px"/>
				</td>
				<td class="center">
					2 : <input type="text" name="sportif[{$Row.id}][tir_2_reussis]" value="" size="2" style="font-size:10px" /><br/>
					3 : <input type="text" name="sportif[{$Row.id}][tir_3_reussis]" value="" size="2" style="font-size:10px" />
				</td>
				<td class="center"><input type="text" name="sportif[{$Row.id}][lfranc]" value="" size="1" style="font-size:10px"/></td>
				<td class="center"><input type="text" name="sportif[{$Row.id}][lfranc_reussis]" value="" size="1" style="font-size:10px"/></td>
				<td class="center">
						O : <input type="text" name="sportif[{$Row.id}][rebond_offensif]" value="0" size="1" style="font-size:10px"/><br/>
						D : <input type="text" name="sportif[{$Row.id}][rebond_deffensif]" value="0" size="1" style="font-size:10px"/><br/>
						<!-- TOTAL : <input type="text" name="sportif[{$Row.id}][rebond_total]" value="0" size="1" style="font-size:10px"/> -->
				</td>
				<td><input type="text" name="sportif[{$Row.id}][passe_decissive]" value="0" size="1" style="font-size:10px"/></td>
				<td><input type="text" name="sportif[{$Row.id}][interception]" value="0" size="1" style="font-size:10px" /></td>
				<td><input type="text" name="sportif[{$Row.id}][contre]" value="0" size="1" style="font-size:10px"/></td>
				<td><input type="text" name="sportif[{$Row.id}][balle_perdu]" value="0" size="1" style="font-size:10px"/></td>
				<td>
					<input type="text" name="sportif[{$Row.id}][faute]" value="0" size="1" style="font-size:10px"/><br/>
					P : <input type="text" name="sportif[{$Row.id}][faute_provoquee]" value="0" size="1" style="font-size:10px"/>				
				</td>
				<td class="center"><textarea name="sportif[{$Row.id}][observation]" cols="30" rows="3" style="font-size:10px"></textarea></td>
			</tr>
			{/foreach}
		</tbody>
	</table>
</div>{/strip}