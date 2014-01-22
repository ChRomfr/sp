<script type="text/javascript">
<!--
jQuery(document).ready(function(){
	jQuery("#changePassword").validationEngine();
});
//-->
</script>

<div id="bread">

</div>

<form class="form" id="changePassword" method="post">
    <h1>{$lang.Changement_de_password}</h1>
    <dl>
        <dt><label for="current_password">{$lang.Current_password} :</label></dt>
        <dd><input type="password" id="current_password" name="password[current_password]" class="validate[required]" required /></dd>
    </dl>
    <dl>
        <dt><label for="new_password">{$lang.New_password} :</label></dt>
        <dd><input type="password" id="new_password" name="password[new_password]" class="validate[required]" required /></dd>
    </dl>
    <dl>
        <dt><label for="new_password_repeat">{$lang.New_password_repeat} :</label></dt>
        <dd><input type="password" id="new_password_repeat" name="password[new_password_repeat]" class="validate[required,equals[new_password]]" required/></dd>
    </dl>
    <div class="center">
        <input type="submit" value="{$lang.Enregistrer}" />
    </div>
</form>