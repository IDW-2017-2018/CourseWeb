
    <#list items>

    <div class="tablecontainer">
        
        <table class="tableresult">

            <tr class="trresult">

                <th class="thresultfront" colspan="7"><h1 class="title">LOG</h1></th>

            </tr>

            <tr class="trresult">

                <th class="thresult">LIST</th>

            </tr>

            <#items as item>

            <tr class="trresult-list">

                <td class="tdresult-list" colspan="2">${strip_slashes(item)}</td>
                
            </tr>

            </#items>

        </table>

    </div>

    <#else>

    </#list>


    <script>

        var coll = document.getElementsByClassName("collapsible");
        var i;

        for (i = 0; i < coll.length; i++) {
          coll[i].addEventListener("click", function() {
            this.classList.toggle("active");
            var content = this.nextElementSibling;
            if (content.style.maxHeight){
              content.style.maxHeight = null;
            } else {
              content.style.maxHeight = content.scrollHeight + "px";
            } 
          });
        }

    </script>
