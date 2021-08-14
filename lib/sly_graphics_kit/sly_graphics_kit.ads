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

with Binary_Types; use Binary_Types;

package Sly_Graphics_Kit is

   type Sly_Screen_Info is
   record
      Width      : Integer;
      Hieght     : Integer;
      Pix_Pitch  : Integer;
      Depth      : Integer;
      Pix_Width  : Integer;
   end record;

   --****L* Sly_Graphics_Kit/Draw_Line
   -- NAME
   -- Draw_Line
   -- FUNCTION
   -- Draws a line using a speedy version of Bresenham's algorithm.
   --***
   procedure Draw_Line(X1 : in out Integer; X2 : Integer; Y1 : in out Integer;
                       Y2 : Integer);
   pragma Inline (Draw_Line);

end Sly_Graphics_Kit;
