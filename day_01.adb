with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;

procedure Day_01 is
   F: File_Type;
   L: Unbounded_String;
   File_Name : constant String := "inputs/day-01.txt";

   function Number_From_Line(L: Unbounded_String) return Integer is
      Result : Integer := 0;
   begin
      for I in 1 .. Length (L) loop
         case Element (L, I) is
            when '1' .. '9' =>
               Result := 10 * Integer'Value ((1 => Element (L, I)));
               exit;
            when others => null;
         end case;
      end loop;

      for I in reverse 1 .. Length (L) loop
         case Element(L, I) is
            when '1' .. '9' =>
               Result := Result + Integer'Value ((1 => Element (L, I)));
               exit;
            when others => null;
         end case;
      end loop;

      return Result;
   end Number_From_Line;

   procedure Partone is
      Score : Integer := 0;
   begin
      Open (F, In_File, File_Name);
      while not End_Of_File (F) loop
         L := Get_Line (F);
         Score := Score + Number_From_Line (L);
      end loop;
      Close (F);

      Put_Line ("Part 1: " & Integer'Image (Score));
   end PartOne;

   procedure PartTwo is
      Score : Integer := 0;
      Digit : Integer := 0;

      function Digit_At_Line(L: Unbounded_String; I: Positive) return Integer is
      begin
         case Element (L, I) is
               when '1' .. '9' =>
                  return Integer'Value ((1 => Element (L, I)));
               when 'a' .. 'z' =>
                  if Index (L, "one", I) = I then
                     return 1;
                  end if;

                  if Index (L, "two", I) = I then
                     return 2;
                  end if;

                  if Index (L, "three", I) = I then
                     return 3;
                  end if;

                  if Index (L, "four", I) = I then
                     return 4;
                  end if;

                  if Index (L, "five", I) = I then
                     return 5;
                  end if;

                  if Index (L, "six", I) = I then
                     return 6;
                  end if;

                  if Index (L, "seven", I) = I then
                     return 7;
                  end if;

                  if Index (L, "eight", I) = I then
                     return 8;
                  end if;

                  if Index (L, "nine", I) = I then
                     return 9;
                  end if;
               when others => null;
         end case;

         return 0;
      end Digit_At_Line;
   begin
      Open (F, In_File, File_Name);
      while not End_Of_File (F) loop
         L := Get_Line (F);

         for I in 1 .. Length (L) loop
            Digit := Digit_At_Line (L, I);
            if Digit /= 0 then
               Score := Score + (10 * Digit);
               exit;
            end if;
         end loop;

         for I in reverse 1 .. Length (L) loop
            Digit := Digit_At_Line (L, I);
            if Digit /= 0 then
               Score := Score + Digit;
               exit;
            end if;
         end loop;
      end loop;
      Close (F);

      Put_Line ("Part 2: " & Integer'Image (Score));
   end PartTwo;
begin
   PartOne;
   PartTwo;
end Day_01;
