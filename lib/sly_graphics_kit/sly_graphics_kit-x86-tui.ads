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

with C_Types; use C_Types;
with Binary_Types; use Binary_Types;
with X86IO; use X86IO;
with Interfaces; use Interfaces;

package Sly_Graphics_Kit.X86.TUI is

   type FMT is new Character;
   type FMT_PTR is access FMT;

   WHITE_BLACK : constant := 16#07#;
   RED_GREEN   : constant := 16#26#;


   function doprintf (fmt : FMT_PTR; args : Print_Arg_Array; ptr : Void_Ptr)
                      return Integer;
   procedure Start_TUI;

   procedure GotoXY (X : Integer; Y : Integer);

   procedure Update_Cursor;



end Sly_Graphics_Kit.X86.TUI;
