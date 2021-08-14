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


with Ada.Unchecked_Conversion;

package body Memory_Compare is

   ------------
   -- memcmp --
   ------------

   function memcmp (S1 : Address; S2 : Address; N : size_t) return int is
      subtype mem is char_array (size_t);
      type memptr is access mem;
      function to_memptr is
        new Ada.Unchecked_Conversion (Address, memptr);
      s1_p : constant memptr := to_memptr (S1);
      s2_p : constant memptr := to_memptr (S2);
   begin
      for J in 0 .. N - 1 loop
         if s1_p (J) < s2_p (J) then
            return -1;
         elsif s1_p (J) > s2_p (J) then
            return 1;
         end if;
      end loop;
      return 0;
   end memcmp;

end Memory_Compare;
