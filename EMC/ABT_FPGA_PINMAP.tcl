##############################################
#        炬远智能科技（上海）有限公司
#	    CYCLONE IV EP4CE6专用
##############################################


#------------------GLOBAL--------------------#
set_global_assignment -name RESERVE_ALL_UNUSED_PINS "AS INPUT TRI-STATED"
set_global_assignment -name ENABLE_INIT_DONE_OUTPUT OFF

set_location_assignment	PIN_23	-to	clock
set_location_assignment	PIN_6		-to	sync_clk

set_location_assignment	PIN_1	-to	spi_miso
set_location_assignment	PIN_2	-to	spi_ncs
set_location_assignment	PIN_3	-to	spi_mosi
set_location_assignment	PIN_7	-to	spi_clk


set_location_assignment	PIN_58	-to	XPlsIO
set_location_assignment	PIN_11	-to	YPlsIO
set_location_assignment	PIN_54	-to	APlsIO
set_location_assignment	PIN_10	-to	BPlsIO

set_location_assignment	PIN_55	-to	XDirIO
set_location_assignment	PIN_13	-to	YDirIO
set_location_assignment	PIN_53	-to	ADirIO
set_location_assignment	PIN_8		-to	BDirIO

set_location_assignment	PIN_34	-to	EX_Xabc[0]
set_location_assignment	PIN_33	-to	EX_Xabc[1]
set_location_assignment	PIN_32	-to	EX_Xabc[2]

set_location_assignment	PIN_31	-to	EX_Yabc[0]
set_location_assignment	PIN_28	-to	EX_Yabc[1]
set_location_assignment	PIN_30	-to	EX_Yabc[2]

set_location_assignment	PIN_51	-to	EX_Aabc[0]
set_location_assignment	PIN_52	-to	EX_Aabc[1]
set_location_assignment	PIN_50	-to	EX_Aabc[2]

set_location_assignment	PIN_49	-to	EX_Babc[0]
set_location_assignment	PIN_38	-to	EX_Babc[1]
set_location_assignment	PIN_39	-to	EX_Babc[2]

set_location_assignment	PIN_66	-to	EX_AM
set_location_assignment	PIN_67	-to	EX_BM

set_location_assignment	PIN_69	-to	EX_Alarm[0]
set_location_assignment	PIN_70	-to	EX_Alarm[1]
set_location_assignment	PIN_71	-to	EX_Alarm[2]
set_location_assignment	PIN_72	-to	EX_Alarm[3]

set_location_assignment	PIN_43	-to	EX_Reset[0]
set_location_assignment	PIN_46	-to	EX_Reset[1]
set_location_assignment	PIN_64	-to	EX_Reset[2]
set_location_assignment	PIN_60	-to	EX_Reset[3]

set_location_assignment	PIN_42	-to	EX_Enable[0]
set_location_assignment	PIN_44	-to	EX_Enable[1]
set_location_assignment	PIN_65	-to	EX_Enable[2]
set_location_assignment	PIN_59	-to	EX_Enable[3]

set_location_assignment	PIN_121	-to	EX_Home[0]
set_location_assignment	PIN_119	-to	EX_Home[1]
set_location_assignment	PIN_120	-to	EX_Home[2]
set_location_assignment	PIN_114	-to	EX_Home[3]

set_location_assignment	PIN_112	-to	EX_LimitPN[0]
set_location_assignment	PIN_115	-to	EX_LimitPN[1]
set_location_assignment	PIN_110	-to	EX_LimitPN[2]
set_location_assignment	PIN_113	-to	EX_LimitPN[3]
set_location_assignment	PIN_105	-to	EX_LimitPN[4]
set_location_assignment	PIN_111	-to	EX_LimitPN[5]
set_location_assignment	PIN_103	-to	EX_LimitPN[6]
set_location_assignment	PIN_106	-to	EX_LimitPN[7]

set_location_assignment	PIN_104	-to	EX_IO_Input[0]
set_location_assignment	PIN_101	-to	EX_IO_Input[1]
set_location_assignment	PIN_100	-to	EX_IO_Input[2]
set_location_assignment	PIN_98	-to	EX_IO_Input[3]
set_location_assignment	PIN_99	-to	EX_IO_Input[4]
set_location_assignment	PIN_86	-to	EX_IO_Input[5]
set_location_assignment	PIN_87	-to	EX_IO_Input[6]
set_location_assignment	PIN_84	-to	EX_IO_Input[7]
set_location_assignment	PIN_85	-to	EX_IO_Input[8]
set_location_assignment	PIN_80	-to	EX_IO_Input[9]
set_location_assignment	PIN_83	-to	EX_IO_Input[10]
set_location_assignment	PIN_73	-to	EX_IO_Input[11]
set_location_assignment	PIN_77	-to	EX_IO_Input[12]
set_location_assignment	PIN_75	-to	EX_IO_Input[13]
set_location_assignment	PIN_74	-to	EX_IO_Input[14]
set_location_assignment	PIN_76	-to	EX_IO_Input[15]

set_location_assignment	PIN_126	-to	EX_IO_Output[0]
set_location_assignment	PIN_124	-to	EX_IO_Output[1]
set_location_assignment	PIN_125	-to	EX_IO_Output[2]
set_location_assignment	PIN_128	-to	EX_IO_Output[3]
set_location_assignment	PIN_127	-to	EX_IO_Output[4]
set_location_assignment	PIN_132	-to	EX_IO_Output[5]
set_location_assignment	PIN_129	-to	EX_IO_Output[6]
set_location_assignment	PIN_133	-to	EX_IO_Output[7]
set_location_assignment	PIN_135	-to	EX_IO_Output[8]
set_location_assignment	PIN_137	-to	EX_IO_Output[9]
set_location_assignment	PIN_136	-to	EX_IO_Output[10]
set_location_assignment	PIN_141	-to	EX_IO_Output[11]
set_location_assignment	PIN_138	-to	EX_IO_Output[12]
set_location_assignment	PIN_143	-to	EX_IO_Output[13]
set_location_assignment	PIN_142	-to	EX_IO_Output[14]
set_location_assignment	PIN_144	-to	EX_IO_Output[15]
#------------------END-----------------------#





