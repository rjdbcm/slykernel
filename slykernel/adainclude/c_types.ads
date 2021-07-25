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

package C_Types is

   type Void is null record;
   pragma Convention (C, Void);

   type Void_Ptr is access all Void;
   pragma Convention (C, Void_Ptr);

   type Arg_Class_Type is (An_Integer, A_Float, A_String);

   type String_Access is access all String;

       -- default defined so these can reside in an array
   type Print_Argument (Arg_Class: Arg_Class_Type := An_Integer) is
       record
          case Arg_Class is
             when An_Integer =>
                I: integer;
             when A_Float =>
                F: float;
             when A_String =>
                S: String_Access;
          end case;
       end record;

   type Print_Arg_Array is array (Positive range <>) of Print_Argument;

end C_Types;
