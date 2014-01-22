{if count($Entrainements) > 0 || count($Seances) > 0}
<dl>
    <dt><label>{$lang.Seances} :</label></dt>
    <dd>
        <select name="sequence[entrainement_liaison]" id="entrainement_liaison">
            <option></option>
            {if count($Entrainements) > 0}
                {foreach $Entrainements as $Row}
                <option value="e{$Row.id}">{$Row.description|wordwrap:30}</option>
                {/foreach}
            {/if}
            {if count($Seances) > 0}
                {foreach $Seances as $Row}
                <option value="m{$Row.id}">{$lang.Musculation}</option>
                {/foreach}
            {/if}
        </select>
    </dd>
</dl>
{/if}