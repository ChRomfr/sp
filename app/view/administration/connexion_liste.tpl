<div id="bread">
    <a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a>&nbsp;>>&nbsp;
    <a href="{getLink("administration/index")}" title="{$lang.Administration}">{$lang.Administration}</a>&nbsp;>>&nbsp;
    History of connection
</div>
<div class="showData">
    <h1>History of connection</h1>
    <table class="tadmin">
        <thead>
            <tr>
                <td>#</td>
                <td>User</td>
                <td>Date</td>
                <td>IP</td>
                <td>Result</td>
            </tr>
        </thead>
        <tbody>
            {foreach $Connexions as $Row}
            <tr>
                <td>{$Row.id}</td>
                <td>{$Row.identifiant} {if !empty($Row.identifiant)}<small>(#{$Row.user_id})</small>{/if}</td>
                <td>{$Row.date_connexion|date_format:$config.format_date}</td>
                <td>{$Row.adr_ip}</td>
                <td>{$Row.result}</td>
            </tr>
            {/foreach}
        </tbody>
    </table>
</div>