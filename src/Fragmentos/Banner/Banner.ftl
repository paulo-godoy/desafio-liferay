<div class="cnu-banner mb-0 card" style="padding-top:${configuration.PreenchimentoPelicula}px; padding-bottom:${configuration.PreenchimentoPelicula}px;">
  <lfr-editable id="ImagemDesktop" type="image" class="img-desktop d-none d-sm-block">
    <img src="" class="card-img"/>
  </lfr-editable>
  <lfr-editable id="ImagemMobile" type="image" class="img-mobile d-sm-none">
    <img src="" class="card-img"/>
  </lfr-editable>
  <div style="opacity: 0.1;" class="card-img-overlay bg-${configuration.backgroundColor.cssClass} row flex-column justify-content-center py-4 c-px-md-80">
    <div class="col-lg-5">
      <lfr-editable class="my-3" id="text01" type="rich-text">
        <span style="color: var(--ct-as-claro, #000); font-family: Unimed Sans; font-size: 16px; font-style: normal; font-weight: 600;">
          Lorem ipsum
        </span>
      </lfr-editable>
      <lfr-editable id="text02" type="rich-text">
        <span class="banner-title" style="color: var(--ct-as-claro, #000); font-family: Unimed Sans; font-size: 40px; font-style: normal; font-weight: 700;">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit.
        </span>
      </lfr-editable>
      <lfr-editable class="my-3" id="link01" type="link" style="font-size: 18px; font-weight: 600;">
        <a href="#" class="btn btn-lg bg-${configuration.buttonColor.cssClass} text-${configuration.buttonTextColor.cssClass}" style="color: var(--ct-as-claro, #000); font-family: Unimed Sans; font-size: 18px; font-style: normal; font-weight: 600;">
          Lorem ipsum dolor 
        </a>
      </lfr-editable>
    </div>
  </div>
</div>
 
<style>
.cnu-banner .card-img{
  height: calc(450px + ${configuration.PreenchimentoPelicula}px);
}
 
.cnu-banner .card-img:before {
  background-color : var(--${configuration.backgroundColor.cssClass});
}
</style>

<script>
    {
        "fieldSets": [
            {
            "fields": [
                {
                "name": "PreenchimentoPelicula",
                "label": "Preenchimento superior e inferior da Película",
                "description": "Preenchimento superior e inferior da Película",
                "type": "select",
                "dataType": "int",
                "defaultValue": "0",
                "typeOptions": {
                    "validValues": [
                    {"label": "0", "value": "0"},
                    {"label": "1", "value": "4"},
                    {"label": "2", "value": "8"},
                    {"label": "3", "value": "16"},
                    {"label": "4", "value": "24"},
                    {"label": "5", "value": "48"},
                    {"label": "6", "value": "72"},
                    {"label": "7", "value": "96"},
                    {"label": "8", "value": "120"},
                    {"label": "9", "value": "144"},
                    {"label": "10", "value": "160"}
                    ]
                }
                },
                {
                "name": "backgroundColor",
                "label": "Cor da película do componente",
                "type": "colorPalette",
                "dataType": "object",
                "defaultValue": {
                    "cssClass": "cdm-verde-escuro",
                    "rgbValue": "rgba(0, 78, 76, 0.7)"
                }
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
                    "rgbValue": "rgb(255, 255, 255)"
                }
                }
            ]
            }
        ]
    }
</script>