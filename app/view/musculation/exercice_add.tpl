<script type="text/javascript">
jQuery(document).ready(function(){
    // binds form submission and fields to the validation engine
    jQuery("#formAdd").validationEngine();
});
</script>
{strip}
{if $smarty.const.BREAD == 1}
<div id="bread">
<a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a>&nbsp;>>&nbsp;
<a href="{getLink("musculation/index")}" title="{$lang.Musculation}">{$lang.Musculation}</a>&nbsp;>>&nbsp;
{$lang.Nouvel_exercice}
</div>
{/if}

<form method="post" id="formAdd" class="form" enctype="multipart/form-data">
	<h1>{$lang.Nouvel_exercice}</h1>
	<div class="fleft" style="width: 500px;">
    <dl>
        <dt><label for="nom">{$lang.Exercice} :</label></dt>
        <dd><input type="text" name="exercice[nom]" id="nom" size="45" class="validate[required]" /></dd>
    </dl>
	<dl>
		<dt><label for="zone1">{$lang.Zone}  1: </label></dt>
		<dd>
			<select name="zone[1][zone_id]" id="zone1" class="validate[required]" required>
				{foreach $Zones as $Row}
				<option value="{$Row.id}">{$Row.nom}</option>
				{/foreach}
			</select>
		</dd>
	</dl>
	<dl>
		<dt><label for="zone2">{$lang.Zone}  2: </label></dt>
		<dd>
			<select name="zone[2][zone_id]" id="zone2">
				<option></option>
				{foreach $Zones as $Row}
				<option value="{$Row.id}">{$Row.nom}</option>
				{/foreach}
			</select>
		</dd>
	</dl>
	{*
    <dl>
        <dt><label for="muscle_travail">{$lang.Muscle_travaille} :</label></dt>
        <dd><input type="text" name="exercice[muscle_travail]" id="muscle_travail" size="45" /></dd>
    </dl>
	*}
    <dl>
        <dt><label for="description">{$lang.Description} :</label></dt>
        <dd><textarea cols="50" rows="10" name="exercice[description]" id="description"></textarea></dd>
    </dl>
     <dl>
    	<dt><label for="video">{$lang.Video} :</label></dt>
    	<dd><input type="file" name="video" id="video" /><br/><small>*.mp4</small></dd>
    </dl>
    {* PHOTOS *}
    <dl>
    	<dt><label for="image1">{$lang.Image} 1:</label></dt>
    	<dd><input type="file" name="image1" id="image1" /></dd>
    </dl>
    <dl>
    	<dt><label for="image1">{$lang.Image} 2:</label></dt>
    	<dd><input type="file" name="image2" id="image2" /></dd>
    </dl>
    <dl>
    	<dt><label for="image3">{$lang.Image} 3:</label></dt>
    	<dd><input type="file" name="image3" id="image3" /></dd>
    </dl>
    <dl>
    	<dt><label for="image4">{$lang.Image} 4:</label></dt>
    	<dd><input type="file" name="image4" id="image4" /></dd>
    </dl>
	<div class="center form_submit">
        <input type="submit" value="{$lang.Enregistrer}" />
    </div>
	</div>
	<div class="fleft" style="margin-left:50px;">
		<img src="{$config.url}{$config.url_dir}web/images/muscu_face_400_num.png"/>
	</div>
	<div class="fleft" style="padding-left:10px;">
		<img src="{$config.url}{$config.url_dir}web/images/muscu_dos_400_num.png"/>
	</div>
	<div class="clear"></div>
    
</form>{/strip}