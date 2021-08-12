
function servo_joint_tab(spec) = spec[0];
function servo_joint_connector(spec) = spec[1];
function servo_joint_tab_length(spec) = servo_joint_tab(spec)[0];
function servo_joint_tab_thickness(spec) = servo_joint_tab(spec)[1];
function servo_joint_tab_radius(spec) = servo_joint_tab(spec)[2];
function servo_joint_connector_height(spec) = servo_joint_connector(spec)[0];
function servo_joint_connector_radius(spec) = servo_joint_connector(spec)[1];

module servo_joint1(spec) {
    // Tab
    tab_length = servo_joint_tab_length(spec);
    tab_thickness = servo_joint_tab_thickness(spec);
    tab_radius = servo_joint_tab_radius(spec);

    conn_height = servo_joint_connector_height(spec);
    conn_radius = servo_joint_connector_radius(spec);

    union() {
        color("white") cylinder(r=conn_radius, h=conn_height, $fn=30);

        translate([0, 0, conn_height - tab_thickness])
            color("white")
            hull() {
                cylinder(r=tab_radius[0], h=tab_thickness, $fn=20);
                translate([tab_length, 0, 0]) cylinder(r=tab_radius[1], h=tab_thickness, $fn=20);
            }
    }
}
