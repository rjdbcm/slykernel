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
with System.Machine_Code; use System.Machine_Code;
with Binary_Types; use Binary_Types;
package body GBAIO is

   procedure Key_Poll is

      function Get_REG_KEY return GBA_Key is
      ret : GBA_Key;
      begin
         Asm ("mov r0, #0x4000000;mov r1, #0x100; add r1, r1, #0x30;ldr r1, [r0];ldr r0, [r1]",
              Outputs => (GBA_Key'Asm_Output("=r", ret)),
              Volatile => True);
         return ret;
      end Get_REG_KEY;

      function Key_Current_State return GBA_Key is
      ret : GBA_Key := key_curr;
      begin
         return ret;
      end Key_Current_State;

      function Key_Previous_State return GBA_Key is
      ret : GBA_Key := key_prev;
      begin
         return ret;
      end Key_Previous_State;

      function Key_Is_Down (key : GBA_Key) return GBA_Key is
      ret : GBA_Key := (not key_curr) and key;
      begin
         return ret;
      end Key_Is_Down;

      function Key_Is_Up (key : GBA_Key) return GBA_Key is
      ret : GBA_Key := key_curr and key;
      begin
         return ret;
      end Key_Is_Up;

      function Key_Was_Down (key : GBA_Key) return GBA_Key is
      ret : GBA_Key := (not key_prev) and key;
      begin
         return ret;
      end Key_Was_Down;

      function Key_Was_Up (key : GBA_Key) return GBA_Key is
      ret : GBA_Key := key_prev and key;
      begin
         return ret;
      end Key_Was_Up;

      function Key_Transit (key : GBA_Key) return GBA_Key is
      ret : GBA_Key := (key_curr xor key_prev) and key;
      begin
         return ret;
      end Key_Transit;

      function Key_Held (key : GBA_Key) return GBA_Key is
      ret : GBA_Key := (not (key_curr or key_prev)) and key;
      begin
         return ret;
      end Key_Held;

      function Key_Pressed (key : GBA_Key) return GBA_Key is
      ret : GBA_Key := ((not key_curr) and key_prev) and key;
      begin
         return ret;
      end Key_Pressed;

      function Key_Released (key : GBA_Key) return GBA_Key is
      ret : GBA_Key := (key_curr and (not key_prev)) and key;
      begin
         return ret;
      end Key_Released;
   begin
      key_prev := key_curr;
      key_curr := Get_REG_KEY;
   end Key_Poll;

end GBAIO;
