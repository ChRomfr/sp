<form method="post" class="form" action="#">
	<h1>Distinaraires</h1>
	<ul>
		{foreach $Joueurs as $Joueur}
			<li style="list-style:none;"><input type="checkbox" name="joueur[{$Joueur.id}]" value="{$Joueur.email}" /> {$Joueur.prenom} {$Joueur.nom}</li>
		{/foreach}
	</ul>
	<h1>Message</h1>
	<dl>
		<dt><label for="objet">{$lang.Objet}</label></dt>
		<dd><input type="text" name="email[objet]" id="objet" required /></dd>
	</dl>
	<dl>
		<dt><label for="message">{$lang.Message} :</label></dt>
		<dd><textarea name="email[message]" id="message" required rows="5" cols="50"></textarea></dd>
	</dl>
	<div class="center">
		<input type="submit" value="{$lang.Envoyer}" />
	</div>
</form>