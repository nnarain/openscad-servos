

function servo_base_dims(spec) = spec[0];
function servo_base_dim_x(spec) = servo_base_dims(spec)[0];
function servo_base_dim_y(spec) = servo_base_dims(spec)[1];
function servo_base_dim_z(spec) = servo_base_dims(spec)[2];
function servo_screw_bar_dims(spec) = spec[1];
function servo_screw_bar_dims_x(spec) = servo_screw_bar_dims(spec)[0];
function servo_screw_bar_dims_y(spec) = servo_screw_bar_dims(spec)[1];
function servo_screw_bar_dims_z(spec) = servo_screw_bar_dims(spec)[2];
function servo_screw_bar_offset(spec) = [-(servo_screw_bar_dims_x(spec) - servo_base_dim_x(spec)) / 2, 0, 18.2 - 2.5];
function servo_column_radius(spec) = servo_base_dim_y(spec) / 2;
function servo_column_height(spec) = spec[2];
function servo_axiel_radius(spec) = spec[3];
function servo_axiel_height(spec) = spec[4];
function servo_screw_hole_radius(spec) = spec[5];
// function servo_screw_hole_distance(spec) = spec[6];
function servo_screw_hole_positions(spec) = [[servo_base_dim_x(spec) / 2 - 13.75, servo_base_dim_y(spec) / 2], [servo_base_dim_x(spec) / 2 + 13.75, servo_base_dim_y(spec) / 2]];


module servo(spec) {
    base_dims = servo_base_dims(spec);
    screw_bar_dims = servo_screw_bar_dims(spec);
    screw_bar_offset = servo_screw_bar_offset(spec);

    column_radius = servo_column_radius(spec);
    column_height = servo_column_height(spec);
    column_offset = [base_dims[0] - column_radius, base_dims[1] / 2, 0];

    axiel_radius = servo_axiel_radius(spec);
    axiel_height = servo_axiel_height(spec);

    screw_hole_radius = servo_screw_hole_radius(spec);
    // screw_hole_distance = servo_screw_hole_distance(spec);

    difference() {
        union() {
            color("blue") cube(base_dims);
            color("blue") translate(screw_bar_offset) cube(screw_bar_dims);
            color("blue") translate(column_offset) cylinder(r=column_radius, h=column_height, $fn=20);
            color("white") translate(column_offset) cylinder(r=axiel_radius, h=axiel_height, $fn=20);
        }

        for (p = servo_screw_hole_positions(spec)) {
            translate([p[0], p[1]]) {
                cylinder(r=screw_hole_radius, h=column_height, $fn=20);
                // # translate([0, 0, screw_bar_offset[2]]) cube(size=[1, 1, 1], center=true);
            }
        }
    }
}
