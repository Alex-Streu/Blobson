/// @description Insert description here
// You can write your code in this editor

//Slide in the Tabs
menu_tab1_y += (menu_tab1_y_destination - menu_tab1_y) / 4
menu_tab2_y += (menu_tab2_y_destination - menu_tab2_y) / 4
menu_tab3_y += (menu_tab3_y_destination - menu_tab3_y) / 4

menu_tab1_slideout_x = menu_tab1_x;
menu_tab1_slideout_y = menu_tab1_y + menu_tab1_slideout_y_offset;

menu_tab2_slideout_x = menu_tab2_x;
menu_tab2_slideout_y = menu_tab2_y + menu_tab2_slideout_y_offset;

if menu_tab1_slideout_xscale < 1   {menu_tab1_slideout_xscale += 0.05}
if menu_tab2_slideout_xscale < 1   {menu_tab2_slideout_xscale += 0.05}
if menu_tab3_slideout_xscale < 1   {menu_tab3_slideout_xscale += 0.05}

//Slide in the boxes
menu_boxes_x += (menu_boxes_x_destination - menu_boxes_x) / 4

//Slide in the info
menu_info_y += (menu_info_y_destination - menu_info_y) / 4



//Slide back
////menu_boxes_x += (menu_boxes_x_spawn - menu_boxes_x) / 4