<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h4 id="">Ajout programmation</h4>
  </div>
  <div class="modal-body">

	<form class="form-horizontal well" method="post" action="{getLink("programmation/add")}" id="formAddProg">
		<div class="control-group">
			<label class="control-label" for="equipe_id">{$lang.Equipe} :</label>
			<div class="controls">
				<select id="equipe_id" name="prog[equipe_id]">
					<option></option>
					{foreach $Equipes as $Row}
					<option value="{$Row.id}">{$Row.nom}</option>
					{/foreach}
				</select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="date_prog">{$lang.Date} :</label>
			<div class="controls">
				<input type="text" name="prog[date_prog]" id="date_prog" size="10" class="validate[required,custom[date]]" {if isset($smarty.get.cdate) && !empty($smarty.get.cdate)}value="{$smarty.get.cdate}"{/if} />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="moment_jour">{$lang.Moment} :</label>
			<div class="controls">
				<select name="prog[moment_jour]" id="moment_jour" required class="validate[required]">
					<option></option>
					<option value="2" {if isset($smarty.get.moment) && !empty($smarty.get.moment) && $smarty.get.moment == 2}selected="selected"{/if}>{$lang.Matin}</option>
					<option value="3" {if isset($smarty.get.moment) && !empty($smarty.get.moment) && $smarty.get.moment == 3}selected="selected"{/if}>{$lang.Apresmidi}</option>
	                <option value="99">{$lang.Journee_entiere}</option>
				</select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="type">{$lang.Type} :</label>
			<div class="controls">
				<select name="prog[type]" id="type" required class="validate[required]">
					<option></option>
					{foreach $Types as $Row}
					<option value="{$Row.id}">{$Row.nom}</option>
					{/foreach}
				</select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="description">{$lang.Description} :</label>
			<div class="controls"><textarea name="prog[description]" id="description" cols="45" rows="3" id="programmation"></textarea></div>
		</div>
		<div class="form-actions">
			<input type="submit" value="{$lang.Enregistrer}" class="btn btn-primary" />
		</div>
	</form>
</div><!-- /modal-body -->
<script type="text/javascript">
<!--
jQuery(document).ready(function(){
	// binds form submission and fields to the validation engine
	jQuery("#formAddProg").validationEngine();
});

$(function() {
	$( "#date_prog" ).datepicker({ dateFormat: 'dd/mm/yy', changeMonth:true, changeYear:true, showButtonPanel: true });
    $( "#date_prog" ).datepicker( "option", "showAnim", "clip" );      
});
//-->
</script>