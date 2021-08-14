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

package X86IO is
--******************--
-- Type Definitions --
--******************--

   type Ternary is (Apathetic, False, True);

   type SpinLock is mod 256;

   type Value_Ptr is access Integer;
   type LValue_Ptr is access Dword;

--*******************--
-- * I/O Functions * --
--*******************--

   --****L* X86IO/inb
   -- NAME
   -- inb
   -- FUNCTION
   -- Read a byte from a port.
   -- INPUTS
   -- port := Port to read from.
   -- OUTPUTS
   -- val := The byte read from port.
   -- SEE ALSO
   -- X86IO/outb
   --***
   function inb (port : Integer) return Byte;

   --****L* X86IO/outb
   -- NAME
   -- outb
   -- FUNCTION
   -- Send a byte to a port.
   -- INPUTS
   -- port := Port to send val to.
   -- val  := Value to be sent.
   -- SEE ALSO
   -- X86IO/inb
   --***
   procedure outb (port : Integer; val : Byte);

--*************************--
-- * Interrupt Functions * --
--*************************--

   --****L* X86IO/IRQ_Unlock
   -- NAME
   -- IRQ_Unlock
   -- FUNCTION
   -- Unlock a locked IRQ.
   -- INPUTS
   -- no := Integer Number of IRQ
   -- SEE ALSO
   -- X86IO/IRQ_Enabled
   --***
   procedure IRQ_Unlock(no : Integer);

   --****L* X86IO/IRQ_Enabled
   -- NAME
   -- IRQ_Enabled
   -- FUNCTION
   -- Check if IRQs are enabled return True or False.
   -- SEE ALSO
   -- X86IO/IRQ_Unlock
   --***
   function IRQ_Enabled return Boolean;

   --****L* X86IO/Enable_Interrupts
   -- NAME
   -- Enable_Interrupts
   -- FUNCTION
   -- Tell the PIC to begin accepting interrupts.
   -- SEE ALSO
   -- X86IO/Diable_Interrupts
   --***
   procedure Enable_Interrupts;

   --****L* X86IO/Disable_Interrupts
   -- NAME
   -- Disable_Interrupts
   -- FUNCTION
   -- Tell the PIC to stop accepting interrupts.
   -- SEE ALSO
   -- X86IO/Disable_Interrupts
   --***
   procedure Disable_Interrupts;

--*******************--
-- * CPU Functions * --
--*******************--

   --------------------------------------
   -- cpuid : Send a request to cpuid. --
   --------------------------------------
   -- TODO --


   --****L* X86IO/Read_CR0
   -- NAME
   -- Read_CR0
   -- FUNCTION
   -- Read the value stored in Control Register 0.
   -- OUTPUTS
   -- val := Integer value returned.
   -- SEE ALSO
   -- X86IO/cpuid
   --***
   function Read_CR0 return Integer;

--**********************--
-- * Atomic Functions * --
--**********************--

   --****L* X86IO/Atomic_Inc
   -- NAME
   -- Atomic_Inc
   -- FUNCTION
   -- Increment an integer automatically.
   -- INPUTS
   -- val := Pointer to an integer.
   -- SEE ALSO
   -- X86IO/Atomic_IncL
   --***
   procedure Atomic_Inc(val : Value_Ptr);

   --****L* X86IO/Atomic_IncL
   -- NAME
   -- Atomic_IncL
   -- FUNCTION
   -- Increment a long integer automatically.
   -- INPUTS
   -- val := Pointer to a long integer.
   -- SEE ALSO
   -- X86IO/Atomic_Inc
   --***
   procedure Atomic_IncL(val : LValue_Ptr);

end X86IO;
