LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity controlUnit is 

      Port (
	     opCode : in std_logic_vector(5 downto 0);
         aluOp : out std_logic_vector(1 downto 0);
	     regDst : out std_logic;
         jump : out std_logic;
	     branch : out std_logic;
      	 memRead : out std_logic;
         memToReg : out std_logic;
	     memWrite : out std_logic;
	     aluSrc : out std_logic;
	     regWrite: out std_logic
	     );

END controlUnit;

ARCHITECTURE struct OF controlUnit IS


BEGIN

controlUnit_behaviour : process is
    BEGIN
	regWrite <= '0';
	
	if opCode = "000000" then -- r-type instruction
	regDst <= '1';
	jump <= '0';
	branch <= '0';
	memRead <= '0';
	memToReg <= '0';
	aluOp <= "10";
	memWrite <= '0';
	aluSrc <= '0';
	regWrite <= '1' after 10 ns;
	
	elsif opCode = "100011" then -- lw instruction
	regDst <= '0';
	jump <= '0';
	branch <= '0';
	memRead <= '1';
	memToReg <= '1';
	aluOp <= "00";
	memWrite <= '0';
	aluSrc <= '1';
	regWrite <= '1' after 10 ns;
	
	elsif opCode = "101011" then -- sw instruction
	regDst <= 'X';
	jump <= '0';
	branch <= '0';
	memRead <= '0';
	memToReg <= 'X';
	aluOp <= "00";
	memWrite <= '1';
	aluSrc <= '1';
	regWrite <= '0';
	
	elsif opCode = "000100" then -- beq instruction
	regDst <= 'X';
	jump <= '0';
	branch <= '1' after 2 ns;
	memRead <= '0';
	memToReg <= 'X';
	aluOp <= "01";
	memWrite <= '0';
	aluSrc <= '0';
	regWrite <= '0';
	
	elsif opCode = "000010" then -- jump instruction
	regDst <= 'X';
	jump <= '1';
	branch <= '0';
	memRead <= '0';
	memToReg <= 'X';
	aluOp <= "00";
	memWrite <= '0';
	aluSrc <= '0';
	regWrite <= '0';
	
	else  
	regDst <= '0';
	jump <= '0';
	branch <= '0';
	memRead <= '0';
	memToReg <= '0';
	aluOp <= "00";
	memWrite <= '0';
	aluSrc <= '0';
	regWrite <= '0';
	
	end if;
	
	end process controlUnit_behaviour;
	
	
END struct;
	