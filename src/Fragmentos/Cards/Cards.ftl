<div class="fragment_1">
  [#if configuration?? && configuration.numbersCards??]
    [#list 1..configuration.numbersCards as index]
      <div class="col-md-12"> <!-- Adicionando a classe col-md-12 aqui -->
        <div class="card" style="margin-bottom: 20px; overflow: hidden;">
          <lfr-editable id="imagem-${index}" type="image">
            <img src="" class="card-img-top w-100" style="object-fit: cover;" alt="...">
          </lfr-editable>
          
          <div class="card-body">
            <lfr-editable id="title-${index}" type="rich-text">
              <span class="card-title">Título</span>
            </lfr-editable>
            
            <lfr-editable id="description-${index}" type="rich-text">
              <span class="card-text">Descrição</span>
            </lfr-editable>
            
            <lfr-editable id="button-${index}" type="link">
              <a href="#" class="btn btn-lg bg-${configuration.buttonColor.cssClass} text-${configuration.buttonTextColor.cssClass}" >Botão</a>
            </lfr-editable>
          </div>
        </div>
      </div>
    [/#list]
  [/#if]
</div>


<script>
    {
        "fieldSets": [
            {
            "fields": [
                {
                "name": "numbersCards",
                "label": "Numero de Cards",
                "description": "number-cards",
                "type": "text",
                "typeOptions": {
                    "placeholder": "Placeholder"
                },
                "dataType": "int",
                "defaultValue": "1"
                },
                {
                "name": "buttonColor",
                "label": "Cor do botão",
                "type": "colorPalette",
                "dataType": "object",
                "defaultValue": {
                    "cssClass": "cdm-laranja",
                    "rgbValue": "rgb(244, 121, 32)"
                }
                },
                {
                "name": "buttonTextColor",
                "label": "Cor de texto do botão",
                "type": "colorPalette",
                "dataType": "object",
                "defaultValue": {
                    "cssClass": "cdm-branco",
                    "rgbValue": "rgb(255,255,255)"
                }
                }
            ]
            }
        ]
    }
</script>