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

with GBAIO; use GBAIO;
package Sly_Graphics_Kit.GBA is
   pragma Pure(GBA);


   PLTT            : constant := 16#0500_0000#;
   PLTT_END        : constant := PLTT + 16#400#;
   BG_PLTT         : constant := PLTT + 16#0#;
   BG_PLTT_END     : constant := PLTT + 16#200#;
   OBJ_PLTT        : constant := PLTT + 16#200#;
   OBJ_PLTT_END    : constant := PLTT + 16#400#;
   VRAM            : constant := 16#0600_0000#;
   VRAM_END        : constant := VRAM + 16#18000#;
   BG_VRAM         : constant := VRAM + 16#0#;
   BG_BITMAP0_VRAM : constant := VRAM + 16#0#;
   BG_BITMAP1_VRAM : constant := VRAM + 16#a000#;
   OBJ_MODE0_VRAM  : constant := VRAM + 16#10000#;
   OBJ_MODE1_VRAM  : constant := VRAM + 16#10000#;
   OBJ_MODE2_VRAM  : constant := VRAM + 16#10000#;
   OBJ_MODE3_VRAM  : constant := VRAM + 16#14000#;
   OBJ_MODE4_VRAM  : constant := VRAM + 16#14000#;
   OBJ_MODE5_VRAM  : constant := VRAM + 16#14000#;
   OBJ_VRAM_END    : constant := VRAM + 16#18000#;

   --****L* Sly_Graphics_Kit/ARM/GBA/REG_DISPCTRL
   -- NAME
   -- REG_DISPCTRL
   -- FUNCTION
   -- Control register of the display.
   --***
   REG_DISPCTRL : constant := REG_BASE + 16#0#;


   REG_STAT        : constant := REG_BASE + 16#4#;
   REG_VCOUNT      : constant := REG_BASE + 16#6#;

   --****L* Sly_Graphics_Kit/ARM/GBA/REG_MOSAIC
   -- NAME
   -- REG_MOSAIC
   -- FUNCTION
   -- Register of the mosaic size.
   --***
   REG_MOSAIC : constant := REG_BASE + 16#4c#;

   --****L* Sly_Graphics_Kit/ARM/GBA/REG_BLDCTRL
   -- NAME
   -- REG_BLDCTRL
   -- FUNCTION
   -- Blend mode control register.
   --***
   REG_BLDCTRL : constant := REG_BASE + 16#50#;

   --****L* Sly_Graphics_Kit/ARM/GBA/REG_BLDALPHA
   -- NAME
   -- REG_BLDALPHA
   -- FUNCTION
   -- Blend mode alpha parameter.
   --***
   REG_BLDALPHA : constant := REG_BASE + 16#52#;

   --****L* Sly_Graphics_Kit/ARM/GBA/REG_BLDGAMMA
   -- NAME
   -- REG_BLDGAMMA
   -- FUNCTION
   -- Blend mode gamma parameter.
   -- NOTES
   -- I'm not sure this is actually in keeping with a technical
   -- definition of gamma. -Ross
   --***
   REG_BLDGAMMA : constant := REG_BASE + 16#54#;


   --****L* Sly_Graphics_Kit/ARM/GBA/REG_WINCTRL
   -- NAME
   -- REG_WINCTRL
   -- FUNCTION
   -- Window control register.
   --***
   REG_WINCTRL : constant := REG_BASE + 16#40#;

   --****L* Sly_Graphics_Kit/ARM/GBA/REG_WIN0H
   -- NAME
   -- REG_WIN0H
   -- FUNCTION
   -- Window 0 horizontal area register.
   --***
   REG_WIN0H : constant := REG_BASE + 16#40#;

   --****L* Sly_Graphics_Kit/ARM/GBA/REG_WIN1H
   -- NAME
   -- REG_WIN1H
   -- FUNCTION
   -- Window 1 horizontal area register.
   --***
   REG_WIN1H : constant := REG_BASE + 16#42#;

   --****L* Sly_Graphics_Kit/ARM/GBA/REG_WIN0V
   -- NAME
   -- REG_WIN0V
   -- FUNCTION
   -- Window 0 vertical area register.
   --***
   REG_WIN0V : constant := REG_BASE + 16#44#;

   --****L* Sly_Graphics_Kit/ARM/GBA/REG_WIN1V
   -- NAME
   -- REG_WIN1V
   -- FUNCTION
   -- Window 1 vertical area register.
   --***
   REG_WIN1V : constant := REG_BASE + 16#46#;

   --****L* Sly_Graphics_Kit/ARM/GBA/REG_WIN_IN
   -- NAME
   -- REG_WIN_IN
   -- FUNCTION
   -- Internal window control register.
   --***
   REG_WIN_IN : constant := REG_BASE + 16#48#;

   --****L* Sly_Graphics_Kit/ARM/GBA/REG_WIN0
   -- NAME
   -- REG_WIN0
   -- FUNCTION
   -- Window 0 control register.
   --***
   REG_WIN0 : constant := REG_BASE + 16#48#;

   --****L* Sly_Graphics_Kit/ARM/GBA/REG_WIN1
   -- NAME
   -- REG_WIN1
   -- FUNCTION
   -- Window 1 control register.
   --***
   REG_WIN1 : constant := REG_BASE + 16#49#;

   --****L* Sly_Graphics_Kit/ARM/GBA/REG_WIN_OUT
   -- NAME
   -- REG_WIN_OUT
   -- FUNCTION
   -- External window control register.
   --***
   REG_WIN_OUT : constant := REG_BASE + 16#4a#;


   REG_OBJWIN : constant := REG_BASE + 16#4b#;


   REG_BGCTRL : constant := REG_BASE + 16#8#;

   REG_BG0CTRL : constant := REG_BASE + 16#8#;
   REG_BG1CTRL : constant := REG_BASE + 16#a#;
   REG_BG2CTRL  : constant := REG_BASE + 16#c#;
   REG_BG3CTRL  : constant := REG_BASE + 16#e#;
   REG_BGOFS    : constant := REG_BASE + 16#10#;
   REG_BG0HOFS  : constant := REG_BASE + 16#10#;
   REG_BG0VOFS  : constant := REG_BASE + 16#12#;
   REG_BG1HOFS  : constant := REG_BASE + 16#14#;
   REG_BG1VOFS  : constant := REG_BASE + 16#16#;
   REG_BG2HOFS  : constant := REG_BASE + 16#18#;
   REG_BG2VOFS  : constant := REG_BASE + 16#1a#;
   REG_BG3HOFS  : constant := REG_BASE + 16#1c#;
   REG_BG3VOFS  : constant := REG_BASE + 16#1e#;
   REG_BG2AFFINE: constant := REG_BASE + 16#20#;
   REG_BG2PA    : constant := REG_BASE + 16#20#;
   REG_BG2PB    : constant := REG_BASE + 16#22#;
   REG_BG2PC    : constant := REG_BASE + 16#24#;
   REG_BG2PD    : constant := REG_BASE + 16#26#;
   REG_BG2X     : constant := REG_BASE + 16#28#;
   REG_BG2X_L   : constant := REG_BASE + 16#28#;
   REG_BG2X_H   : constant := REG_BASE + 16#2a#;
   REG_BG2Y     : constant := REG_BASE + 16#2c#;
   REG_BG2Y_L   : constant := REG_BASE + 16#2c#;
   REG_BG2Y_H   : constant := REG_BASE + 16#2e#;
   REG_BG3AFFINE: constant := REG_BASE + 16#30#;
   REG_BG3PA    : constant := REG_BASE + 16#30#;
   REG_BG3PB    : constant := REG_BASE + 16#32#;
   REG_BG3PC    : constant := REG_BASE + 16#34#;
   REG_BG3PD    : constant := REG_BASE + 16#36#;
   REG_BG3X     : constant := REG_BASE + 16#38#;
   REG_BG3X_L   : constant := REG_BASE + 16#38#;
   REG_BG3X_H   : constant := REG_BASE + 16#3a#;
   REG_BG3Y     : constant := REG_BASE + 16#3c#;
   REG_BG3Y_L   : constant := REG_BASE + 16#3c#;
   REG_BG3Y_H   : constant := REG_BASE + 16#3e#;

end Sly_Graphics_Kit.ARM.GBA;
