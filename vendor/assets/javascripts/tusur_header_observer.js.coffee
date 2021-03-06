$ ->
  first_menu = $('#menu_first')
  second_menu = $('#menu_second')

  #для мобилок
  if window.innerWidth < 750
    $('.has_arrow', first_menu).removeClass('has_arrow')

  dropdown_menus = $('ul.nav.navbar-nav', first_menu).not('.navbar-right')
  return true if dropdown_menus.length < 2

  site_menu = dropdown_menus[1]
  site_menu_caret = $('.caret', site_menu)
  site_menu_toggle = $('.dropdown-toggle', site_menu)
  site_menu_toggle.click (e) ->
    false if $(e.target).hasClass('disabled')

  site_menu_caret.hide = () ->
    if this.hasClass('caret')
      this.addClass('tmp_caret')
      this.removeClass('caret')
    true

  site_menu_caret.show = () ->
    if this.hasClass('tmp_caret')
      this.removeClass('tmp_caret')
      this.addClass('caret')
    true

  site_menu_caret.hide()
  site_menu_toggle.addClass('disabled')

  $('.auth_block .dropdown').click ->
    cloud = $('.ntf_cloud')
    cloud.hide().html('') if cloud.is(':visible')

  $(window).scroll () ->

    if $(window).scrollTop() > 0
      first_menu.css('border-bottom', 'solid 1px #ccc')
      site_menu_caret.show()
      site_menu_toggle.removeClass('disabled')
      site_menu_toggle.dropdown()

    if $(window).scrollTop() == 0
      first_menu.css('border-bottom', 'none')
      site_menu_caret.hide()
      site_menu_toggle.click() if site_menu_toggle.parent().hasClass('open')
      site_menu_toggle.addClass('disabled')

  return
