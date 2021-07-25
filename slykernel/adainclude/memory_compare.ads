-------------------------------------------------------------------------------
--  Copyright (C) 2011 Ross James Duff                                       --
--                                                                           --
--    This file is part of the Sly Kernel.                                   --
--                                                                           --
--    The Sly Kernel is free software: you can redistribute it and/or modify --
--    it under the terms of the GNU General Public License as published by   --
--    the Free Software Foundation, either version 3 of the License, or      --
--    (at your option) any later version.                                    --
--                                                                           --
--    The Sly Kernel is distributed in the hope that it will be useful,      --
--    but WITHOUT ANY WARRANTY; without even the implied warranty of         --
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the          --
--    GNU General Public License for more details.                           --
--                                                                           --
--    You should have received a copy of the GNU General Public License      --
--    along with the Sly Kernel.  If not, see <http://www.gnu.org/licenses/>.--
-------------------------------------------------------------------------------


with System; use System;
with Interfaces.C; use Interfaces.C;

package Memory_Compare is
pragma Preelaborate;

   --****L* Memory_Compare/memcmp
   -- NAME
   -- memcmp
   -- FUNCTION
   -- Compares the first N bytes of the memory areas S1 and S2.  It returns
   -- an integer less than, equal  to,  or  greater  than zero  if  S1  is
   -- found, respectively, to be less than, to match, or be greater than S2.
   -- INPUTS
   -- S1 := First source address.
   -- S2 := Second source address.
   -- N  := Number of bytes to compare.
   -- OUTPUTS
   -- int := Value determining whether there is a difference.
   --***
   function memcmp (S1 : Address; S2 : Address; N : size_t) return int;
   pragma Export (C, memcmp, "memcmp");

end Memory_Compare;
