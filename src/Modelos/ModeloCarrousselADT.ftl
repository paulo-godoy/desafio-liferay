<#assign site_url = htmlUtil.escape(layout.getGroup().getDisplayURL(themeDisplay, !layout.isPublicLayout())) />

<style>
  <#assign categoryColors = {
    'Futebol': {'color': '#FF6600', 'textColor': 'white'},
    'Carros': {'color': '#FFA500', 'textColor': 'white'},
    'Saude': {'color': '#7FFF00', 'textColor': 'white'},
    'Musculacao': {'color': '#0000FF', 'textColor': 'white'},
    'Ciclismo': {'color': '#808080', 'textColor': 'black'}
  } />

  <#list entries as curEntry>
    <#assign categoryIdField = curEntry.getExpandoBridge().getAttribute('Category')!'' />
    <#assign categories = curEntry.getCategories() />

    <#list categories as category>
      <#assign categoryName = category.getName()?trim?lower_case />
      <#assign categoryInfo = categoryColors[categoryName]!{'color': '', 'textColor': ''} />

      <#if categoryInfo.color?has_content>
        <style>
          .category-${categoryIdField} .content-category-text {
            background: ${categoryInfo.color} !important;
            color: ${categoryInfo.textColor} !important;
            padding: 5px;
          }
        </style>
      </#if>
    </#list>
  </#list>

  <!-- Borda no estilo global -->
  <style>
    .content-category-text {
      border: 1px solid black !important;
      padding: 5px !important;
    }
  </style>
</style>

<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <#if entries?has_content>
      <#list entries as curEntry>
        <#assign i = curEntry_index>
        <li data-target="#carouselExampleIndicators" data-slide-to="${i}" <#if i == 0>class="active"</#if>></li>
      </#list>
    </#if>
  </ol>
  <div class="carousel-inner">
    <#if entries?has_content>
      <#list entries as curEntry>
        <#assign i = curEntry_index>
        <#assign categoryIdField = curEntry.getExpandoBridge().getAttribute('Category')!'' />
        <#assign categories = curEntry.getCategories() />

        <div class="carousel-item category-${categoryIdField} <#if i == 0>active</#if>">
          <div class="col-md-12">
            <div class="content-block p-3">
              <#assign assetRenderer = curEntry.getAssetRenderer() />
              <#assign DDMFormValuesReader = assetRenderer.getDDMFormValuesReader() />
              <#assign DDMFormValues = DDMFormValuesReader.getDDMFormValues() />
              <#assign DDMFormFieldValuesMap = DDMFormValues.getDDMFormFieldValuesMap() />
              <#assign DDMFormFieldsReferencesMap = assetRenderer.article.DDMStructure.DDMForm.getDDMFormFieldsReferencesMap(true) />

              <#assign titleField = DDMFormFieldsReferencesMap['Description'].name />
              <#assign titleValuesList = DDMFormFieldValuesMap[titleField]?if_exists />
              <#if titleValuesList?has_content>
                <#assign title = titleValuesList[0].getValue().getString(locale) />
                <h5 class="content-title mb-3">${title}</h5>
              </#if>

              <#assign imgField = DDMFormFieldsReferencesMap['Image'].name />
              <#assign imgValuesList = DDMFormFieldValuesMap[imgField]?if_exists />
              <#if imgValuesList?has_content>
                <#assign imgValue = imgValuesList[0].getValue() />
                <#assign imgJson = imgValue.getString(locale)?eval />
                <#if imgJson?has_content>
                  <a href="${site_url}/w/${curEntry.getTitle(locale)?html}">
                    <img class="content-image img-fluid mb-3" src="${imgJson.url}" alt="Image">
                  </a>
                </#if>
              </#if>

              <#assign contentField = DDMFormFieldsReferencesMap['Content'].name />
              <#assign contentValuesList = DDMFormFieldValuesMap[contentField]?if_exists />
              <#if contentValuesList?has_content>
                <#assign content = contentValuesList[0].getValue().getString(locale) />
                <p class="content-text mb-3">${content}</p>
              </#if>

              <!-- Aqui exibe as categorias -->
              <#if categories?has_content>
                <p class="content-category mb-3">
                  <#list categories as category>
                    <span class="content-category-text">${category.getName()}</span>
                    <#if category_has_next>,</#if>
                  </#list>
                </p>
              </#if>
            </div>
          </div>
        </div>
      </#list>
    </#if>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<script>
  document.addEventListener('DOMContentLoaded', function () {
    const categoryColors = {
      'Futebol': { 'color': '#FF6600', 'textColor': 'white' },
      'Carros': { 'color': '#FFA500', 'textColor': 'white' },
      'Saude': { 'color': '#7FFF00', 'textColor': 'white' },
      'Musculacao': { 'color': '#0000FF', 'textColor': 'white' },
      'Ciclismo': { 'color': '#808080', 'textColor': 'black' }
    };

    const entries = document.querySelectorAll('.content-category-text');

    entries.forEach(entry => {
      const categories = entry.innerText.split(',');

      categories.forEach(category => {
        const trimmedCategory = category.trim();
        const categoryInfo = categoryColors[trimmedCategory];

        if (categoryInfo) {
          entry.style.backgroundColor = categoryInfo.color;
          entry.style.color = categoryInfo.textColor;
          entry.style.padding = '5px';
          entry.style.border = '1px solid black';
        }
      });
    });
  });
</script>