/*##############################################################################

    Copyright (C) 2011 HPCC Systems.

    All rights reserved. This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as
    published by the Free Software Foundation, either version 3 of the
    License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
############################################################################## */

rGeoMap :=
  record
    varstring state;
    unsigned mysales;
  end;

dGeoMap :=
  dataset([
    {'ALABAMA             ', 542},
    {'ALASKA              ', 409},
    {'ARIZONA             ', 81},
    {'ARKANSAS            ', 14},
    {'CALIFORNIA          ', 421},
    {'COLORADO            ', 51},
    {'CONNECTICUT         ', 293},
    {'DELAWARE            ', 175},
    {'DISTRICT OF COLUMBIA', 795},
    {'FLORIDA             ', 685},
    {'GEORGIA             ', 331},
    {'HAWAII              ', 816},
    {'IDAHO               ', 32},
    {'ILLINOIS            ', 158},
    {'INDIANA             ', 373},
    {'IOWA                ', 506},
    {'KANSAS              ', 562},
    {'KENTUCKY            ', 712},
    {'LOUISIANA           ', 798},
    {'MAINE               ', 682},
    {'MARYLAND            ', 732},
    {'MASSACHUSETTS       ', 10},
    {'MICHIGAN            ', 750},
    {'MINNESOTA           ', 438},
    {'MISSISSIPPI         ', 529},
    {'MISSOURI            ', 870},
    {'MONTANA             ', 393},
    {'NEBRASKA            ', 495},
    {'NEVADA              ', 24},
    {'NEW HAMPSHIRE       ', 455},
    {'NEW JERSEY          ', 692},
    {'NEW MEXICO          ', 900},
    {'NEW YORK            ', 623},
    {'NORTH CAROLINA      ', 994},
    {'NORTH DAKOTA        ', 25},
    {'OHIO                ', 410},
    {'OKLAHOMA            ', 726},
    {'OREGON              ', 580},
    {'PENNSYLVANIA        ', 214},
    {'RHODE ISLAND        ', 995},
    {'SOUTH CAROLINA      ', 798},
    {'SOUTH DAKOTA        ', 464},
    {'TENNESSEE           ', 725},
    {'TEXAS               ', 983},
    {'UTAH                ', 345},
    {'VERMONT             ', 113},
    {'VIRGINIA            ', 828},
    {'WASHINGTON          ', 82},
    {'WEST VIRGINIA       ', 571},
    {'WISCONSIN           ', 401},
    {'WYOMING             ', 744}], rGeoMap);

output(dGeomap, named('GeomapChart_Test_GeoMap'));
