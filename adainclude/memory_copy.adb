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

package body Memory_Copy is

   subtype mem is char_array (size_t);
   type memptr is access all mem;
   function to_memptr is new Ada.Unchecked_Conversion (Address, memptr);

   ------------
   -- memcpy --
   ------------

   procedure memcpy (Dest : Address; Src : Address; N : size_t) is
      subtype mem is char_array (size_t);
      type memptr is access mem;
      function to_memptr is
        new Ada.Unchecked_Conversion (Address, memptr);
      dest_p : constant memptr := to_memptr (Dest);
      src_p  : constant memptr := to_memptr (Src);
   begin
      if N > 0 then
         for J in 0 .. N - 1 loop
            dest_p (J) := src_p (J);
         end loop;
      end if;
   end memcpy;

   -------------
   -- memmove --
   -------------

   procedure memmove (Dest : Address; Src : Address; N : size_t) is
      dest_p : constant memptr := to_memptr (Dest);
      src_p  : constant memptr := to_memptr (Src);
   begin
      --  Return immediately if no bytes to copy.

      if N = 0 then
         return;
      end if;

      --  This function must handle overlapping memory regions
      --  for the source and destination. If the Dest buffer is
      --  located past the Src buffer then we use backward copying,
      --  and forward copying otherwise.

      if Dest > Src then
         for J in reverse 0 .. N - 1 loop
            dest_p (J) := src_p (J);
         end loop;
      else
         for J in 0 .. N - 1 loop
            dest_p (J) := src_p (J);
         end loop;
      end if;
   end memmove;
end Memory_Copy;
