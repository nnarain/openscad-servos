include <vitamins/servos.scad>
include <vitamins/servo_joints.scad>

servo = SG90;

axiel_offset = servo_axiel_offset(servo);

translate([axiel_offset[0], axiel_offset[1], servo_column_height(servo)]) {
    servo_joint1(SG90_JOINT1);
}

servo(servo);
