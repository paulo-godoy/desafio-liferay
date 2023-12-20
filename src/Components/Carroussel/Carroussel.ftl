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
        <div class="carousel-item <#if i == 0>active</#if>">
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
                  <a href="/${curEntry.getTitle(locale)?html}">
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