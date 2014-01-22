<script>
jQuery(document).ready(function(){
	// binds form submission and fields to the validation engine
	jQuery("#formEditProg").validationEngine();
});
</script>

<form class="form" method="post" action="{getLink("programmation/edit/{$Prog.id}")}" id="formEditProg">
	{if !empty($Prog.equipe_id)}
		<dl>
			<dt><label for="equipe_id">{$lang.Equipe} :</label></dt>
			<dd>{foreach $Equipes as $Row}{if $Row.id == $Prog.equipe_id}{$Row.nom}{/if}{/foreach} <input type="hidden" name="prog[equipe_id]" value="{$Prog.equipe_id}" /></dd>
		</dl>
	{/if}
	<dl>
		<dt><label for="date_prog">{$lang.Date} :</label></dt>
		<dd><input type="text" name="prog[date_prog]" id="date_prog" size="10" class="validate[required,custom[date]]" value="{$Prog.date_prog}" /></dd>
	</dl>
	<dl>
		<dt><label for="moment_jour">{$lang.Moment} :</label></dt>
		<dd>
			<select name="prog[moment_jour]" id="moment_jour" required class="validate[required]">
				<option></option>
				<option value="2" {if $Prog.moment_jour == 2}selected="selected"{/if}>{$lang.Matin}</option>
				<option value="3" {if $Prog.moment_jour == 3}selected="selected"{/if}>{$lang.Apresmidi}</option>
			</select>
		</dd>
	</dl>
	<dl>
		<dt><label for="type">{$lang.Type} :</label></dt>
		<dd>
			<select name="prog[type]" id="type" required class="validate[required]">
				<option></option>
				{foreach $Types as $Row}
				<option value="{$Row.id}" {if $Prog.type == $Row.id}selected="selected"{/if}>{$Row.nom}</option>
				{/foreach}
			</select>
		</dd>
	</dl>
	<dl>
		<dt><label for="description">{$lang.Description} :</label></dt>
		<dd><textarea name="prog[description]" id="description" cols="45" rows="3" id="programmation">{$Prog.description}</textarea></dd>
	</dl>
	<div class="center">
		<input type="hidden" name="prog[id]" value="{$Prog.id}" />
		<input type="hidden" name="prog[edit_by]" value="{$smarty.session.utilisateur.id}" />
		<input type="hidden" name="prog[edit_on]" value="{$smarty.now}" />
		<input type="submit" value="{$lang.Enregistrer}" />
	</div>
</form>
<script type="text/javascript">
<!--
	$(function() {
		$( "#date_prog" ).datepicker({ dateFormat: 'dd/mm/yy', changeMonth:true, changeYear:true, showButtonPanel: true });
        $( "#date_prog" ).datepicker( "option", "showAnim", "clip" );      
	});
//-->
</script>