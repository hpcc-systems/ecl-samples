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

rScatter :=
  record
    unsigned profit;
    unsigned cost;
    unsigned sales;
  end;

dScatter :=
  dataset([
    {72, 68, 440},
    {89, 95, 324},
    {21, 8, 161},
    {32, 3, 11},
    {48, 50, 101},
    {27, 57, 350},
    {89, 71, 229},
    {34, 8, 176},
    {9, 83, 547},
    {23, 68, 356},
    {48, 53, 141},
    {13, 99, 299},
    {75, 82, 275},
    {15, 3, 518},
    {96, 7, 256},
    {61, 57, 63},
    {93, 91, 39},
    {84, 63, 437},
    {79, 25, 213},
    {57, 92, 298},
    {99, 3, 283},
    {76, 39, 321},
    {11, 55, 410},
    {66, 84, 424},
    {43, 84, 110},
    {17, 97, 49},
    {59, 34, 196},
    {4, 15, 70},
    {55, 55, 536},
    {21, 56, 424},
    {14, 30, 296},
    {41, 99, 331},
    {65, 80, 317},
    {73, 62, 6},
    {22, 31, 491},
    {43, 3, 433},
    {96, 34, 565},
    {38, 13, 220},
    {12, 33, 403},
    {28, 79, 374},
    {86, 95, 176},
    {87, 28, 394},
    {50, 78, 375},
    {57, 20, 134},
    {45, 97, 403},
    {38, 17, 39},
    {82, 92, 558},
    {68, 4, 30},
    {14, 9, 410},
    {83, 73, 497},
    {81, 47, 59}], rScatter);

output(dScatter, named('ScatterChart_Scatter_Test'));
