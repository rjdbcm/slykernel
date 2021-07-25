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
package body X86IO is

--*******************--
-- * I/O Functions * --
--*******************--

   ------------------------------------
   -- inb : Read a byte from a port. --
   ------------------------------------
   function inb(port : Byte) return Byte is
   val : Byte;
   begin
      Asm ("inb %%dx, %%al",
           Inputs => Byte'Asm_Input("d", port),
           Outputs => Byte'Asm_Output("=a", val),
           Volatile => True);
      Return val;
   end inb;

   -----------------------------------
   -- outb : Send a byte to a port. --
   -----------------------------------
   procedure outb(port : Byte; val : Byte) is
   begin
      Asm ("outb %%al, %%dx",
           Inputs => (Byte'Asm_Input("a", val),
                      Byte'Asm_Input("d", port)),
           Volatile => True);
   end outb;


--*************************--
-- * Interrupt Functions * --
--*************************--

   ---------------------------------------------------------
   -- IRQ_Unlock : Tell the PIC to allow more interrupts. --
   ---------------------------------------------------------
   procedure IRQ_Unlock(no : Integer) is
   begin
      if no > 7 then
      	outb(16#20#, 16#a0#);
      end if;
      outb(16#20#, 16#20#);
   end IRQ_Unlock;

   ---------------------------------------------------
   -- IRQ_Enabled : Return True if IRQs are enabled --
   ---------------------------------------------------
   function IRQ_Enabled return Boolean is
   f : Integer;
   begin
      Asm ("pushf;popl %0",
           Outputs => Integer'Asm_Output("=g", f),
           Volatile => True);
      if f > 0 then
         return True;
      else
         return False;
      end if;
   end IRQ_Enabled;

   -----------------------
   -- Enable_Interrupts --
   -----------------------
   procedure Enable_Interrupts is
   begin
      Asm ("sti",
           Volatile => True);
   end Enable_Interrupts;

   ------------------------
   -- Disable_Interrupts --
   ------------------------
   procedure Disable_Interrupts is
   begin
      Asm ("cli",
           Volatile => True);
   end Disable_Interrupts;


--*******************--
-- * CPU Functions * --
--*******************--

   --------------------------------------
   -- cpuid : Send a request to cpuid. --
   --------------------------------------
   -- TODO --
   --function CPUID_Support return Boolean is
   --val : ;
   --begin
   --   Asm ("pushfd"
   --        "pop %%eax"
   --        "mov %%ecx, %%eax"
   --        "xor %%eax, 0x200000"
   --        "push eax"
   --        "popfd"
   --        "pushfd"
   --        "pop %%eax"
   --        "xor %%eax, %%ecx"
   --

   ----------------------------------------
   -- Read_CR0 : Read the value from CR0 --
   ----------------------------------------
   function Read_CR0 return Integer is
   val : Integer;
   begin
      Asm ("mov %%cr0, %0",
      Outputs => (Integer'Asm_Output("=r", val)),
      Volatile => True);
      return val;
   end Read_CR0;


--**********************--
-- * Atomic Functions * --
--**********************--

   ------------------------------------------------------
   -- Atomic_Inc : Increment an integer automatically. --
   ------------------------------------------------------
   procedure Atomic_Inc(val : Value_Ptr) is
   begin
      Asm ("lock;incl %0",
           Inputs => Value_Ptr'Asm_Input("r", val),
           Volatile => True);
   end Atomic_Inc;

   -----------------------------------------------------------
   -- Atomic_IncL : Increment a long integer automatically. --
   -----------------------------------------------------------
   procedure Atomic_IncL(val : LValue_Ptr) is
   begin
      Asm ("lock;incl %0",
           Inputs => LValue_Ptr'Asm_Input("r", val),
           Volatile => True);
   end Atomic_IncL;


end X86IO;
