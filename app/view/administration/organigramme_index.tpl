{strip}
<ul class="breadcrumb">
    <li><a href="{getLink("index")}" title="">{$lang.Accueil}</a><span class="divider">/</span></li>
    <li><a href="{getLink("administration")}" title="">{$lang.Administration}</a><span class="divider">/</span></li>
    <li>{$lang.Organigramme}</li>
</ul>

<div class="well">
    <div class="pull-right">
        <a href="{getLink("administration/organigrammeAdd")}" title=""><i class="icon-plus"></i></a>
    </div>
    <h4>{$lang.Organigramme}</h4>
    <div class="clearfix"></div>
    <table class="table">
        <thead>
            <tr>
                <th>{$lang.Personne}</th>
                <th>{$lang.Fonction}</th>
                <th>{$lang.Telephone}</th>
                <th>{$lang.Email}</th>
                <th>{$lang.Action}</th>
            </tr>
        </thead>
        <tbody>
            {foreach $Rows as $Row}
            <tr>
                <td>{$Row.nom} {$Row.prenom}</td>
                <td>{$Row.fonction_libelle}</td>
                <td>{$Row.telephone}</td>
                <td>{$Row.email}</td>
                <td class="center">
                    <a href="{getLink("administration/organigrammeEdit/{$Row.id}")}" title=""><i class="icon-edit"></i></a>
                    <a href="javascript:deletePersonne({$Row.id})" title=""><i class="icon-trash"></i></a>
                </td>
            </tr>
            {/foreach}
        </tbody>
    </table>
</div>
{/strip}
<script type="text/javascript">
<!--
function deletePersonne(personne_id){
    if( confirm("{$lang.Confirm_suppression_personne_organigramme} ?") ){
        window.location.href = '{getLink("administration/organigrammeDelete/'+ personne_id +'")}';
    }
}
//-->
</script>