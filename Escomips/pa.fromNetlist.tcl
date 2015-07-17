
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Escomips -dir "C:/Users/Public/Documents/Project_Nexys/UnidadDeControl/Escomips/planAhead_run_3" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/Public/Documents/Project_Nexys/UnidadDeControl/Escomips/PrincipalEscomips.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/Public/Documents/Project_Nexys/UnidadDeControl/Escomips} }
set_param project.pinAheadLayout  yes
set_param project.paUcfFile  "PrincipalEscomips.ucf"
add_files "PrincipalEscomips.ucf" -fileset [get_property constrset [current_run]]
open_netlist_design
