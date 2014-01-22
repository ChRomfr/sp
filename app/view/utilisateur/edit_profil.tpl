{strip}<form method="post" action="#" id="formEdit" class="form">
	<h1>{$lang.Edition}</h1>
    <dl>
		<dt><label for="email">{$lang.Email}:</label></dt>
		<dd><input type="email" name="user[email]" id="email" value="{$smarty.session.utilisateur.email}" size="50"/></dd>
    </dl>
	<dl>
		<dt><label for="widget_index_rss">{$lang.Afficher_flux_actualite} :</label></dt>
		<dd><input type="checkbox" name="user[widget_index_rss]" id="widget_index_rss" {if $smarty.session.utilisateur.widget_index_rss == 1}checked="checked"{/if} /></dd>
	</dl>
	<dl>
		<dt><label for="flux_rss_1">{$lang.Flux_actualite} 1 :</label></dt>
		<dd><input type="url" name="user[flux_rss_1]" id="flux_rss_1" value="{$smarty.session.utilisateur.flux_rss_1}" size="50"/></dd>
	</dl>
	<dl>
		<dt><label for="flux_rss_2">{$lang.Flux_actualite} 2 :</label></dt>
		<dd><input type="url" name="user[flux_rss_2]" id="flux_rss_2" value="{$smarty.session.utilisateur.flux_rss_2}" size="50" /></dd>
	</dl>
	<dl>
		<dt><label for="widget_index_alerte">{$lang.Alerte_en_page_accueil} :</label></dt>
		<dd><input type="checkbox" name="user[widget_index_alerte]" id="widget_index_alerte" {if $smarty.session.utilisateur.widget_index_alerte == 1}checked="checked"{/if} /></dd>
	</dl>
	<dl>
		<dt><label for="gmail_adr">{$lang.Compte} GMAIL :</label></dt>
		<dd><input type="email" name="user[gmail_adr]" id="gmail_adr" value="{$smarty.session.utilisateur.gmail_adr}" size="50"/></dd>
	</dl>
	<dl>
		<dt><label for="gmail_password">{$lang.Password} GMAIL :</label></dt>
		<dd><input type="password" name="user[gmail_password]" id="gmail_password" value="{$smarty.session.utilisateur.gmail_password}" size="50" /></dd>
	</dl>
	<dl>
		<dt><label for="gmail_id_prv">{$lang.ID_private_calendar} :</label></dt>
		<dd><input type="text" name="user[gmail_id_prv]" id="gmail_id_prv" value="{$smarty.session.utilisateur.gmail_id_prv}" size="50" /></dd>
	</dl>
	{if $smarty.session.acl.gest_joueur == 1}
	<dl>
		<dt><label for="widget_index_blessure">{$lang.Blessure_page_accueil} :</label></dt>
		<dd><input type="checkbox" name="user[widget_index_blessure]" id="widget_index_blessure" {if $smarty.session.utilisateur.widget_index_blessure == 1}checked="checked"{/if} /></dd>
	</dl>
	
	<dl>
		<dt><label for="index_trombi">{$lang.Trombi_sur_accueil} :</label></dt>
		<dd><input type="checkbox" name="user[index_trombi]" id="index_trombi" {if $smarty.session.utilisateur.index_trombi == 1}checked="checked"{/if} /></dd>
	</dl>
	<dl>
		<dt><label for="joueur_trombi">{$lang.Preference_affichage_joueur} :</label></dt>
		<dd>
			<select name="user[joueur_trombi]" id="joueur_trombi">
				<option value="0">{$lang.Liste}</option>
				<option value="1" {if $smarty.session.utilisateur.joueur_trombi == 1}selected="selected"{/if} >{$lang.Trombinoscope}</option>
			</select>
		</dd>
	</dl>
	{/if}
	<div class="center">
		<input type="submit" value="{$lang.Enregistrer}" />
	</div>
</form>{/strip}