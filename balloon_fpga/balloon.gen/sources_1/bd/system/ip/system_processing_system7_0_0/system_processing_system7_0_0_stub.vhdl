-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
-- Date        : Sat Feb  8 22:58:59 2025
-- Host        : june-ubuntu running 64-bit Ubuntu 24.04.1 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/june/development/balloon/balloon.gen/sources_1/bd/system/ip/system_processing_system7_0_0/system_processing_system7_0_0_stub.vhdl
-- Design      : system_processing_system7_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity system_processing_system7_0_0 is
  Port ( 
    ENET0_MDIO_MDC : out STD_LOGIC;
    ENET0_MDIO_O : out STD_LOGIC;
    ENET0_MDIO_T : out STD_LOGIC;
    ENET0_MDIO_I : in STD_LOGIC;
    SDIO0_WP : in STD_LOGIC;
    TTC0_WAVE0_OUT : out STD_LOGIC;
    TTC0_WAVE1_OUT : out STD_LOGIC;
    TTC0_WAVE2_OUT : out STD_LOGIC;
    USB0_PORT_INDCTL : out STD_LOGIC_VECTOR ( 1 downto 0 );
    USB0_VBUS_PWRSELECT : out STD_LOGIC;
    USB0_VBUS_PWRFAULT : in STD_LOGIC;
    M_AXI_GP0_ARVALID : out STD_LOGIC;
    M_AXI_GP0_AWVALID : out STD_LOGIC;
    M_AXI_GP0_BREADY : out STD_LOGIC;
    M_AXI_GP0_RREADY : out STD_LOGIC;
    M_AXI_GP0_WLAST : out STD_LOGIC;
    M_AXI_GP0_WVALID : out STD_LOGIC;
    M_AXI_GP0_ARID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_AWID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_WID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ARLEN : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWLEN : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ACLK : in STD_LOGIC;
    M_AXI_GP0_ARREADY : in STD_LOGIC;
    M_AXI_GP0_AWREADY : in STD_LOGIC;
    M_AXI_GP0_BVALID : in STD_LOGIC;
    M_AXI_GP0_RLAST : in STD_LOGIC;
    M_AXI_GP0_RVALID : in STD_LOGIC;
    M_AXI_GP0_WREADY : in STD_LOGIC;
    M_AXI_GP0_BID : in STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_RID : in STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FCLK_CLK0 : out STD_LOGIC;
    FCLK_RESET0_N : out STD_LOGIC;
    MIO : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    DDR_CAS_n : inout STD_LOGIC;
    DDR_CKE : inout STD_LOGIC;
    DDR_Clk_n : inout STD_LOGIC;
    DDR_Clk : inout STD_LOGIC;
    DDR_CS_n : inout STD_LOGIC;
    DDR_DRSTB : inout STD_LOGIC;
    DDR_ODT : inout STD_LOGIC;
    DDR_RAS_n : inout STD_LOGIC;
    DDR_WEB : inout STD_LOGIC;
    DDR_BankAddr : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_Addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_VRN : inout STD_LOGIC;
    DDR_VRP : inout STD_LOGIC;
    DDR_DM : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_DQ : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_DQS_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_DQS : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    PS_SRSTB : inout STD_LOGIC;
    PS_CLK : inout STD_LOGIC;
    PS_PORB : inout STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_processing_system7_0_0 : entity is "system_processing_system7_0_0,processing_system7_v5_5_processing_system7,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of system_processing_system7_0_0 : entity is "system_processing_system7_0_0,processing_system7_v5_5_processing_system7,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=processing_system7,x_ipVersion=5.5,x_ipCoreRevision=6,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_EN_EMIO_PJTAG=0,C_EN_EMIO_ENET0=0,C_EN_EMIO_ENET1=0,C_EN_EMIO_TRACE=0,C_INCLUDE_TRACE_BUFFER=0,C_TRACE_BUFFER_FIFO_SIZE=128,USE_TRACE_DATA_EDGE_DETECTOR=0,C_TRACE_PIPELINE_WIDTH=8,C_TRACE_BUFFER_CLOCK_DELAY=12,C_EMIO_GPIO_WIDTH=64,C_INCLUDE_ACP_TRANS_CHECK=0,C_USE_DEFAULT_ACP_USER_VAL=0,C_S_AXI_ACP_ARUSER_VAL=31,C_S_AXI_ACP_AWUSER_VAL=31,C_M_AXI_GP0_ID_WIDTH=12,C_M_AXI_GP0_ENABLE_STATIC_REMAP=0,C_M_AXI_GP1_ID_WIDTH=12,C_M_AXI_GP1_ENABLE_STATIC_REMAP=0,C_S_AXI_GP0_ID_WIDTH=6,C_S_AXI_GP1_ID_WIDTH=6,C_S_AXI_ACP_ID_WIDTH=3,C_S_AXI_HP0_ID_WIDTH=6,C_S_AXI_HP0_DATA_WIDTH=64,C_S_AXI_HP1_ID_WIDTH=6,C_S_AXI_HP1_DATA_WIDTH=64,C_S_AXI_HP2_ID_WIDTH=6,C_S_AXI_HP2_DATA_WIDTH=64,C_S_AXI_HP3_ID_WIDTH=6,C_S_AXI_HP3_DATA_WIDTH=64,C_M_AXI_GP0_THREAD_ID_WIDTH=12,C_M_AXI_GP1_THREAD_ID_WIDTH=12,C_NUM_F2P_INTR_INPUTS=1,C_IRQ_F2P_MODE=DIRECT,C_DQ_WIDTH=32,C_DQS_WIDTH=4,C_DM_WIDTH=4,C_MIO_PRIMITIVE=54,C_TRACE_INTERNAL_WIDTH=2,C_USE_AXI_NONSECURE=0,C_USE_M_AXI_GP0=1,C_USE_M_AXI_GP1=0,C_USE_S_AXI_GP0=0,C_USE_S_AXI_GP1=0,C_USE_S_AXI_HP0=0,C_USE_S_AXI_HP1=0,C_USE_S_AXI_HP2=0,C_USE_S_AXI_HP3=0,C_USE_S_AXI_ACP=0,C_PS7_SI_REV=PRODUCTION,C_FCLK_CLK0_BUF=TRUE,C_FCLK_CLK1_BUF=FALSE,C_FCLK_CLK2_BUF=FALSE,C_FCLK_CLK3_BUF=FALSE,C_PACKAGE_NAME=clg484,C_GP0_EN_MODIFIABLE_TXN=1,C_GP1_EN_MODIFIABLE_TXN=1}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_processing_system7_0_0 : entity is "yes";
