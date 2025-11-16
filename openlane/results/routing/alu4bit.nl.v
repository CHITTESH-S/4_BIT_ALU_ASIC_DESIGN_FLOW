module alu4bit (clk,
    rst,
    A,
    B,
    result,
    sel);
 input clk;
 input rst;
 input [3:0] A;
 input [3:0] B;
 output [3:0] result;
 input [2:0] sel;

 wire _000_;
 wire _001_;
 wire _002_;
 wire _003_;
 wire _004_;
 wire _005_;
 wire _006_;
 wire _007_;
 wire _008_;
 wire _009_;
 wire _010_;
 wire _011_;
 wire _012_;
 wire _013_;
 wire _014_;
 wire _015_;
 wire _016_;
 wire _017_;
 wire _018_;
 wire _019_;
 wire _020_;
 wire _021_;
 wire _022_;
 wire _023_;
 wire _024_;
 wire _025_;
 wire _026_;
 wire _027_;
 wire _028_;
 wire _029_;
 wire _030_;
 wire _031_;
 wire _032_;
 wire _033_;
 wire _034_;
 wire _035_;
 wire _036_;
 wire _037_;
 wire _038_;
 wire _039_;
 wire _040_;
 wire _041_;
 wire _042_;
 wire _043_;
 wire _044_;
 wire _045_;
 wire _046_;
 wire _047_;
 wire _048_;
 wire _049_;
 wire _050_;
 wire _051_;
 wire _052_;
 wire _053_;
 wire _054_;
 wire _055_;
 wire _056_;
 wire _057_;
 wire _058_;
 wire _059_;
 wire _060_;
 wire _061_;
 wire net1;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;
 wire net10;
 wire net11;
 wire net12;
 wire net13;
 wire net14;
 wire net15;
 wire net16;
 wire clknet_0_clk;
 wire clknet_1_0__leaf_clk;
 wire clknet_1_1__leaf_clk;

 sky130_fd_sc_hd__buf_2 _062_ (.A(net12),
    .X(_004_));
 sky130_fd_sc_hd__buf_2 _063_ (.A(net11),
    .X(_005_));
 sky130_fd_sc_hd__nor3b_2 _064_ (.A(_004_),
    .B(_005_),
    .C_N(net10),
    .Y(_006_));
 sky130_fd_sc_hd__or2b_1 _065_ (.A(_004_),
    .B_N(_005_),
    .X(_007_));
 sky130_fd_sc_hd__or3b_1 _066_ (.A(net10),
    .B(net11),
    .C_N(net12),
    .X(_008_));
 sky130_fd_sc_hd__a22oi_1 _067_ (.A1(net1),
    .A2(net5),
    .B1(_007_),
    .B2(_008_),
    .Y(_009_));
 sky130_fd_sc_hd__o22a_1 _068_ (.A1(net1),
    .A2(net5),
    .B1(_006_),
    .B2(_009_),
    .X(_010_));
 sky130_fd_sc_hd__and3b_1 _069_ (.A_N(net10),
    .B(_005_),
    .C(_004_),
    .X(_011_));
 sky130_fd_sc_hd__and3_1 _070_ (.A(_004_),
    .B(net10),
    .C(_005_),
    .X(_012_));
 sky130_fd_sc_hd__a22o_1 _071_ (.A1(net2),
    .A2(_011_),
    .B1(_012_),
    .B2(net1),
    .X(_013_));
 sky130_fd_sc_hd__or3_1 _072_ (.A(_004_),
    .B(net10),
    .C(_005_),
    .X(_014_));
 sky130_fd_sc_hd__clkbuf_2 _073_ (.A(_014_),
    .X(_015_));
 sky130_fd_sc_hd__or3b_1 _074_ (.A(_010_),
    .B(_013_),
    .C_N(_015_),
    .X(_016_));
 sky130_fd_sc_hd__a21o_1 _075_ (.A1(net1),
    .A2(net5),
    .B1(_015_),
    .X(_017_));
 sky130_fd_sc_hd__and3b_1 _076_ (.A_N(net9),
    .B(_016_),
    .C(_017_),
    .X(_018_));
 sky130_fd_sc_hd__clkbuf_1 _077_ (.A(_018_),
    .X(_000_));
 sky130_fd_sc_hd__nand4b_1 _078_ (.A_N(_005_),
    .B(net10),
    .C(_004_),
    .D(net1),
    .Y(_019_));
 sky130_fd_sc_hd__and2b_1 _079_ (.A_N(_004_),
    .B(_005_),
    .X(_020_));
 sky130_fd_sc_hd__nand3b_2 _080_ (.A_N(net12),
    .B(net10),
    .C(net11),
    .Y(_021_));
 sky130_fd_sc_hd__a21bo_1 _081_ (.A1(net5),
    .A2(_021_),
    .B1_N(net6),
    .X(_022_));
 sky130_fd_sc_hd__nand3b_1 _082_ (.A_N(net6),
    .B(_021_),
    .C(net5),
    .Y(_023_));
 sky130_fd_sc_hd__and3_1 _083_ (.A(net2),
    .B(_022_),
    .C(_023_),
    .X(_024_));
 sky130_fd_sc_hd__a21o_1 _084_ (.A1(_022_),
    .A2(_023_),
    .B1(net2),
    .X(_025_));
 sky130_fd_sc_hd__or2b_1 _085_ (.A(_024_),
    .B_N(_025_),
    .X(_026_));
 sky130_fd_sc_hd__or2b_1 _086_ (.A(net1),
    .B_N(net5),
    .X(_027_));
 sky130_fd_sc_hd__xnor2_1 _087_ (.A(_026_),
    .B(_027_),
    .Y(_028_));
 sky130_fd_sc_hd__a21oi_1 _088_ (.A1(net2),
    .A2(net6),
    .B1(_008_),
    .Y(_029_));
 sky130_fd_sc_hd__o22a_1 _089_ (.A1(net2),
    .A2(net6),
    .B1(_006_),
    .B2(_029_),
    .X(_030_));
 sky130_fd_sc_hd__a221o_1 _090_ (.A1(net3),
    .A2(_011_),
    .B1(_012_),
    .B2(net2),
    .C1(_030_),
    .X(_031_));
 sky130_fd_sc_hd__a21oi_1 _091_ (.A1(_020_),
    .A2(_028_),
    .B1(_031_),
    .Y(_032_));
 sky130_fd_sc_hd__a21oi_1 _092_ (.A1(net2),
    .A2(net6),
    .B1(_015_),
    .Y(_033_));
 sky130_fd_sc_hd__a311oi_1 _093_ (.A1(_015_),
    .A2(_019_),
    .A3(_032_),
    .B1(_033_),
    .C1(net9),
    .Y(_001_));
 sky130_fd_sc_hd__nand4b_1 _094_ (.A_N(_005_),
    .B(net2),
    .C(_004_),
    .D(net10),
    .Y(_034_));
 sky130_fd_sc_hd__a21oi_2 _095_ (.A1(_025_),
    .A2(_027_),
    .B1(_024_),
    .Y(_035_));
 sky130_fd_sc_hd__or2_1 _096_ (.A(net5),
    .B(net6),
    .X(_036_));
 sky130_fd_sc_hd__a21oi_2 _097_ (.A1(_021_),
    .A2(_036_),
    .B1(net7),
    .Y(_037_));
 sky130_fd_sc_hd__and3_1 _098_ (.A(net7),
    .B(_021_),
    .C(_036_),
    .X(_038_));
 sky130_fd_sc_hd__o21a_1 _099_ (.A1(_037_),
    .A2(_038_),
    .B1(net3),
    .X(_039_));
 sky130_fd_sc_hd__nor3_1 _100_ (.A(net3),
    .B(_037_),
    .C(_038_),
    .Y(_040_));
 sky130_fd_sc_hd__nor2_1 _101_ (.A(_039_),
    .B(_040_),
    .Y(_041_));
 sky130_fd_sc_hd__xnor2_1 _102_ (.A(_035_),
    .B(_041_),
    .Y(_042_));
 sky130_fd_sc_hd__a21oi_1 _103_ (.A1(net3),
    .A2(net7),
    .B1(_008_),
    .Y(_043_));
 sky130_fd_sc_hd__o22a_1 _104_ (.A1(net3),
    .A2(net7),
    .B1(_006_),
    .B2(_043_),
    .X(_044_));
 sky130_fd_sc_hd__a221o_1 _105_ (.A1(net4),
    .A2(_011_),
    .B1(_012_),
    .B2(net3),
    .C1(_044_),
    .X(_045_));
 sky130_fd_sc_hd__a21oi_1 _106_ (.A1(_020_),
    .A2(_042_),
    .B1(_045_),
    .Y(_046_));
 sky130_fd_sc_hd__a21oi_1 _107_ (.A1(net3),
    .A2(net7),
    .B1(_015_),
    .Y(_047_));
 sky130_fd_sc_hd__a311oi_1 _108_ (.A1(_015_),
    .A2(_034_),
    .A3(_046_),
    .B1(_047_),
    .C1(net9),
    .Y(_002_));
 sky130_fd_sc_hd__o21ai_1 _109_ (.A1(_037_),
    .A2(_038_),
    .B1(net3),
    .Y(_048_));
 sky130_fd_sc_hd__o21ai_1 _110_ (.A1(_035_),
    .A2(_040_),
    .B1(_048_),
    .Y(_049_));
 sky130_fd_sc_hd__xnor2_1 _111_ (.A(net4),
    .B(net8),
    .Y(_050_));
 sky130_fd_sc_hd__o21a_1 _112_ (.A1(net7),
    .A2(_036_),
    .B1(_021_),
    .X(_051_));
 sky130_fd_sc_hd__or2_1 _113_ (.A(_050_),
    .B(_051_),
    .X(_052_));
 sky130_fd_sc_hd__nand2_1 _114_ (.A(_050_),
    .B(_051_),
    .Y(_053_));
 sky130_fd_sc_hd__nand2_1 _115_ (.A(_052_),
    .B(_053_),
    .Y(_054_));
 sky130_fd_sc_hd__o211a_1 _116_ (.A1(_035_),
    .A2(_040_),
    .B1(_054_),
    .C1(_048_),
    .X(_055_));
 sky130_fd_sc_hd__a311o_1 _117_ (.A1(_049_),
    .A2(_052_),
    .A3(_053_),
    .B1(_055_),
    .C1(_007_),
    .X(_056_));
 sky130_fd_sc_hd__a211o_1 _118_ (.A1(_004_),
    .A2(_050_),
    .B1(_005_),
    .C1(net10),
    .X(_057_));
 sky130_fd_sc_hd__and4b_1 _119_ (.A_N(_005_),
    .B(net3),
    .C(_004_),
    .D(net10),
    .X(_058_));
 sky130_fd_sc_hd__o21a_1 _120_ (.A1(net4),
    .A2(net8),
    .B1(_006_),
    .X(_059_));
 sky130_fd_sc_hd__a211oi_1 _121_ (.A1(net4),
    .A2(_012_),
    .B1(_058_),
    .C1(_059_),
    .Y(_060_));
 sky130_fd_sc_hd__a21oi_1 _122_ (.A1(net4),
    .A2(net8),
    .B1(_015_),
    .Y(_061_));
 sky130_fd_sc_hd__a311oi_1 _123_ (.A1(_056_),
    .A2(_057_),
    .A3(_060_),
    .B1(_061_),
    .C1(net9),
    .Y(_003_));
 sky130_fd_sc_hd__dfxtp_1 _124_ (.CLK(clknet_1_0__leaf_clk),
    .D(_000_),
    .Q(net13));
 sky130_fd_sc_hd__dfxtp_1 _125_ (.CLK(clknet_1_0__leaf_clk),
    .D(_001_),
    .Q(net14));
 sky130_fd_sc_hd__dfxtp_1 _126_ (.CLK(clknet_1_1__leaf_clk),
    .D(_002_),
    .Q(net15));
 sky130_fd_sc_hd__dfxtp_1 _127_ (.CLK(clknet_1_1__leaf_clk),
    .D(_003_),
    .Q(net16));
 sky130_fd_sc_hd__decap_3 PHY_0 ();
 sky130_fd_sc_hd__decap_3 PHY_1 ();
 sky130_fd_sc_hd__decap_3 PHY_2 ();
 sky130_fd_sc_hd__decap_3 PHY_3 ();
 sky130_fd_sc_hd__decap_3 PHY_4 ();
 sky130_fd_sc_hd__decap_3 PHY_5 ();
 sky130_fd_sc_hd__decap_3 PHY_6 ();
 sky130_fd_sc_hd__decap_3 PHY_7 ();
 sky130_fd_sc_hd__decap_3 PHY_8 ();
 sky130_fd_sc_hd__decap_3 PHY_9 ();
 sky130_fd_sc_hd__decap_3 PHY_10 ();
 sky130_fd_sc_hd__decap_3 PHY_11 ();
 sky130_fd_sc_hd__decap_3 PHY_12 ();
 sky130_fd_sc_hd__decap_3 PHY_13 ();
 sky130_fd_sc_hd__decap_3 PHY_14 ();
 sky130_fd_sc_hd__decap_3 PHY_15 ();
 sky130_fd_sc_hd__decap_3 PHY_16 ();
 sky130_fd_sc_hd__decap_3 PHY_17 ();
 sky130_fd_sc_hd__decap_3 PHY_18 ();
 sky130_fd_sc_hd__decap_3 PHY_19 ();
 sky130_fd_sc_hd__decap_3 PHY_20 ();
 sky130_fd_sc_hd__decap_3 PHY_21 ();
 sky130_fd_sc_hd__decap_3 PHY_22 ();
 sky130_fd_sc_hd__decap_3 PHY_23 ();
 sky130_fd_sc_hd__decap_3 PHY_24 ();
 sky130_fd_sc_hd__decap_3 PHY_25 ();
 sky130_fd_sc_hd__decap_3 PHY_26 ();
 sky130_fd_sc_hd__decap_3 PHY_27 ();
 sky130_fd_sc_hd__decap_3 PHY_28 ();
 sky130_fd_sc_hd__decap_3 PHY_29 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_30 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_31 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_32 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_33 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_34 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_35 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_36 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_37 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_38 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_39 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_40 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_41 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_42 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_43 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_44 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_45 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_46 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_47 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_48 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_49 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_50 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_51 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_52 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_53 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_54 ();
 sky130_fd_sc_hd__clkbuf_2 input1 (.A(A[0]),
    .X(net1));
 sky130_fd_sc_hd__buf_2 input2 (.A(A[1]),
    .X(net2));
 sky130_fd_sc_hd__buf_2 input3 (.A(A[2]),
    .X(net3));
 sky130_fd_sc_hd__clkbuf_2 input4 (.A(A[3]),
    .X(net4));
 sky130_fd_sc_hd__clkbuf_2 input5 (.A(B[0]),
    .X(net5));
 sky130_fd_sc_hd__clkbuf_2 input6 (.A(B[1]),
    .X(net6));
 sky130_fd_sc_hd__clkbuf_2 input7 (.A(B[2]),
    .X(net7));
 sky130_fd_sc_hd__buf_1 input8 (.A(B[3]),
    .X(net8));
 sky130_fd_sc_hd__buf_1 input9 (.A(rst),
    .X(net9));
 sky130_fd_sc_hd__buf_2 input10 (.A(sel[0]),
    .X(net10));
 sky130_fd_sc_hd__buf_1 input11 (.A(sel[1]),
    .X(net11));
 sky130_fd_sc_hd__buf_1 input12 (.A(sel[2]),
    .X(net12));
 sky130_fd_sc_hd__buf_2 output13 (.A(net13),
    .X(result[0]));
 sky130_fd_sc_hd__clkbuf_4 output14 (.A(net14),
    .X(result[1]));
 sky130_fd_sc_hd__clkbuf_4 output15 (.A(net15),
    .X(result[2]));
 sky130_fd_sc_hd__clkbuf_4 output16 (.A(net16),
    .X(result[3]));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_0_clk (.A(clk),
    .X(clknet_0_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_1_0__f_clk (.A(clknet_0_clk),
    .X(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_1_1__f_clk (.A(clknet_0_clk),
    .X(clknet_1_1__leaf_clk));
 sky130_fd_sc_hd__decap_8 FILLER_0_0_19 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_27 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_0_36 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_44 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_0_48 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_0_57 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_0_69 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_0_76 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_85 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_1_7 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_15 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_1_40 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_55 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_2_9 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_2_13 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_2_19 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_2_25 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_2_46 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_2_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_2_67 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_2_79 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_2_83 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_2_85 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_27 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_3_39 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_3_47 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_64 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_3_76 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_3_84 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_4_27 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_4_40 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_4_48 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_56 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_68 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_4_80 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_4_85 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_5_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_7 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_5_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_29 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_69 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_5_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_9 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_6_21 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_27 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_40 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_6_74 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_80 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_85 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_7_3 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_7_21 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_27 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_7_36 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_7_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_69 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_7_82 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_8_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_8_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_19 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_8_24 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8_29 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_8_39 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_47 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_8_52 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8_60 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_83 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_9_3 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_9_36 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_9_44 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_9_53 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_9_64 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_70 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_9_76 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_9_84 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_10_19 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_10_27 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_10_33 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_10_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_10_51 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_10_63 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_10_75 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_10_79 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_10_85 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_11_7 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_11_19 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_11_31 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_11_43 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_11_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_11_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_11_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_12_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_12_15 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_12_23 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_12_27 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_12_29 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_12_37 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_12_55 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_12_67 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_12_73 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_12_81 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_12_85 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_13_3 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_13_15 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_13_30 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_13_36 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_13_42 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_13_48 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_13_52 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_13_62 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_13_70 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_13_84 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_14_10 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_14_22 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_14_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_14_35 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_14_47 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_14_55 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_14_57 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_14_63 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_14_71 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_14_85 ();
endmodule
