{strip}
<div class="well">
<h4>{$lang.Documents}</h4>
<table class="table table-striped table-hover table-bordered">
    <thead>
        <tr>
            <td>{$lang.Nom}</td>
            <td>{$lang.Extension}</td>
            <td>{$lang.Date_ajout}</td>
            {if $smarty.session.acl.gest_joueur == true}
            <td></td>
            {/if}
        </tr>
    </thead>
    <tbody>
    {foreach $Documents as $Row}
        <tr>
            <td><a href="{$config.url}{$config.url_dir}web/upload/joueurs/{$joueur_id}/documents/{$Row.file_name}" title="" target="_blank">{$Row.nom}</a></td>
            <td>{$Row.extension}</td>
            <td>{$Row.date_add|date_format:$config.format_date}</td>
            {if $smarty.session.acl.gest_joueur == true}
            <td class="center"><a href="javascript:deleteDocument({$Row.id})"><img src="{$config.url}{$config.url_dir}web/images/delete.png" alt="" /></a></td>
            {/if}
        </tr>
    {/foreach}
    </tbody>
</table>
</div>
{if $smarty.session.acl.gest_joueur == 1}
<form method="post" enctype="multipart/form-data" action="{getLink('joueur/uploadFile?nohtml')}" target="uploadFrame" onsubmit="return sendUpload();" id="formUpload" class="form">
    <dl>
        <dt><label>{$lang.Fichier} :</label></dt>
        <dd><input type="file" name="doc" class="validate[required]" id="fichier_doc"/></dd>
    </dl>
    <dl>
        <dt><label>{$lang.Nom} :</label></dt>
        <dd><input type="text" name="fichier[nom]" id="fichier_nom" class="validate[required]"/></dd>
    </dl>
    <dl>
        <dt><label>{$lang.Description} :</label></dt>
        <dd><textarea name="fichier[description]" rows="2" cols="40"></textarea></dd>
    </dl>
    <div class="center">
        <input type="hidden" name="fichier[joueur_id]" value="{$joueur_id}" />
        <input type="submit" value="{$lang.Enregistrer}" />
    </div>
</form>

<div id="uploadInfos">
    <div id="uploadStatus"></div>
    <iframe id="uploadFrame" name="uploadFrame" style="display:none;"></iframe>
</div>
{/if}
{/strip}
<script type="text/javascript">
<!--
jQuery(document).ready(function(){
    // binds form submission and fields to the validation engine
    jQuery("#formUpload").validationEngine();
});

function sendUpload(){
    if( $('#fichier_nom').val() != '' && $('#fichier_doc').val() != ''){
        $("#uploadStatus").html('<div class="center"><img src="{$config.url}{$config.url_dir}web/images/lightbox-ico-loading.gif" alt="" /><br/>Uploading ...</div>');
        return true;
    }
    return false;
}

function endUpload(){
    $("#uploadStatus").html('<div class="center">Upload done !</div>');
    $.get(
        '{getLink("joueur/getDocuments/{$joueur_id}")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#ui-tabs-8').html(data); }
    )
    {/literal}
}

function deleteDocument(did){
    if( confirm('{$lang.Confirm_suppression_document} ?') ){
        $.get(
            '{getLink("joueur/deleteDocument/'+did+'")}',{literal}
            {nohtml:'nohtml'},
            function(data){ $('#ui-tabs-8').html(data); }
        )
        {/literal}  
    }
     
}

//-->
</script>