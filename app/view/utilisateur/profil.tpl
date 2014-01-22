<div class="showData">
    <h1>{$lang.Your_profil}</h1>
    <form>
    <dl>
        <dt><label>{$lang.Identifiant} :</label></dt>
        <dt><strong>{$smarty.session.utilisateur.identifiant}</strong></dt>
    </dl>
    <dl>
        <dt><label>{$lang.Account_type} :</label></dt>
        <dt><strong>{$smarty.session.utilisateur.type}</strong></dt>
    </dl>
    </form>
</div>