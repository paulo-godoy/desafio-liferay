<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${html_title}</title>

	<meta content="initial-scale=1.0, width=device-width" name="viewport" />

	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

	<!-- Include Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

  <!-- Include jQuery and Popper.js -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>

  <!-- Include Bootstrap JS -->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<@liferay_util["include"] page=top_head_include />
	<script>
        Liferay.on('allPortletsReady', function () {
            var entryId = 123; // Substitua pelo ID da sua entrada

            // Verifique se o objeto Liferay está definido e se a função está disponível
            if (Liferay && Liferay.Util) {
                // Faça uma chamada AJAX para obter as categorias do servidor
                Liferay.Util.fetch(
                    '<%=request.getAttribute("theme-display").getURLHome()%>/c/portal/json_service',
                    {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
                        },
                        body: 'p_p_id=YourPortletID_WAR_YourPortletID&' +
                              'p_p_lifecycle=2&' +
                              'p_p_state=normal&' +
                              'p_p_mode=view&' +
                              'p_p_resource_id=getCategories&' +
                              'entryId=' + entryId
                    }
                ).then(function (response) {
                    return response.json();
                }).then(function (data) {
                    // Sucesso ao obter categorias
                    var categories = data.categories;

                    // Sua lógica aqui para definir a cor com base nas categorias
                    var categoryColorClass = "";

                    for (var i = 0; i < categories.length; i++) {
                        var category = categories[i];

                        // Verifique a tag da categoria e atribua a classe correspondente
                        if (category.name === "Saude") {
                            categoryColorClass = "saude";
                        } else if (category.name === "Musculacao") {
                            categoryColorClass = "musculacao";
                        } else if (category.name === "Carros") {
                            categoryColorClass = "carros";
                        } else if (category.name === "Futebol") {
                            categoryColorClass = "futebol";
                        } else if (category.name === "Ciclismo") {
                            categoryColorClass = "ciclismo";
                        }
                    }

                    // Agora você pode usar categoryColorClass conforme necessário
                    console.log('Classe de cor:', categoryColorClass);
                }).catch(function (error) {
                    // Lidar com erros, se necessário
                    console.error('Erro ao obter categorias:', error);
                });
            }
        });
    </script>
	<style>
		.saude {
		background-color: #aaffaa;
		}

		.musculacao {
			background-color: #ffaaff;
		}

		.carros {
			background-color: #aaffff;
		}

		.futebol {
			background-color: #ffffaa;
		}

		.ciclismo {
			background-color: #ffaaaa;
		}
	</style>
</head>

<body class="${css_class}">

<@liferay_ui["quick-access"] contentId="#main-content" />

<@liferay_util["include"] page=body_top_include />

<@liferay.control_menu />

<div class="container-fluid position-relative" id="wrapper">
	<header id="banner" role="banner" style="display: flex; justify-content: space-between; align-items: center; text-align: center;">
		<!-- Logo, Nome do Site -->
		<div id="heading" aria-level="1" class="site-title" role="heading" style="display: flex; align-items: center;">
			<div>
				<a class="${logo_css_class} logo_custom" href="${site_default_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
					<img alt="${logo_description}" height="${site_logo_height}" src="${site_logo}" width="${site_logo_width}" />
				</a>

				<#if show_site_name>
					<span class="site-name" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
						${site_name}
					</span>
				</#if>
			</div>

			
		</div>

		<!-- Link Home -->
			<#--  <a href="${site_default_url}" style="text-decoration: none; color: #333; margin-left: 10px;">
				Home
			</a>  -->

		<#if !is_signed_in>
			<a data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in" rel="nofollow">${sign_in_text}</a>
		</#if>

		<#if has_navigation && is_setup_complete>
			<#include "${full_templates_path}/navigation.ftl" />
		</#if>

		<!-- Barra de pesquisa -->
		<div class="search-bar" style="width: 300px;">
			<@liferay_portlet["runtime"] portletName="com_liferay_portal_search_web_search_bar_portlet_SearchBarPortlet" />
		</div>
	</header>



	<section id="content">
		<h2 class="hide-accessible sr-only" role="heading" aria-level="1">${htmlUtil.escape(the_title)}</h2>

		<#if selectable>
			<@liferay_util["include"] page=content_include />
		<#else>
			${portletDisplay.recycle()}

			${portletDisplay.setTitle(the_title)}

			<@liferay_theme["wrap-portlet"] page="portlet.ftl">
				<@liferay_util["include"] page=content_include />
			</@>
		</#if>
	</section>

	<footer id="footer" role="contentinfo">
		<p class="powered-by">
			<@liferay.language_format
				arguments='<a href="http://www.liferay.com" rel="external">Liferay</a>'
				key="powered-by-x"
			/>
		</p>
	</footer>
</div>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />


</body>

</html>