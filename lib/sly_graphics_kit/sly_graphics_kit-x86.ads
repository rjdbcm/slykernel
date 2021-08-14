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


with X86IO; use X86IO;

package Sly_Graphics_Kit.X86 is

   VGA_AC_INDEX   : constant  := 16#3C0#;
   VGA_AC_WRITE   : constant Integer := 16#3C0#;
   VGA_AC_READ    : constant Integer := 16#3C1#;
   VGA_MISC_WRITE : constant Integer := 16#3C2#;
   VGA_SEQ_INDEX  : constant Integer := 16#3C4#;
   VGA_SEQ_DATA   : constant Integer := 16#3C5#;
   VGA_DAC_READ_INDEX  : constant Integer := 16#3C7#;
   VGA_DAC_WRITE_INDEX : constant Integer := 16#3C8#;
   VGA_DAC_DATA   : constant Integer := 16#3C9#;
   VGA_MISC_READ  : constant Integer := 16#3CC#;
   VGA_GC_INDEX   : constant Integer := 16#3CE#;
   VGA_GC_DATA    : constant Integer := 16#3CF#;

   VGA_CRTC_INDEX  : constant Integer := 16#3D4#;
   VGA_CRTC_DATA   : constant Integer := 16#3D5#;
   VGA_INSTAT_READ : constant Integer := 16#3DA#;

   VGA_NUM_SEQ_REGS  : constant Integer := 5;
   VGA_NUM_CRTC_REGS : constant Integer := 25;
   VGA_NUM_GC_REGS   : constant Integer := 9;
   VGA_NUM_AC_REGS   : constant Integer := 21;
   VGA_NUM_REGS : constant Integer := (1 + VGA_NUM_SEQ_REGS + VGA_NUM_CRTC_REGS
                                        + VGA_NUM_GC_REGS + VGA_NUM_AC_REGS);



end Sly_Graphics_Kit.X86;
