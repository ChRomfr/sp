<!-- Saison add -->
<ul class="breadcrumb">
	<li><a href="{getLink("index")}" title="{$lang.Accueil}">{$lang.Accueil}</a><span class="divider">/</span></li>
	<li><a href="{getLink("administration")}" title="{$lang.Administration}">{$lang.Administration}</a><span class="divider">/</span></li>
	<li><a href="{getLink("administration/saisonindex")}" title="{$lang.Saisons}">{$lang.Saisons}</a><span class="divider">/</span></li>
	<li>{$lang.Nouvelle}</li>
</ul>

<form method="post" action="" class="well form-horizontal" id="form_add_saison">
    
    <fieldset>
        <legend>{$lang.Nouvelle}</legend>
    

	<div class="control-group">
		<label class="control-label">{$lang.Saison} :</label>
		<div class="controls">
			<input type="text" name="saison[name]" id="name" placeholder="" />
		</div>
	</div>

	<!-- Date debut -->
	<div class="control-group">
		<label class="control-label">{$lang.Date_debut} :</label>
		<div class="controls">
			<input type="text" name="saison[date_start]" id="date_start" placeholder="" class="input-small"/>
		</div>
	</div>

	<!-- Date fin -->
	<div class="control-group">
		<label class="control-label">{$lang.Date_fin} :</label>
		<div class="controls">
			<input type="text" name="saison[date_end]" id="date_end" placeholder="" class="input-small"/>
		</div>
	</div>
	
    </fieldset>    
        
	<div class="form-actions">
		<button type="submit">{$lang.Enregistrer}</button>
	</div>
</form>

<script type="text/javascript">
<!--
$(function() {
	$( "#date_start" ).datepicker({ dateFormat: 'yy-mm-dd', changeMonth:true, changeYear:true, showButtonPanel: true });
	$( "#date_end" ).datepicker({ dateFormat: 'yy-mm-dd', changeMonth:true, changeYear:true, showButtonPanel: true });
    $( "#date_start" ).datepicker( "option", "showAnim", "clip" );
    $( "#date_end" ).datepicker( "option", "showAnim", "clip" );
});

jQuery(document).ready(function(){
    $('#form_add_saison').validate({
        rules: {
            "saison[name]": {
                required:true,
            },
           "saison[date_start]":{
           		required:true,
           },
           "saison[date_end]":{
           		required:true,
           },
        },
        messages:{
            "user[name]":{
                required: "Veuillez saisir un nom",
            },
            "saison[date_start]":{
                required: "Veuillez indiquer la date de debut de saison",
            },
            "saison[date_end]":{
                required: "Veuillez indiquer la date de fin de saison",
            },
        },
 
        highlight:function(element)
        {
            $(element).parents('.control-group').removeClass('success');
            $(element).parents('.control-group').addClass('error');
        },
        unhighlight: function(element)
        {
            $(element).parents('.control-group').removeClass('error');
            $(element).parents('.control-group').addClass('success');
        }
    });
});


//-->
</script>