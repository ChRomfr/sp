{strip}
<div class="container-fluid">			
	<form method="post" action="" class="form form-horizontal container well">
		<h1>{$lang.Identification}</h1>

		<div class="control-group">
			<label class="control-label" for="identifiant">{$lang.Identifiant}</label>
			<div class="controls"><input type="text" name="login[identifiant]" id="identifiant" required placeholder="{$lang.Identifiant}" /></div>
		</div>

		<div class="control-group">
			<label class="control-label" for="password">{$lang.Mot_de_passe}</label>
			<div class="controls"><input type="password" name="login[password]" id="password" required /></div>
		</div >

		<input type="submit" name="send" value="{$lang.Envoyer}" class="btn btn-primary"/>
	</form>
</div>
{/strip}