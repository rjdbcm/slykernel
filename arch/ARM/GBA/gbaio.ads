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
with Interfaces; use Interfaces;
package GBAIO is

   type GBA_Key is new Word;

   KEY_A      : GBA_Key := 16#0001#;
   KEY_B      : GBA_Key := 16#0002#;
   KEY_SELECT : GBA_Key := 16#0004#;
   KEY_START  : GBA_Key := 16#0008#;
   KEY_RIGHT  : GBA_Key := 16#0010#;
   KEY_LEFT   : GBA_Key := 16#0020#;
   KEY_UP     : GBA_Key := 16#0040#;
   KEY_DOWN   : GBA_Key := 16#0080#;
   KEY_R      : GBA_Key := 16#0100#;
   KEY_L      : GBA_Key := 16#0200#;
   KEY_ANY    : GBA_Key := 16#03ff#;

   BOOT_ROM              : constant := 16#0000_0000#;
   BOOT_ROM_END          : constant := BOOT_ROM + 16#4000#;
   EX_WRAM               : constant := 16#02000000#;
   EX_WRAM_END           : constant := EX_WRAM + 16#40000#;
   CPU_WRAM              : constant := 16#0300_0000#;
   CPU_WRAM_END          : constant := CPU_WRAM + 16#8000#;
   WRAM                  : constant := EX_WRAM;
   WRAM_END              : constant := CPU_WRAM_END;
   INTR_CHECK_BUF        : constant := CPU_WRAM_END - 16#8#;
   SOFT_RESET_DIRECT_BUF : constant := CPU_WRAM_END - 16#6#;
   INTR_VECTOR_BUF       : constant := CPU_WRAM_END - 16#4#;
   REG_BASE              : constant := 16#0400_0000#;
   REG_KEY               : constant := REG_BASE + 16#130#;
   REG_END               : constant := REG_BASE + 16#300#;

   key_curr : GBA_Key := KEY_ANY;
   key_prev : GBA_Key := KEY_ANY;

   procedure Key_Poll;

end GBAIO;
