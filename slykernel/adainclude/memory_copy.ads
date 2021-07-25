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

package Memory_Copy is
pragma Preelaborate;

   --****L* Memory_Copy/memcpy
   -- NAME
   -- memcpy
   -- FUNCTION
   -- Copies N storage units from area starting at Src to area starting
   -- at Dest without any check for buffer overflow. The memory areas
   -- must not overlap, or the result of this call is undefined.
   -- INPUTS
   -- Dest := Address to copy data to.
   -- Src  := Address to copy data from.
   -- N    := Number of bytes to copy.
   -- SEE ALSO
   -- Memory_Copy/memmove
   --***
   procedure memcpy (Dest : Address; Src : Address; N : size_t);
   pragma Export (C, memcpy, "memcpy");

   --****L* Memory_Copy/memmove
   -- NAME
   -- memmove
   -- FUNCTION
   -- Copies N storage units from area starting at S2 to area starting
   -- at S1 without any check for buffer overflow. The difference between
   -- this memmove and memcpy is that with memmove, the storage areas may
   -- overlap (forwards or backwards) and the result is correct (i.e. it
   -- is as if S2 is first moved to a temporary area, and then this area
   -- is copied to S1 in a separate step).
   -- INPUTS
   -- Dest := Address to move data to.
   -- Src  := Address to move data from.
   -- N    := Number of bytes to move.
   -- SEE ALSO
   -- Memory_Copy/memcpy
   --***
   procedure memmove (Dest : Address; Src : Address; N : size_t);
   pragma Export (C, memmove, "memmove");


end Memory_Copy;
