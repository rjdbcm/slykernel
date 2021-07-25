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


package Binary_Types is

   type Byte is mod 256;
   type Word is mod 65536;
   type Dword is mod 4294967296;
   type Qword is mod 18446744073709551616;

   type Volatile_Byte  is new Byte;
   pragma Volatile (Volatile_Byte);

   type Volatile_Word  is new Word;
   pragma Volatile (Volatile_Word);

   type Volatile_Dword is new Dword;
   pragma Volatile (Volatile_Dword);

   type Volatile_Qword is new Qword;
   pragma Volatile (Volatile_Qword);



end Binary_Types;
