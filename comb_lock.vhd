--comb_lock.vhd;
Library IEEE;
USE IEEE.std_logic_1164.all;
ENTITY comb_lock IS
 PORT(
  ld1 : IN STD_LOGIC;
 ld2 : IN STD_LOGIC;
 ld3 : IN STD_LOGIC;
 value : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
 enter : IN STD_LOGIC;
 reset : IN STD_LOGIC;
 clock : IN STD_LOGIC;
 unlock : Out STD_LOGIC);
end comb_lock;

architecture multi_seg_arch of comb_lock is 
type mc_state_type is 
( idle,c1,c2,c3, end_state);
signal state_reg, state_next: mc_state_type;
signal v1, v2, v3 : std_logic_vector(3 downto 0);
begin

--state register
process(clock, reset)
begin
if (reset = '1')then 
   state_reg <= idle;
   elsif ( clock'event and clock='1') then
   state_reg <= state_next;
   end if;
   end process;
   
   --next-state logic
   process ( state_reg, enter, ld1, ld2, ld3   )
   begin
      case state_reg is 
      when idle =>
          if enter = '1' then
                 if ld1= '1' then
                        state_next <= c1;
                  else 
                         state_next <= idle;
                         end if;
                       end if;
                     when c1 =>
                            if enter = '1' then
                                 if ld2 ='1' then 
                                      state_next <= c2;
                                   end if;
                               end if;    
                     when c2 =>
                             if enter = '1' then
                                 if ld3 ='1' then 
                                    state_next <= c3;
                                 end if;
                               end if; 
                    when c3 =>
                          if enter = '1' then
                               state_next<= end_state;
                                   else 
                                  state_next <= idle; 
                               end if; 
                               
                 when others => 
			state_next<=idle;
                                          
                        end case; 
               end process; 
               
    --moore state logic
          process ( state_reg )
          begin
             
           case state_reg is
               when idle =>
               when c1 =>
               v1 <= value; 
               when c2 =>
               v2 <= value;
               when c3 =>
               v3 <= value;
               when others =>
            
               end case; 
               
               end process;
        --comaparator
        
            
               process(state_reg)
               
               
                variable r1 : std_logic_vector(3 downto 0):= "0111";
	        variable r2 : std_logic_vector(3 downto 0):= "0101";
		variable r3 : std_logic_vector(3 downto 0):= "1001";
                begin
                   unlock <= '0';
			if (state_reg = end_state) then
              		 if (r1=v1 and r2=v2 and r3=v3) then 
                     unlock<= '1';
                       
                    end if;
                 end if; 
                    
       
                        end process; 
                    
     end multi_seg_arch;
                    
                  
                  
                  
                  
