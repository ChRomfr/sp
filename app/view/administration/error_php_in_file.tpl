<table class="tadmin">
    <tbody>
        {foreach $Errors as $Row}
        <tr>
            <td>{$Row.0}</td>
            <td>{$Row.1}</td>
        </tr>
        {/foreach}
    </tbody>
</table>