end system_processing_system7_0_0;

architecture stub of system_processing_system7_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "ENET0_MDIO_MDC,ENET0_MDIO_O,ENET0_MDIO_T,ENET0_MDIO_I,SDIO0_WP,TTC0_WAVE0_OUT,TTC0_WAVE1_OUT,TTC0_WAVE2_OUT,USB0_PORT_INDCTL[1:0],USB0_VBUS_PWRSELECT,USB0_VBUS_PWRFAULT,M_AXI_GP0_ARVALID,M_AXI_GP0_AWVALID,M_AXI_GP0_BREADY,M_AXI_GP0_RREADY,M_AXI_GP0_WLAST,M_AXI_GP0_WVALID,M_AXI_GP0_ARID[11:0],M_AXI_GP0_AWID[11:0],M_AXI_GP0_WID[11:0],M_AXI_GP0_ARBURST[1:0],M_AXI_GP0_ARLOCK[1:0],M_AXI_GP0_ARSIZE[2:0],M_AXI_GP0_AWBURST[1:0],M_AXI_GP0_AWLOCK[1:0],M_AXI_GP0_AWSIZE[2:0],M_AXI_GP0_ARPROT[2:0],M_AXI_GP0_AWPROT[2:0],M_AXI_GP0_ARADDR[31:0],M_AXI_GP0_AWADDR[31:0],M_AXI_GP0_WDATA[31:0],M_AXI_GP0_ARCACHE[3:0],M_AXI_GP0_ARLEN[3:0],M_AXI_GP0_ARQOS[3:0],M_AXI_GP0_AWCACHE[3:0],M_AXI_GP0_AWLEN[3:0],M_AXI_GP0_AWQOS[3:0],M_AXI_GP0_WSTRB[3:0],M_AXI_GP0_ACLK,M_AXI_GP0_ARREADY,M_AXI_GP0_AWREADY,M_AXI_GP0_BVALID,M_AXI_GP0_RLAST,M_AXI_GP0_RVALID,M_AXI_GP0_WREADY,M_AXI_GP0_BID[11:0],M_AXI_GP0_RID[11:0],M_AXI_GP0_BRESP[1:0],M_AXI_GP0_RRESP[1:0],M_AXI_GP0_RDATA[31:0],FCLK_CLK0,FCLK_RESET0_N,MIO[53:0],DDR_CAS_n,DDR_CKE,DDR_Clk_n,DDR_Clk,DDR_CS_n,DDR_DRSTB,DDR_ODT,DDR_RAS_n,DDR_WEB,DDR_BankAddr[2:0],DDR_Addr[14:0],DDR_VRN,DDR_VRP,DDR_DM[3:0],DDR_DQ[31:0],DDR_DQS_n[3:0],DDR_DQS[3:0],PS_SRSTB,PS_CLK,PS_PORB";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of ENET0_MDIO_MDC : signal is "xilinx.com:interface:mdio:1.0 MDIO_ETHERNET_0 MDC";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of ENET0_MDIO_MDC : signal is "master";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of ENET0_MDIO_MDC : signal is "XIL_INTERFACENAME MDIO_ETHERNET_0, CAN_DEBUG false";
  attribute X_INTERFACE_INFO of ENET0_MDIO_O : signal is "xilinx.com:interface:mdio:1.0 MDIO_ETHERNET_0 MDIO_O";
  attribute X_INTERFACE_INFO of ENET0_MDIO_T : signal is "xilinx.com:interface:mdio:1.0 MDIO_ETHERNET_0 MDIO_T";
  attribute X_INTERFACE_INFO of ENET0_MDIO_I : signal is "xilinx.com:interface:mdio:1.0 MDIO_ETHERNET_0 MDIO_I";
  attribute X_INTERFACE_INFO of SDIO0_WP : signal is "xilinx.com:interface:sdio:1.0 SDIO_0 WP";
  attribute X_INTERFACE_MODE of SDIO0_WP : signal is "master";
  attribute X_INTERFACE_INFO of USB0_PORT_INDCTL : signal is "xilinx.com:display_processing_system7:usbctrl:1.0 USBIND_0 PORT_INDCTL";
  attribute X_INTERFACE_MODE of USB0_PORT_INDCTL : signal is "master";
  attribute X_INTERFACE_INFO of USB0_VBUS_PWRSELECT : signal is "xilinx.com:display_processing_system7:usbctrl:1.0 USBIND_0 VBUS_PWRSELECT";
  attribute X_INTERFACE_INFO of USB0_VBUS_PWRFAULT : signal is "xilinx.com:display_processing_system7:usbctrl:1.0 USBIND_0 VBUS_PWRFAULT";
  attribute X_INTERFACE_INFO of M_AXI_GP0_ARVALID : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARVALID";
  attribute X_INTERFACE_MODE of M_AXI_GP0_ARVALID : signal is "master";
  attribute X_INTERFACE_PARAMETER of M_AXI_GP0_ARVALID : signal is "XIL_INTERFACENAME M_AXI_GP0, SUPPORTS_NARROW_BURST 0, NUM_WRITE_OUTSTANDING 8, NUM_READ_OUTSTANDING 8, DATA_WIDTH 32, PROTOCOL AXI3, FREQ_HZ 100000000, ID_WIDTH 12, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, MAX_BURST_LENGTH 16, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of M_AXI_GP0_AWVALID : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWVALID";
  attribute X_INTERFACE_INFO of M_AXI_GP0_BREADY : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 BREADY";
  attribute X_INTERFACE_INFO of M_AXI_GP0_RREADY : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 RREADY";
  attribute X_INTERFACE_INFO of M_AXI_GP0_WLAST : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 WLAST";
  attribute X_INTERFACE_INFO of M_AXI_GP0_WVALID : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 WVALID";
  attribute X_INTERFACE_INFO of M_AXI_GP0_ARID : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARID";
  attribute X_INTERFACE_INFO of M_AXI_GP0_AWID : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWID";
  attribute X_INTERFACE_INFO of M_AXI_GP0_WID : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 WID";
  attribute X_INTERFACE_INFO of M_AXI_GP0_ARBURST : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARBURST";
  attribute X_INTERFACE_INFO of M_AXI_GP0_ARLOCK : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARLOCK";
  attribute X_INTERFACE_INFO of M_AXI_GP0_ARSIZE : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARSIZE";
  attribute X_INTERFACE_INFO of M_AXI_GP0_AWBURST : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWBURST";
  attribute X_INTERFACE_INFO of M_AXI_GP0_AWLOCK : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWLOCK";
  attribute X_INTERFACE_INFO of M_AXI_GP0_AWSIZE : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWSIZE";
  attribute X_INTERFACE_INFO of M_AXI_GP0_ARPROT : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARPROT";
  attribute X_INTERFACE_INFO of M_AXI_GP0_AWPROT : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWPROT";
  attribute X_INTERFACE_INFO of M_AXI_GP0_ARADDR : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARADDR";
  attribute X_INTERFACE_INFO of M_AXI_GP0_AWADDR : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWADDR";
  attribute X_INTERFACE_INFO of M_AXI_GP0_WDATA : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 WDATA";
  attribute X_INTERFACE_INFO of M_AXI_GP0_ARCACHE : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARCACHE";
  attribute X_INTERFACE_INFO of M_AXI_GP0_ARLEN : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARLEN";
  attribute X_INTERFACE_INFO of M_AXI_GP0_ARQOS : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARQOS";
  attribute X_INTERFACE_INFO of M_AXI_GP0_AWCACHE : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWCACHE";
  attribute X_INTERFACE_INFO of M_AXI_GP0_AWLEN : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWLEN";
  attribute X_INTERFACE_INFO of M_AXI_GP0_AWQOS : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWQOS";
  attribute X_INTERFACE_INFO of M_AXI_GP0_WSTRB : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 WSTRB";
  attribute X_INTERFACE_INFO of M_AXI_GP0_ACLK : signal is "xilinx.com:signal:clock:1.0 M_AXI_GP0_ACLK CLK";
  attribute X_INTERFACE_MODE of M_AXI_GP0_ACLK : signal is "slave";
  attribute X_INTERFACE_PARAMETER of M_AXI_GP0_ACLK : signal is "XIL_INTERFACENAME M_AXI_GP0_ACLK, ASSOCIATED_BUSIF M_AXI_GP0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of M_AXI_GP0_ARREADY : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 ARREADY";
  attribute X_INTERFACE_INFO of M_AXI_GP0_AWREADY : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 AWREADY";
  attribute X_INTERFACE_INFO of M_AXI_GP0_BVALID : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 BVALID";
  attribute X_INTERFACE_INFO of M_AXI_GP0_RLAST : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 RLAST";
  attribute X_INTERFACE_INFO of M_AXI_GP0_RVALID : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 RVALID";
  attribute X_INTERFACE_INFO of M_AXI_GP0_WREADY : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 WREADY";
  attribute X_INTERFACE_INFO of M_AXI_GP0_BID : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 BID";
  attribute X_INTERFACE_INFO of M_AXI_GP0_RID : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 RID";
  attribute X_INTERFACE_INFO of M_AXI_GP0_BRESP : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 BRESP";
  attribute X_INTERFACE_INFO of M_AXI_GP0_RRESP : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 RRESP";
  attribute X_INTERFACE_INFO of M_AXI_GP0_RDATA : signal is "xilinx.com:interface:aximm:1.0 M_AXI_GP0 RDATA";
  attribute X_INTERFACE_INFO of FCLK_CLK0 : signal is "xilinx.com:signal:clock:1.0 FCLK_CLK0 CLK";
  attribute X_INTERFACE_MODE of FCLK_CLK0 : signal is "master";
  attribute X_INTERFACE_PARAMETER of FCLK_CLK0 : signal is "XIL_INTERFACENAME FCLK_CLK0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of FCLK_RESET0_N : signal is "xilinx.com:signal:reset:1.0 FCLK_RESET0_N RST";
  attribute X_INTERFACE_MODE of FCLK_RESET0_N : signal is "master";
  attribute X_INTERFACE_PARAMETER of FCLK_RESET0_N : signal is "XIL_INTERFACENAME FCLK_RESET0_N, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of MIO : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO MIO";
  attribute X_INTERFACE_MODE of MIO : signal is "master";
  attribute X_INTERFACE_PARAMETER of MIO : signal is "XIL_INTERFACENAME FIXED_IO, CAN_DEBUG false";
  attribute X_INTERFACE_INFO of DDR_CAS_n : signal is "xilinx.com:interface:ddrx:1.0 DDR CAS_N";
  attribute X_INTERFACE_MODE of DDR_CAS_n : signal is "master";
  attribute X_INTERFACE_PARAMETER of DDR_CAS_n : signal is "XIL_INTERFACENAME DDR, CAN_DEBUG false, TIMEPERIOD_PS 1250, MEMORY_TYPE COMPONENTS, DATA_WIDTH 8, CS_ENABLED true, DATA_MASK_ENABLED true, SLOT Single, MEM_ADDR_MAP ROW_COLUMN_BANK, BURST_LENGTH 8, AXI_ARBITRATION_SCHEME TDM, CAS_LATENCY 11, CAS_WRITE_LATENCY 11";
  attribute X_INTERFACE_INFO of DDR_CKE : signal is "xilinx.com:interface:ddrx:1.0 DDR CKE";
  attribute X_INTERFACE_INFO of DDR_Clk_n : signal is "xilinx.com:interface:ddrx:1.0 DDR CK_N";
  attribute X_INTERFACE_INFO of DDR_Clk : signal is "xilinx.com:interface:ddrx:1.0 DDR CK_P";
  attribute X_INTERFACE_INFO of DDR_CS_n : signal is "xilinx.com:interface:ddrx:1.0 DDR CS_N";
  attribute X_INTERFACE_INFO of DDR_DRSTB : signal is "xilinx.com:interface:ddrx:1.0 DDR RESET_N";
  attribute X_INTERFACE_INFO of DDR_ODT : signal is "xilinx.com:interface:ddrx:1.0 DDR ODT";
  attribute X_INTERFACE_INFO of DDR_RAS_n : signal is "xilinx.com:interface:ddrx:1.0 DDR RAS_N";
  attribute X_INTERFACE_INFO of DDR_WEB : signal is "xilinx.com:interface:ddrx:1.0 DDR WE_N";
  attribute X_INTERFACE_INFO of DDR_BankAddr : signal is "xilinx.com:interface:ddrx:1.0 DDR BA";
  attribute X_INTERFACE_INFO of DDR_Addr : signal is "xilinx.com:interface:ddrx:1.0 DDR ADDR";
  attribute X_INTERFACE_INFO of DDR_VRN : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRN";
  attribute X_INTERFACE_INFO of DDR_VRP : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRP";
  attribute X_INTERFACE_INFO of DDR_DM : signal is "xilinx.com:interface:ddrx:1.0 DDR DM";
  attribute X_INTERFACE_INFO of DDR_DQ : signal is "xilinx.com:interface:ddrx:1.0 DDR DQ";
  attribute X_INTERFACE_INFO of DDR_DQS_n : signal is "xilinx.com:interface:ddrx:1.0 DDR DQS_N";
  attribute X_INTERFACE_INFO of DDR_DQS : signal is "xilinx.com:interface:ddrx:1.0 DDR DQS_P";
  attribute X_INTERFACE_INFO of PS_SRSTB : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_SRSTB";
  attribute X_INTERFACE_INFO of PS_CLK : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_CLK";
  attribute X_INTERFACE_INFO of PS_PORB : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_PORB";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "processing_system7_v5_5_processing_system7,Vivado 2024.2";
begin
end;
