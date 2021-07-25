pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~kernel.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~kernel.adb");

package body ada_main is
   pragma Warnings (Off);
   procedure adainit is
      E2 : Boolean; pragma Import (Ada, E2, "kernel_E");
      E4 : Boolean; pragma Import (Ada, E4, "x86io_E");

   begin
      null;

      E4 := True;
      E2 := True;
   end adainit;

   procedure Break_Start is
   begin
      null;
   end;

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      adainit;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   ../../binary_types.o
   --   ../../x86io.o
   --   ../../kernel.o
   --   -L../../
   --   -L/usr/lib/gcc/x86_64-linux-gnu/4.6/adalib/
--  END Object file/option list   

end ada_main;
