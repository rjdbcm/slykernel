pragma Ada_95;
pragma Restrictions (No_Exception_Handlers);
pragma No_Run_Time;
with System;
package ada_main is
   pragma Warnings (Off);

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   gnat_exit_status : Integer := 0;

   GNAT_Version : constant String :=
                    "GNAT Version: 4.6" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_kernel" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure Break_Start;
   pragma Export (C, Break_Start, "__gnat_break_start");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#48d80482#;
   pragma Export (C, u00001, "kernelB");
   u00002 : constant Version_32 := 16#f02cef5f#;
   pragma Export (C, u00002, "kernelS");
   u00003 : constant Version_32 := 16#d2119951#;
   pragma Export (C, u00003, "x86ioB");
   u00004 : constant Version_32 := 16#f3eababf#;
   pragma Export (C, u00004, "x86ioS");
   u00005 : constant Version_32 := 16#23e1f70b#;
   pragma Export (C, u00005, "systemS");
   u00006 : constant Version_32 := 16#19fe2194#;
   pragma Export (C, u00006, "system__machine_codeS");
   u00007 : constant Version_32 := 16#3b09c012#;
   pragma Export (C, u00007, "binary_typesS");

   --  BEGIN ELABORATION ORDER
   --  system%s
   --  system.machine_code%s
   --  binary_types%s
   --  kernel%s
   --  x86io%s
   --  x86io%b
   --  kernel%b
   --  END ELABORATION ORDER

end ada_main;
