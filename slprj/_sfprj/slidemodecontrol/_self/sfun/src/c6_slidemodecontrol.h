#ifndef __c6_slidemodecontrol_h__
#define __c6_slidemodecontrol_h__

/* Type Definitions */
#ifndef typedef_SFc6_slidemodecontrolInstanceStruct
#define typedef_SFc6_slidemodecontrolInstanceStruct

typedef struct {
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint32_T chartNumber;
  uint32_T instanceNumber;
  int32_T c6_sfEvent;
  boolean_T c6_doneDoubleBufferReInit;
  uint8_T c6_is_active_c6_slidemodecontrol;
  void *c6_fEmlrtCtx;
  real_T *c6_V;
  real_T *c6_r;
  real_T *c6_theta;
  real_T *c6_alpha;
  real_T *c6_Vdotref;
  real_T *c6_Vref;
} SFc6_slidemodecontrolInstanceStruct;

#endif                                 /*typedef_SFc6_slidemodecontrolInstanceStruct*/

/* Named Constants */

/* Variable Declarations */
extern struct SfDebugInstanceStruct *sfGlobalDebugInstanceStruct;

/* Variable Definitions */

/* Function Declarations */
extern const mxArray *sf_c6_slidemodecontrol_get_eml_resolved_functions_info
  (void);

/* Function Definitions */
extern void sf_c6_slidemodecontrol_get_check_sum(mxArray *plhs[]);
extern void c6_slidemodecontrol_method_dispatcher(SimStruct *S, int_T method,
  void *data);

#endif
