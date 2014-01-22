<script type="text/javascript">
<!--
{if $smarty.session.utilisateur.type == 'admin' || $smarty.session.acl.gest_document == 1}
    function deleteFichier(fichier_id){
        if( confirm('{$lang.Confirm_suppression_fichier} ?') ){
            window.location.href = '{getLink("document/delete/'+ fichier_id +'?token={$smarty.session.token}")}'
        }
    }
{/if}
//-->
</script>
{strip}
<ul class="breadcrumb">
    <li><a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a><span class="divider">/</span></li>
    <li class="active">{$lang.Documents}</li>
</ul>

<div class="well">

    <div class="fright">
    {if $smarty.session.utilisateur.type == 'admin' || $smarty.session.acl.gest_document == 1}
    <a href="{getLink("document/add")}" title=""><i class="icon-plus"></i></a>
    {/if}
    </div>
    <h1>{$lang.Documents}</h1>
    <div class="clear"></div>
    <table class="table table-bordered table-condensed table-striped table-hover">
        <thead>
            <tr>
                <th>#</td>
                <th>{$lang.Fichier}</th>
                <th>{$lang.Date}</th>
                <th></th>
                {if $smarty.session.utilisateur.type == 'admin' || $smarty.session.acl.gest_document == 1}
                <th></th>
                {/if}
            </tr>
        </thead>
        <tbody>
            {foreach $Fichiers as $Fichier}
            <tr>
                <td>{$Fichier.id}</td>
                <td>{$Fichier.nom}</td>
                <td>{$Fichier.add_on|date_format:$config.format_date_day}</td>
                <td class="center"><a href="{$config.url}{$config.url_dir}web/upload/documents/{$Fichier.fichier}" title=""><img src="{$config.url}{$config.url_dir}web/images/Save.png" alt="" style="width:18px;" /></a></td>
                {if $smarty.session.utilisateur.type == 'admin' || $smarty.session.acl.gest_document == 1}
                <td class="center">
                    <!-- Edition -->
                    <a href="{getLink("document/edit/{$Fichier.id}")}" title=""><i class="icon-pencil"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <!-- Suppression -->
                    <a href="javascript:deleteFichier({$Fichier.id});" title=""><i class="icon-trash"></i></a>
                </td>
                {/if}
            </tr>
            {/foreach}
        </tbody>
    </table>
</div>
{/strip}