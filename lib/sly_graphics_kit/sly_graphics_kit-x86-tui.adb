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

package body Sly_Graphics_Kit.X86.TUI is

   cur_cursorX : Integer := 0;
   cur_cursorY : Integer := 0;
   VGA_Address : Integer;
   Scr_Width   : Unsigned_16;
   Scr_Height  : Unsigned_16;
   Text_Attrib : Unsigned_16;

   procedure Start_TUI is
   begin
      cur_cursorX := 0;
      cur_cursorY := 0;

      GotoXY (X => 0, Y => 0);

      VGA_Address := 16#b_8000#;

      Text_Attrib := WHITE_BLACK;

      Scr_Width  := 80;
      Scr_Height := 25;
   end Start_TUI;

   procedure GotoXY (X : Integer; Y : Integer) is
   position : Byte := X * (Scr_Width + Y);
   begin
      outb (port => VGA_CRTC_INDEX,
            val  => 16#0F#);
      outb (port => VGA_CRTC_DATA,
            val  => (position and 16#FF#));
      outb (port => VGA_CRTC_INDEX,
            val  => 16#0E#);
      outb (port => VGA_CRTC_DATA,
            val  => (Shift_Right(position, 8) and 16#FF#));

      cur_cursorX := X;
      cur_cursorY := Y;
   end GotoXY;

   procedure Update_Cursor is
   begin
      GotoXY (X => cur_cursorX, Y => cur_cursorY);
   end Update_Cursor;



end Sly_Graphics_Kit.X86.TUI;


