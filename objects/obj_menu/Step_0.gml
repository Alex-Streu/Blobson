/// @description Handle menu creation
if (pages[| pageIndex] == undefined) { return; }

render_menu_page(pages, pageIndex, owner, false);