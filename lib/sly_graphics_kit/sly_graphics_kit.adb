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

package body Sly_Graphics_Kit is

   procedure Draw_Line(X1 : in out Integer; X2 : Integer; Y1 : in out Integer;
                       Y2 : Integer) is
      DX  : Integer;
      DY  : Integer;
      SX  : Integer;
      SY  : Integer;
      ERR : Integer;
      E2  : Integer;

      begin
         DX := abs(X2 - X1);
         DY := abs(Y2 - Y1);

         if X1 < X2 then
            SX := 1;
         else
            SX := -1;
         end if;
         if Y1 < Y2 then
            SY := 1;
         else
            SY := -1;
         end if;
         ERR := DX - DY;

         Place_Pix :
         loop
            -- Put_Pixel(X1, Y1);
            exit Place_Pix when X1 = X2 and Y1 = Y2;
            E2 := 2 * ERR;
            if E2 > -DY then
               ERR := ERR - DY;
               X1  := X1 - SX;
            end if;
            if E2 < DX then
               ERR := ERR + DX;
               Y1  := Y1 + SY;
            end if;
         end loop Place_Pix;
   end Draw_Line;

end Sly_Graphics_Kit;
