<script type="text/javascript">
jQuery(document).ready(function(){
    // binds form submission and fields to the validation engine
    jQuery("#formAdd").validationEngine();
});

function loadTemplate(joueur_id){
	$('#formAdd').html('<div class="center"><img src="{$config.url}{$config.url_dir}web/images/lightbox-ico-loading.gif /></div>');
	
	tpl_id = $("#template").val();
	
	if( tpl_id == ''){
		tpl_id = 'none';
	}

	$.get(
            '{getLink("musculation/getCycleByTemplate/'+ tpl_id +'")}',{literal}
            {joueur_id: joueur_id, nohtml:'nohtml'},
            function(data){ $('#formAdd').html(data); }
        )
    {/literal}
}

</script>

{if $smarty.const.BREAD == 1}
<div id="bread">
<a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a>&nbsp;-&gt;&nbsp;
<a href="{getLink("musculation/index")}" title="{$lang.Musculation}">{$lang.Musculation}</a>&nbsp;-&gt;&nbsp;
{$lang.Nouveau_cycle}
</div>
{/if}
<h3>{$lang.Nouveau_cycle}</h3>
<div>
	<form>
		<dl>
			<dt><label>{$lang.Modeles} :</label></dt>
			<dd>
				<select id="template" onchange="loadTemplate({$joueur_id})">
					<option></option>
					{foreach $Templates as $Row}
					<option value="{$Row.id}">{$Row.nom}</option>
					{/foreach}
				</select>
			</dd>
		</dl>
		<dl>
			<dt><label>{$lang.Joueur} :</label></dt>
			<dd><a href="{getLink("joueur/fiche/{$Joueur.id}")}" title="">{$Joueur.prenom} {$Joueur.nom}</a></dd>
		</dl>
	</form>
</div>
<form id="formAdd" method="post">
    <dl>
        <dt><label for="nom">{$lang.Nom} :</label></dt>
        <dd><input type="text" name="cycle[nom]" id="nom" class="validate[required]" size="60"/></dd>
    </dl>
    <dl>
        <dt><label for="description">{$lang.Description} :</label></dt>
        <dd><textarea cols="50" rows="3" name="cycle[description]" id="description" class="validate[required]"></textarea></dd>
    </dl>
     
    <dl>
        <dt><label for="date_debut">{$lang.Date_debut} :</label></dt>
        <dd><input type="text" name="cycle[date_debut]" id="date_debut" class="validate[required,custom[date]]" size="10" /></dd>
    </dl>
    <dl>
        <dt><label for="date_fin">{$lang.Date_fin} :</label></dt>
        <dd><input type="text" name="cycle[date_fin]" id="date_fin" class="validate[required,custom[date]]" size="10" /></dd>
    </dl>
    <table class="tadmin" style="width:100%">
        <thead>
            <tr>
                <td>{$lang.Exercice}</td>
                <td>{$lang.Poids}</td>
                <td>{$lang.Repetition}</td>
                <td>{$lang.Serie}</td>
            </tr>
        </thead>
        <tbody>
        {foreach $Exercices as $Row}
        <tr>
            <td>{$Row.nom} <input type="hidden" name="exercice[{$Row.id}][exercice_id]" value="{$Row.id}" /></td>
            <td><input type="text" name="exercice[{$Row.id}][poid]" /></td>
            <td><input type="text" name="exercice[{$Row.id}][repetition]" /></td>
            <td><input type="text" name="exercice[{$Row.id}][serie]" /></td>
        </tr>
        {/foreach}
        </tbody>
    </table>
	<div>
		<br/>
		<input type="checkbox" name="save_as_template" id="save_as_template" /> {$lang.Enregistrer_comme_modele}
	</div>
    <div class="form_submit center">        
		<br/>
		<br/>
        <input type="hidden" name="cycle[joueur_id]" value="{$joueur_id}" />
        <input type="submit" value="{$lang.Enregistrer}" />
    </div>
</form>

<script type="text/javascript">
<!--
    $(function() {
        $( "#date_debut" ).datepicker({ dateFormat: 'dd/mm/yy', changeMonth:true, changeYear:true, showButtonPanel: true });
        $( "#date_fin" ).datepicker({ dateFormat: 'dd/mm/yy', changeMonth:true, changeYear:true, showButtonPanel: true });
        $( "#date_debut" ).datepicker( "option", "showAnim", "clip" );
        $( "#date_fin" ).datepicker( "option", "showAnim", "clip" );
    });
//-->
</script>