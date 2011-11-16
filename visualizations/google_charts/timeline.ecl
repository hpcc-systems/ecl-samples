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

rTimeLine :=
  record
    string jsdate_year; // Note: prefix a column that you want output as a JavaScript Date with 'jsdate_'
    integer4 sales_value;
    varstring sales_lable;
  end;

dTimeLine :=
  dataset([
    {'20000101', 41, '413'},
    {'20010101', 52, '529'},
    {'20020101', 62, '628'},
    {'20030101', 83, '834'},
    {'20040101', 73, '734'},
    {'20050101', 73, '735'},
    {'20060101', 66, '665'},
    {'20070101', 59, '592'},
    {'20080101', 54, '541'},
    {'20090101', 55, '556'},
    {'20100101', 53, '534'},
    {'20110101', 26, '261'}], rTimeLine);

output(dTimeLine, named('Timeline_Timeline_Test'));
