BOOL_debugprint <- FALSE
# BOOL_debugprint <- TRUE
BOOL_outprint <- TRUE
BOOL_callprint <- FALSE
# BOOL_callprint <- TRUE
# --- For CALL: gas_data_plot_shift() display settings for Gases and Indicators
gas_data_boolean <- c(TRUE,TRUE,TRUE,TRUE)
gas_indicator_boolean <-  c(TRUE,TRUE,TRUE,TRUE)

# ------- INTEGER Warning Level ----------------------------------------------------------
# INT_warnlevel defines the level from which the warnings are printed
# all warings with a level below INT_warnlevel are ignored
# high warn level means high priority of output of warning
INT_warnlevel <- 3 # plevel >= INT_warnlevel in print warning in warnprint()-call
# ----------------------------------------------------------------------------------

# default_display <- FALSE
default_display <- TRUE
PRINT_plot_gas_peak <- default_display
PRINT_gas_slope_depth_plot <- default_display
PRINT_plot_gas_increase_decrease_plot <- default_display
PRINT_plot_gas_data <- default_display
PRINT_plot_gas_data_normalized <- default_display
PRINT_gas_peak_plot <- default_display
PRINT_plot_gas_all_depth <- default_display
PRINT_plot_gas_peak4depth <- default_display
PRINT_gas_slop_plot_list <- default_display
PRINT_plot_paired_aggregation <- default_display
PRINT_plot_gas_depth_aggregator4shift <- default_display
PRINT_plot_gas_location_aggregator4shift <- default_display
PRINT_plot_moisture_estimator <- default_display
PRINT_table_average_data_density <- default_display
PRINT_plot_moisture_estimator4depth <- default_display
PRINT_plot_moisture_estimator_agg <- default_display

DO_remove_table_aggregated_depth <- default_display
DO_save_remove_table_aggregated_depth <- default_display
## --- Print Selection --- ##
# PRINT_plot_gas_all_depth <- TRUE
# PRINT_gas_slop_plot_list <- FALSE
# PRINT_plot_paired_aggregation <- TRUE
# PRINT_plot_paired_aggregation <- FALSE
# PRINT_table_average_data_density <- TRUE
# PRINT_plot_moisture_estimator4depth <- TRUE
# PRINT_plot_moisture_estimator <- TRUE
