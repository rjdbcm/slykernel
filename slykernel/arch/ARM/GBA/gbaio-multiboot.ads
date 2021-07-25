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
with Interfaces.C; use Interfaces.C;
with Binary_Types; use Binary_Types;
package GBAIO.Multiboot is

   MULTIBOOT_SLAVE_MAX       : constant := 3;
   MULTIBOOT_HEADER_SIZE     : constant := 16#c0#;
   MULTIBOOT_PACKET_SIZE_MIN : constant := 16#100#;
   MULTIBOOT_PACKET_SIZE_MAX : constant := 16#40000#;

   type Multiboot_Data is array(1..MULTIBOOT_SLAVE_MAX) of Byte;

   type Multiboot_Parameters is
   record
      System_Work       : Char_Array(1..5);
      Handshake_Data    : Byte;
      Padding           : Byte;
      Handshake_Timeout : Word;
      Probe_Count       : Byte;
      Client_Data       : Multiboot_Data;
      Palette_Data      : Byte;
      Response_Bit      : Byte;
      Client_Bit        : Byte;
      Reserved1         : Byte;
      Boot_Src_Ptr      : aliased Byte;
      Boot_End_Ptr      : aliased Byte;
      Master_Ptr        : aliased Byte;
      Reserved2         : aliased Multiboot_Data;
      System_Work2      : Char_Array(1..4);
      Send_Flag         : Byte;
      Probe_Target_Bit  : Byte;
      Check_Wait        : Byte;
      Server_Type       : Byte;
   end record;

   pragma Convention(C, Multiboot_Parameters);

end GBAIO.Multiboot;
