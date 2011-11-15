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

rPie :=
  record
    string state; // Note: prefix a column that you want output as a JavaScript Date with 'jsdate_'
    integer4 sales_value;
  end;

dPie :=
  dataset([
    {'Florida', 41},
    {'Washington', 52},
    {'Nevada', 62},
    {'California', 83},
    {'New York', 73},
    {'Texas', 73},
    {'Maine', 66},
    {'New Hampshire', 59},
    {'Georgia', 54},
    {'Kentucky', 55},
    {'Vermont', 26}], rPie);

output(dPie, named('PieChart_Pie_Chart_Test'));
