#ifndef __c7_slidemodecontrol_h__
#define __c7_slidemodecontrol_h__

/* Type Definitions */
#ifndef typedef_SFc7_slidemodecontrolInstanceStruct
#define typedef_SFc7_slidemodecontrolInstanceStruct

typedef struct {
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint32_T chartNumber;
  uint32_T instanceNumber;
  int32_T c7_sfEvent;
  boolean_T c7_doneDoubleBufferReInit;
  uint8_T c7_is_active_c7_slidemodecontrol;
  void *c7_fEmlrtCtx;
  real_T *c7_alpha;
  real_T *c7_V;
  real_T *c7_r;
  real_T *c7_theta;
  real_T *c7_cbank;
  real_T *c7_href;
  real_T *c7_hdotref;
  real_T *c7_hdoubledotref;
} SFc7_slidemodecontrolInstanceStruct;

#endif                                 /*typedef_SFc7_slidemodecontrolInstanceStruct*/

/* Named Constants */

/* Variable Declarations */
extern struct SfDebugInstanceStruct *sfGlobalDebugInstanceStruct;

/* Variable Definitions */

/* Function Declarations */
extern const mxArray *sf_c7_slidemodecontrol_get_eml_resolved_functions_info
  (void);

/* Function Definitions */
extern void sf_c7_slidemodecontrol_get_check_sum(mxArray *plhs[]);
extern void c7_slidemodecontrol_method_dispatcher(SimStruct *S, int_T method,
  void *data);

#endif
