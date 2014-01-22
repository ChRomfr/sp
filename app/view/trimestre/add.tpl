<script type="text/javascript">
<!--
function verifFormTrimestre(){
    var error;
    error = 0;
    
    if( $("#tnumber").val() == ""){
        error++;
        $("#tnumber").css('border-color','red');
    }
    
    if( $("#tannee").val() == ""){
        error++;
        $("#tannee").css('border-color','red');
    }
    
    if( error == 0){
        return true;
    }
    
    return false;
}
//-->
</script>
<form action="{getLink("trimestre/add/{$joueur_id}")}" method="post" id="formAddTrimestre" onsubmit="return verifFormTrimestre()">
	{if count($Formations) > 0}
	<dl>
		<dt><label for="formation_id">{$lang.Formation} :</label></dt>
		<dd>
			<select name="trimestre[formation_id]" id="formation_id">
                <option></option>
				{foreach $Formations as $Row}
				<option value="{$Row.id}">{$Row.nom}</option>
				{/foreach}
            </select>
		</dd>
	</dl>
	{/if}
    <dl>
        <dt><label>{$lang.Trimestre}</label></dt>
        <dd>
            <select name="trimestre[number]" id="tnumber">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
            </select>
        </dd>
    </dl>
    <dl>
        <dt><label>{$lang.Annee_scolaire} :</label></dt>
        <dd><input type="text" name="trimestre[annee]" placeholder="2011-2012" id="tannee" /></dd>
    </dl>
    <div class="form_submit center">
        <input type="hidden" name="trimestre[joueur_id]" value="{$joueur_id}" />
        <input type="submit" value="{$lang.Enregistrer}" />
    </div>
</form>