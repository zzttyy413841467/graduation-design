/* Include files */

#include "slidemodecontrol_sfun.h"
#include "c6_slidemodecontrol.h"
#include "mwmathutil.h"
#define CHARTINSTANCE_CHARTNUMBER      (chartInstance->chartNumber)
#define CHARTINSTANCE_INSTANCENUMBER   (chartInstance->instanceNumber)
#include "slidemodecontrol_sfun_debug_macros.h"
#define _SF_MEX_LISTEN_FOR_CTRL_C(S)   sf_mex_listen_for_ctrl_c_with_debugger(S, sfGlobalDebugInstanceStruct);

static void chart_debug_initialization(SimStruct *S, unsigned int
  fullDebuggerInitialization);
static void chart_debug_initialize_data_addresses(SimStruct *S);
static const mxArray* sf_opaque_get_hover_data_for_msg(void *chartInstance,
  int32_T msgSSID);

/* Type Definitions */

/* Named Constants */
#define CALL_EVENT                     (-1)

/* Variable Declarations */

/* Variable Definitions */
static real_T _sfTime_;
static const char * c6_debug_family_names[32] = { "beta", "eta", "phi1", "m",
  "S", "rho0", "g0", "Re", "mu", "hs", "rho", "q", "g", "b_1", "f_1", "k_1", "s",
  "sat", "u", "sdot", "kkk", "cd2", "cd1", "cd0", "nargin", "nargout", "V", "r",
  "theta", "Vdotref", "Vref", "alpha" };

/* Function Declarations */
static void initialize_c6_slidemodecontrol(SFc6_slidemodecontrolInstanceStruct
  *chartInstance);
static void initialize_params_c6_slidemodecontrol
  (SFc6_slidemodecontrolInstanceStruct *chartInstance);
static void enable_c6_slidemodecontrol(SFc6_slidemodecontrolInstanceStruct
  *chartInstance);
static void disable_c6_slidemodecontrol(SFc6_slidemodecontrolInstanceStruct
  *chartInstance);
static void c6_update_debugger_state_c6_slidemodecontrol
  (SFc6_slidemodecontrolInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c6_slidemodecontrol
  (SFc6_slidemodecontrolInstanceStruct *chartInstance);
static void set_sim_state_c6_slidemodecontrol
  (SFc6_slidemodecontrolInstanceStruct *chartInstance, const mxArray *c6_st);
static void finalize_c6_slidemodecontrol(SFc6_slidemodecontrolInstanceStruct
  *chartInstance);
static void sf_gateway_c6_slidemodecontrol(SFc6_slidemodecontrolInstanceStruct
  *chartInstance);
static void mdl_start_c6_slidemodecontrol(SFc6_slidemodecontrolInstanceStruct
  *chartInstance);
static void initSimStructsc6_slidemodecontrol
  (SFc6_slidemodecontrolInstanceStruct *chartInstance);
static void init_script_number_translation(uint32_T c6_machineNumber, uint32_T
  c6_chartNumber, uint32_T c6_instanceNumber);
static const mxArray *c6_sf_marshallOut(void *chartInstanceVoid, void *c6_inData);
static real_T c6_emlrt_marshallIn(SFc6_slidemodecontrolInstanceStruct
  *chartInstance, const mxArray *c6_b_alpha, const char_T *c6_identifier);
static real_T c6_b_emlrt_marshallIn(SFc6_slidemodecontrolInstanceStruct
  *chartInstance, const mxArray *c6_u, const emlrtMsgIdentifier *c6_parentId);
static void c6_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c6_mxArrayInData, const char_T *c6_varName, void *c6_outData);
static void c6_error(SFc6_slidemodecontrolInstanceStruct *chartInstance);
static const mxArray *c6_b_sf_marshallOut(void *chartInstanceVoid, void
  *c6_inData);
static int32_T c6_c_emlrt_marshallIn(SFc6_slidemodecontrolInstanceStruct
  *chartInstance, const mxArray *c6_u, const emlrtMsgIdentifier *c6_parentId);
static void c6_b_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c6_mxArrayInData, const char_T *c6_varName, void *c6_outData);
static uint8_T c6_d_emlrt_marshallIn(SFc6_slidemodecontrolInstanceStruct
  *chartInstance, const mxArray *c6_b_is_active_c6_slidemodecontrol, const
  char_T *c6_identifier);
static uint8_T c6_e_emlrt_marshallIn(SFc6_slidemodecontrolInstanceStruct
  *chartInstance, const mxArray *c6_u, const emlrtMsgIdentifier *c6_parentId);
static void init_dsm_address_info(SFc6_slidemodecontrolInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc6_slidemodecontrolInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c6_slidemodecontrol(SFc6_slidemodecontrolInstanceStruct
  *chartInstance)
{
  if (sf_is_first_init_cond(chartInstance->S)) {
    initSimStructsc6_slidemodecontrol(chartInstance);
    chart_debug_initialize_data_addresses(chartInstance->S);
  }

  chartInstance->c6_sfEvent = CALL_EVENT;
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c6_is_active_c6_slidemodecontrol = 0U;
}

static void initialize_params_c6_slidemodecontrol
  (SFc6_slidemodecontrolInstanceStruct *chartInstance)
{
  (void)chartInstance;
}

static void enable_c6_slidemodecontrol(SFc6_slidemodecontrolInstanceStruct
  *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c6_slidemodecontrol(SFc6_slidemodecontrolInstanceStruct
  *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c6_update_debugger_state_c6_slidemodecontrol
  (SFc6_slidemodecontrolInstanceStruct *chartInstance)
{
  (void)chartInstance;
}

static const mxArray *get_sim_state_c6_slidemodecontrol
  (SFc6_slidemodecontrolInstanceStruct *chartInstance)
{
  const mxArray *c6_st;
  const mxArray *c6_y = NULL;
  real_T c6_hoistedGlobal;
  const mxArray *c6_b_y = NULL;
  uint8_T c6_b_hoistedGlobal;
  const mxArray *c6_c_y = NULL;
  c6_st = NULL;
  c6_st = NULL;
  c6_y = NULL;
  sf_mex_assign(&c6_y, sf_mex_createcellmatrix(2, 1), false);
  c6_hoistedGlobal = *chartInstance->c6_alpha;
  c6_b_y = NULL;
  sf_mex_assign(&c6_b_y, sf_mex_create("y", &c6_hoistedGlobal, 0, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c6_y, 0, c6_b_y);
  c6_b_hoistedGlobal = chartInstance->c6_is_active_c6_slidemodecontrol;
  c6_c_y = NULL;
  sf_mex_assign(&c6_c_y, sf_mex_create("y", &c6_b_hoistedGlobal, 3, 0U, 0U, 0U,
    0), false);
  sf_mex_setcell(c6_y, 1, c6_c_y);
  sf_mex_assign(&c6_st, c6_y, false);
  return c6_st;
}

static void set_sim_state_c6_slidemodecontrol
  (SFc6_slidemodecontrolInstanceStruct *chartInstance, const mxArray *c6_st)
{
  const mxArray *c6_u;
  chartInstance->c6_doneDoubleBufferReInit = true;
  c6_u = sf_mex_dup(c6_st);
  *chartInstance->c6_alpha = c6_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getcell(c6_u, 0)), "alpha");
  chartInstance->c6_is_active_c6_slidemodecontrol = c6_d_emlrt_marshallIn
    (chartInstance, sf_mex_dup(sf_mex_getcell(c6_u, 1)),
     "is_active_c6_slidemodecontrol");
  sf_mex_destroy(&c6_u);
  c6_update_debugger_state_c6_slidemodecontrol(chartInstance);
  sf_mex_destroy(&c6_st);
}

static void finalize_c6_slidemodecontrol(SFc6_slidemodecontrolInstanceStruct
  *chartInstance)
{
  (void)chartInstance;
}

static void sf_gateway_c6_slidemodecontrol(SFc6_slidemodecontrolInstanceStruct
  *chartInstance)
{
  real_T c6_b_V;
  real_T c6_b_r;
  real_T c6_b_theta;
  real_T c6_b_Vdotref;
  real_T c6_b_Vref;
  uint32_T c6_debug_family_var_map[32];
  real_T c6_beta;
  real_T c6_eta;
  real_T c6_phi1;
  real_T c6_m;
  real_T c6_S;
  real_T c6_rho0;
  real_T c6_g0;
  real_T c6_Re;
  real_T c6_mu;
  real_T c6_hs;
  real_T c6_rho;
  real_T c6_q;
  real_T c6_g;
  real_T c6_b_1;
  real_T c6_f_1;
  real_T c6_k_1;
  real_T c6_s;
  real_T c6_sat;
  real_T c6_u;
  real_T c6_sdot;
  real_T c6_kkk;
  real_T c6_cd2;
  real_T c6_cd1;
  real_T c6_cd0;
  real_T c6_nargin = 5.0;
  real_T c6_nargout = 1.0;
  real_T c6_b_alpha;
  real_T c6_x;
  real_T c6_a;
  real_T c6_b_a;
  real_T c6_A;
  real_T c6_b_x;
  real_T c6_c_x;
  real_T c6_b_A;
  real_T c6_B;
  real_T c6_c_A;
  real_T c6_b_B;
  real_T c6_d_A;
  real_T c6_e_A;
  real_T c6_c_B;
  real_T c6_d_B;
  real_T c6_d_x;
  real_T c6_e_x;
  real_T c6_e_B;
  real_T c6_f_x;
  real_T c6_g_x;
  real_T c6_h_x;
  real_T c6_i_x;
  real_T c6_f_A;
  real_T c6_j_x;
  boolean_T c6_p;
  real_T c6_k_x;
  real_T c6_l_x;
  _SFD_SYMBOL_SCOPE_PUSH(0U, 0U);
  _sfTime_ = sf_get_time(chartInstance->S);
  _SFD_CC_CALL(CHART_ENTER_SFUNCTION_TAG, 4U, chartInstance->c6_sfEvent);
  _SFD_DATA_RANGE_CHECK(*chartInstance->c6_Vref, 4U);
  _SFD_DATA_RANGE_CHECK(*chartInstance->c6_Vdotref, 3U);
  _SFD_DATA_RANGE_CHECK(*chartInstance->c6_theta, 2U);
  _SFD_DATA_RANGE_CHECK(*chartInstance->c6_r, 1U);
  _SFD_DATA_RANGE_CHECK(*chartInstance->c6_V, 0U);
  chartInstance->c6_sfEvent = CALL_EVENT;
  _SFD_CC_CALL(CHART_ENTER_DURING_FUNCTION_TAG, 4U, chartInstance->c6_sfEvent);
  c6_b_V = *chartInstance->c6_V;
  c6_b_r = *chartInstance->c6_r;
  c6_b_theta = *chartInstance->c6_theta;
  c6_b_Vdotref = *chartInstance->c6_Vdotref;
  c6_b_Vref = *chartInstance->c6_Vref;
  _SFD_SYMBOL_SCOPE_PUSH_EML(0U, 32U, 32U, c6_debug_family_names,
    c6_debug_family_var_map);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c6_beta, 0U, c6_sf_marshallOut,
    c6_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c6_eta, 1U, c6_sf_marshallOut,
    c6_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c6_phi1, 2U, c6_sf_marshallOut,
    c6_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML(&c6_m, 3U, c6_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c6_S, 4U, c6_sf_marshallOut,
    c6_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c6_rho0, 5U, c6_sf_marshallOut,
    c6_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML(&c6_g0, 6U, c6_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML(&c6_Re, 7U, c6_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML(&c6_mu, 8U, c6_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML(&c6_hs, 9U, c6_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c6_rho, 10U, c6_sf_marshallOut,
    c6_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c6_q, 11U, c6_sf_marshallOut,
    c6_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c6_g, 12U, c6_sf_marshallOut,
    c6_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c6_b_1, 13U, c6_sf_marshallOut,
    c6_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c6_f_1, 14U, c6_sf_marshallOut,
    c6_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c6_k_1, 15U, c6_sf_marshallOut,
    c6_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c6_s, 16U, c6_sf_marshallOut,
    c6_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c6_sat, 17U, c6_sf_marshallOut,
    c6_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c6_u, 18U, c6_sf_marshallOut,
    c6_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c6_sdot, 19U, c6_sf_marshallOut,
    c6_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c6_kkk, 20U, c6_sf_marshallOut,
    c6_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c6_cd2, 21U, c6_sf_marshallOut,
    c6_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML(&c6_cd1, 22U, c6_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c6_cd0, 23U, c6_sf_marshallOut,
    c6_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c6_nargin, 24U, c6_sf_marshallOut,
    c6_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c6_nargout, 25U, c6_sf_marshallOut,
    c6_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML(&c6_b_V, 26U, c6_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML(&c6_b_r, 27U, c6_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML(&c6_b_theta, 28U, c6_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML(&c6_b_Vdotref, 29U, c6_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML(&c6_b_Vref, 30U, c6_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c6_b_alpha, 31U, c6_sf_marshallOut,
    c6_sf_marshallIn);
  CV_EML_FCN(0, 0);
  _SFD_EML_CALL(0U, chartInstance->c6_sfEvent, 2);
  c6_beta = 1.3;
  _SFD_EML_CALL(0U, chartInstance->c6_sfEvent, 3);
  c6_eta = 2.0;
  _SFD_EML_CALL(0U, chartInstance->c6_sfEvent, 4);
  c6_phi1 = 0.01 * c6_b_V;
  _SFD_EML_CALL(0U, chartInstance->c6_sfEvent, 6);
  c6_m = 498.95;
  _SFD_EML_CALL(0U, chartInstance->c6_sfEvent, 7);
  c6_S = 0.113;
  _SFD_EML_CALL(0U, chartInstance->c6_sfEvent, 8);
  c6_rho0 = 1.225;
  _SFD_EML_CALL(0U, chartInstance->c6_sfEvent, 9);
  c6_g0 = 9.81;
  _SFD_EML_CALL(0U, chartInstance->c6_sfEvent, 10);
  c6_Re = 6.371393E+6;
  _SFD_EML_CALL(0U, chartInstance->c6_sfEvent, 11);
  c6_mu = 3.9823350434000469E+14;
  _SFD_EML_CALL(0U, chartInstance->c6_sfEvent, 12);
  c6_hs = 7320.0;
  _SFD_EML_CALL(0U, chartInstance->c6_sfEvent, 13);
  c6_x = -(c6_b_r - c6_Re);
  c6_rho = c6_rho0 * muDoubleScalarExp(c6_x / 7320.0);
  _SFD_EML_CALL(0U, chartInstance->c6_sfEvent, 14);
  c6_a = c6_b_V;
  c6_q = 0.5 * c6_rho * (c6_a * c6_a);
  _SFD_EML_CALL(0U, chartInstance->c6_sfEvent, 15);
  c6_b_a = c6_b_r;
  c6_g = 3.9823350434000469E+14 / (c6_b_a * c6_b_a);
  _SFD_EML_CALL(0U, chartInstance->c6_sfEvent, 17);
  c6_A = -c6_q * c6_S;
  c6_b_1 = c6_A / 498.95;
  _SFD_EML_CALL(0U, chartInstance->c6_sfEvent, 18);
  c6_b_x = c6_b_theta;
  c6_f_1 = -c6_g * muDoubleScalarSin(c6_b_x);
  _SFD_EML_CALL(0U, chartInstance->c6_sfEvent, 20);
  c6_c_x = c6_f_1 - c6_b_Vdotref;
  c6_k_1 = c6_beta * c6_eta + (c6_beta - 1.0) * muDoubleScalarAbs(c6_c_x);
  _SFD_EML_CALL(0U, chartInstance->c6_sfEvent, 21);
  c6_s = c6_b_V - c6_b_Vref;
  _SFD_EML_CALL(0U, chartInstance->c6_sfEvent, 22);
  c6_b_A = c6_s;
  c6_B = c6_phi1;
  c6_c_A = c6_s;
  c6_b_B = c6_phi1;
  if (CV_EML_IF(0, 1, 0, CV_RELATIONAL_EVAL(4U, 0U, 0, muDoubleScalarAbs(c6_b_A /
         c6_B), 1.0, -1, 3U, muDoubleScalarAbs(c6_c_A / c6_b_B) <= 1.0))) {
    _SFD_EML_CALL(0U, chartInstance->c6_sfEvent, 23);
    c6_e_A = c6_s;
    c6_d_B = c6_phi1;
    c6_sat = c6_e_A / c6_d_B;
  } else {
    _SFD_EML_CALL(0U, chartInstance->c6_sfEvent, 25);
    c6_d_A = c6_s;
    c6_c_B = c6_phi1;
    c6_sat = c6_d_A / c6_c_B;
    c6_d_x = c6_sat;
    c6_sat = c6_d_x;
    c6_e_x = c6_sat;
    c6_sat = c6_e_x;
    c6_g_x = c6_sat;
    c6_sat = c6_g_x;
    c6_sat = muDoubleScalarSign(c6_sat);
  }

  _SFD_EML_CALL(0U, chartInstance->c6_sfEvent, 27);
  c6_e_B = c6_b_1;
  c6_f_x = 1.0 / c6_e_B * ((c6_b_Vdotref - c6_f_1) - c6_k_1 * c6_sat);
  c6_u = muDoubleScalarAbs(c6_f_x);
  _SFD_EML_CALL(0U, chartInstance->c6_sfEvent, 29);
  c6_sdot = (c6_f_1 + c6_b_1 * c6_u) - c6_b_Vdotref;
  _SFD_EML_CALL(0U, chartInstance->c6_sfEvent, 30);
  c6_h_x = c6_s;
  c6_kkk = c6_sdot * c6_s + c6_eta * muDoubleScalarAbs(c6_h_x);
  _SFD_EML_CALL(0U, chartInstance->c6_sfEvent, 31);
  c6_cd2 = -0.00015055882352941176;
  _SFD_EML_CALL(0U, chartInstance->c6_sfEvent, 32);
  c6_cd1 = 6.3827157599999991;
  _SFD_EML_CALL(0U, chartInstance->c6_sfEvent, 33);
  c6_cd0 = -0.03795;
  _SFD_EML_CALL(0U, chartInstance->c6_sfEvent, 34);
  c6_i_x = c6_cd2 * c6_b_V;
  c6_f_A = (c6_u - muDoubleScalarExp(c6_i_x)) - c6_cd0;
  c6_b_alpha = c6_f_A / 6.3827157599999991;
  c6_j_x = c6_b_alpha;
  c6_p = (c6_j_x < 0.0);
  if (c6_p) {
    c6_error(chartInstance);
  }

  c6_k_x = c6_b_alpha;
  c6_b_alpha = c6_k_x;
  c6_l_x = c6_b_alpha;
  c6_b_alpha = c6_l_x;
  c6_b_alpha = muDoubleScalarSqrt(c6_b_alpha);
  _SFD_EML_CALL(0U, chartInstance->c6_sfEvent, -34);
  _SFD_SYMBOL_SCOPE_POP();
  *chartInstance->c6_alpha = c6_b_alpha;
  _SFD_CC_CALL(EXIT_OUT_OF_FUNCTION_TAG, 4U, chartInstance->c6_sfEvent);
  _SFD_SYMBOL_SCOPE_POP();
  _SFD_CHECK_FOR_STATE_INCONSISTENCY(_slidemodecontrolMachineNumber_,
    chartInstance->chartNumber, chartInstance->instanceNumber);
  _SFD_DATA_RANGE_CHECK(*chartInstance->c6_alpha, 5U);
}

static void mdl_start_c6_slidemodecontrol(SFc6_slidemodecontrolInstanceStruct
  *chartInstance)
{
  sim_mode_is_external(chartInstance->S);
}

static void initSimStructsc6_slidemodecontrol
  (SFc6_slidemodecontrolInstanceStruct *chartInstance)
{
  (void)chartInstance;
}

static void init_script_number_translation(uint32_T c6_machineNumber, uint32_T
  c6_chartNumber, uint32_T c6_instanceNumber)
{
  (void)(c6_machineNumber);
  (void)(c6_chartNumber);
  (void)(c6_instanceNumber);
}

static const mxArray *c6_sf_marshallOut(void *chartInstanceVoid, void *c6_inData)
{
  const mxArray *c6_mxArrayOutData;
  real_T c6_u;
  const mxArray *c6_y = NULL;
  SFc6_slidemodecontrolInstanceStruct *chartInstance;
  chartInstance = (SFc6_slidemodecontrolInstanceStruct *)chartInstanceVoid;
  c6_mxArrayOutData = NULL;
  c6_mxArrayOutData = NULL;
  c6_u = *(real_T *)c6_inData;
  c6_y = NULL;
  sf_mex_assign(&c6_y, sf_mex_create("y", &c6_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_assign(&c6_mxArrayOutData, c6_y, false);
  return c6_mxArrayOutData;
}

static real_T c6_emlrt_marshallIn(SFc6_slidemodecontrolInstanceStruct
  *chartInstance, const mxArray *c6_b_alpha, const char_T *c6_identifier)
{
  real_T c6_y;
  emlrtMsgIdentifier c6_thisId;
  c6_thisId.fIdentifier = (const char *)c6_identifier;
  c6_thisId.fParent = NULL;
  c6_thisId.bParentIsCell = false;
  c6_y = c6_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c6_b_alpha), &c6_thisId);
  sf_mex_destroy(&c6_b_alpha);
  return c6_y;
}

static real_T c6_b_emlrt_marshallIn(SFc6_slidemodecontrolInstanceStruct
  *chartInstance, const mxArray *c6_u, const emlrtMsgIdentifier *c6_parentId)
{
  real_T c6_y;
  real_T c6_d0;
  (void)chartInstance;
  sf_mex_import(c6_parentId, sf_mex_dup(c6_u), &c6_d0, 1, 0, 0U, 0, 0U, 0);
  c6_y = c6_d0;
  sf_mex_destroy(&c6_u);
  return c6_y;
}

static void c6_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c6_mxArrayInData, const char_T *c6_varName, void *c6_outData)
{
  const mxArray *c6_b_alpha;
  emlrtMsgIdentifier c6_thisId;
  real_T c6_y;
  SFc6_slidemodecontrolInstanceStruct *chartInstance;
  chartInstance = (SFc6_slidemodecontrolInstanceStruct *)chartInstanceVoid;
  c6_b_alpha = sf_mex_dup(c6_mxArrayInData);
  c6_thisId.fIdentifier = (const char *)c6_varName;
  c6_thisId.fParent = NULL;
  c6_thisId.bParentIsCell = false;
  c6_y = c6_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c6_b_alpha), &c6_thisId);
  sf_mex_destroy(&c6_b_alpha);
  *(real_T *)c6_outData = c6_y;
  sf_mex_destroy(&c6_mxArrayInData);
}

const mxArray *sf_c6_slidemodecontrol_get_eml_resolved_functions_info(void)
{
  const mxArray *c6_nameCaptureInfo = NULL;
  c6_nameCaptureInfo = NULL;
  sf_mex_assign(&c6_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c6_nameCaptureInfo;
}

static void c6_error(SFc6_slidemodecontrolInstanceStruct *chartInstance)
{
  const mxArray *c6_y = NULL;
  static char_T c6_cv0[30] = { 'C', 'o', 'd', 'e', 'r', ':', 't', 'o', 'o', 'l',
    'b', 'o', 'x', ':', 'E', 'l', 'F', 'u', 'n', 'D', 'o', 'm', 'a', 'i', 'n',
    'E', 'r', 'r', 'o', 'r' };

  const mxArray *c6_b_y = NULL;
  static char_T c6_cv1[4] = { 's', 'q', 'r', 't' };

  (void)chartInstance;
  c6_y = NULL;
  sf_mex_assign(&c6_y, sf_mex_create("y", c6_cv0, 10, 0U, 1U, 0U, 2, 1, 30),
                false);
  c6_b_y = NULL;
  sf_mex_assign(&c6_b_y, sf_mex_create("y", c6_cv1, 10, 0U, 1U, 0U, 2, 1, 4),
                false);
  sf_mex_call_debug(sfGlobalDebugInstanceStruct, "error", 0U, 1U, 14,
                    sf_mex_call_debug(sfGlobalDebugInstanceStruct, "message", 1U,
    2U, 14, c6_y, 14, c6_b_y));
}

static const mxArray *c6_b_sf_marshallOut(void *chartInstanceVoid, void
  *c6_inData)
{
  const mxArray *c6_mxArrayOutData;
  int32_T c6_u;
  const mxArray *c6_y = NULL;
  SFc6_slidemodecontrolInstanceStruct *chartInstance;
  chartInstance = (SFc6_slidemodecontrolInstanceStruct *)chartInstanceVoid;
  c6_mxArrayOutData = NULL;
  c6_mxArrayOutData = NULL;
  c6_u = *(int32_T *)c6_inData;
  c6_y = NULL;
  sf_mex_assign(&c6_y, sf_mex_create("y", &c6_u, 6, 0U, 0U, 0U, 0), false);
  sf_mex_assign(&c6_mxArrayOutData, c6_y, false);
  return c6_mxArrayOutData;
}

static int32_T c6_c_emlrt_marshallIn(SFc6_slidemodecontrolInstanceStruct
  *chartInstance, const mxArray *c6_u, const emlrtMsgIdentifier *c6_parentId)
{
  int32_T c6_y;
  int32_T c6_i0;
  (void)chartInstance;
  sf_mex_import(c6_parentId, sf_mex_dup(c6_u), &c6_i0, 1, 6, 0U, 0, 0U, 0);
  c6_y = c6_i0;
  sf_mex_destroy(&c6_u);
  return c6_y;
}

static void c6_b_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c6_mxArrayInData, const char_T *c6_varName, void *c6_outData)
{
  const mxArray *c6_b_sfEvent;
  emlrtMsgIdentifier c6_thisId;
  int32_T c6_y;
  SFc6_slidemodecontrolInstanceStruct *chartInstance;
  chartInstance = (SFc6_slidemodecontrolInstanceStruct *)chartInstanceVoid;
  c6_b_sfEvent = sf_mex_dup(c6_mxArrayInData);
  c6_thisId.fIdentifier = (const char *)c6_varName;
  c6_thisId.fParent = NULL;
  c6_thisId.bParentIsCell = false;
  c6_y = c6_c_emlrt_marshallIn(chartInstance, sf_mex_dup(c6_b_sfEvent),
    &c6_thisId);
  sf_mex_destroy(&c6_b_sfEvent);
  *(int32_T *)c6_outData = c6_y;
  sf_mex_destroy(&c6_mxArrayInData);
}

static uint8_T c6_d_emlrt_marshallIn(SFc6_slidemodecontrolInstanceStruct
  *chartInstance, const mxArray *c6_b_is_active_c6_slidemodecontrol, const
  char_T *c6_identifier)
{
  uint8_T c6_y;
  emlrtMsgIdentifier c6_thisId;
  c6_thisId.fIdentifier = (const char *)c6_identifier;
  c6_thisId.fParent = NULL;
  c6_thisId.bParentIsCell = false;
  c6_y = c6_e_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c6_b_is_active_c6_slidemodecontrol), &c6_thisId);
  sf_mex_destroy(&c6_b_is_active_c6_slidemodecontrol);
  return c6_y;
}

static uint8_T c6_e_emlrt_marshallIn(SFc6_slidemodecontrolInstanceStruct
  *chartInstance, const mxArray *c6_u, const emlrtMsgIdentifier *c6_parentId)
{
  uint8_T c6_y;
  uint8_T c6_u0;
  (void)chartInstance;
  sf_mex_import(c6_parentId, sf_mex_dup(c6_u), &c6_u0, 1, 3, 0U, 0, 0U, 0);
  c6_y = c6_u0;
  sf_mex_destroy(&c6_u);
  return c6_y;
}

static void init_dsm_address_info(SFc6_slidemodecontrolInstanceStruct
  *chartInstance)
{
  (void)chartInstance;
}

static void init_simulink_io_address(SFc6_slidemodecontrolInstanceStruct
  *chartInstance)
{
  chartInstance->c6_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c6_V = (real_T *)ssGetInputPortSignal_wrapper(chartInstance->S,
    0);
  chartInstance->c6_r = (real_T *)ssGetInputPortSignal_wrapper(chartInstance->S,
    1);
  chartInstance->c6_theta = (real_T *)ssGetInputPortSignal_wrapper
    (chartInstance->S, 2);
  chartInstance->c6_alpha = (real_T *)ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
  chartInstance->c6_Vdotref = (real_T *)ssGetInputPortSignal_wrapper
    (chartInstance->S, 3);
  chartInstance->c6_Vref = (real_T *)ssGetInputPortSignal_wrapper
    (chartInstance->S, 4);
}

/* SFunction Glue Code */
#ifdef utFree
#undef utFree
#endif

#ifdef utMalloc
#undef utMalloc
#endif

#ifdef __cplusplus

extern "C" void *utMalloc(size_t size);
extern "C" void utFree(void*);

#else

extern void *utMalloc(size_t size);
extern void utFree(void*);

#endif

void sf_c6_slidemodecontrol_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(2626503196U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(3128821062U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(3775899163U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(2210330352U);
}

mxArray* sf_c6_slidemodecontrol_get_post_codegen_info(void);
mxArray *sf_c6_slidemodecontrol_get_autoinheritance_info(void)
{
  const char *autoinheritanceFields[] = { "checksum", "inputs", "parameters",
    "outputs", "locals", "postCodegenInfo" };

  mxArray *mxAutoinheritanceInfo = mxCreateStructMatrix(1, 1, sizeof
    (autoinheritanceFields)/sizeof(autoinheritanceFields[0]),
    autoinheritanceFields);

  {
    mxArray *mxChecksum = mxCreateString("qWMOT0qfpJ9MkeLZcxd2FH");
    mxSetField(mxAutoinheritanceInfo,0,"checksum",mxChecksum);
  }

  {
    const char *dataFields[] = { "size", "type", "complexity" };

    mxArray *mxData = mxCreateStructMatrix(1,5,3,dataFields);

    {
      mxArray *mxSize = mxCreateDoubleMatrix(1,0,mxREAL);
      double *pr = mxGetPr(mxSize);
      mxSetField(mxData,0,"size",mxSize);
    }

    {
      const char *typeFields[] = { "base", "fixpt", "isFixedPointType" };

      mxArray *mxType = mxCreateStructMatrix(1,1,sizeof(typeFields)/sizeof
        (typeFields[0]),typeFields);
      mxSetField(mxType,0,"base",mxCreateDoubleScalar(10));
      mxSetField(mxType,0,"fixpt",mxCreateDoubleMatrix(0,0,mxREAL));
      mxSetField(mxType,0,"isFixedPointType",mxCreateDoubleScalar(0));
      mxSetField(mxData,0,"type",mxType);
    }

    mxSetField(mxData,0,"complexity",mxCreateDoubleScalar(0));

    {
      mxArray *mxSize = mxCreateDoubleMatrix(1,0,mxREAL);
      double *pr = mxGetPr(mxSize);
      mxSetField(mxData,1,"size",mxSize);
    }

    {
      const char *typeFields[] = { "base", "fixpt", "isFixedPointType" };

      mxArray *mxType = mxCreateStructMatrix(1,1,sizeof(typeFields)/sizeof
        (typeFields[0]),typeFields);
      mxSetField(mxType,0,"base",mxCreateDoubleScalar(10));
      mxSetField(mxType,0,"fixpt",mxCreateDoubleMatrix(0,0,mxREAL));
      mxSetField(mxType,0,"isFixedPointType",mxCreateDoubleScalar(0));
      mxSetField(mxData,1,"type",mxType);
    }

    mxSetField(mxData,1,"complexity",mxCreateDoubleScalar(0));

    {
      mxArray *mxSize = mxCreateDoubleMatrix(1,0,mxREAL);
      double *pr = mxGetPr(mxSize);
      mxSetField(mxData,2,"size",mxSize);
    }

    {
      const char *typeFields[] = { "base", "fixpt", "isFixedPointType" };

      mxArray *mxType = mxCreateStructMatrix(1,1,sizeof(typeFields)/sizeof
        (typeFields[0]),typeFields);
      mxSetField(mxType,0,"base",mxCreateDoubleScalar(10));
      mxSetField(mxType,0,"fixpt",mxCreateDoubleMatrix(0,0,mxREAL));
      mxSetField(mxType,0,"isFixedPointType",mxCreateDoubleScalar(0));
      mxSetField(mxData,2,"type",mxType);
    }

    mxSetField(mxData,2,"complexity",mxCreateDoubleScalar(0));

    {
      mxArray *mxSize = mxCreateDoubleMatrix(1,0,mxREAL);
      double *pr = mxGetPr(mxSize);
      mxSetField(mxData,3,"size",mxSize);
    }

    {
      const char *typeFields[] = { "base", "fixpt", "isFixedPointType" };

      mxArray *mxType = mxCreateStructMatrix(1,1,sizeof(typeFields)/sizeof
        (typeFields[0]),typeFields);
      mxSetField(mxType,0,"base",mxCreateDoubleScalar(10));
      mxSetField(mxType,0,"fixpt",mxCreateDoubleMatrix(0,0,mxREAL));
      mxSetField(mxType,0,"isFixedPointType",mxCreateDoubleScalar(0));
      mxSetField(mxData,3,"type",mxType);
    }

    mxSetField(mxData,3,"complexity",mxCreateDoubleScalar(0));

    {
      mxArray *mxSize = mxCreateDoubleMatrix(1,0,mxREAL);
      double *pr = mxGetPr(mxSize);
      mxSetField(mxData,4,"size",mxSize);
    }

    {
      const char *typeFields[] = { "base", "fixpt", "isFixedPointType" };

      mxArray *mxType = mxCreateStructMatrix(1,1,sizeof(typeFields)/sizeof
        (typeFields[0]),typeFields);
      mxSetField(mxType,0,"base",mxCreateDoubleScalar(10));
      mxSetField(mxType,0,"fixpt",mxCreateDoubleMatrix(0,0,mxREAL));
      mxSetField(mxType,0,"isFixedPointType",mxCreateDoubleScalar(0));
      mxSetField(mxData,4,"type",mxType);
    }

    mxSetField(mxData,4,"complexity",mxCreateDoubleScalar(0));
    mxSetField(mxAutoinheritanceInfo,0,"inputs",mxData);
  }

  {
    mxSetField(mxAutoinheritanceInfo,0,"parameters",mxCreateDoubleMatrix(0,0,
                mxREAL));
  }

  {
    const char *dataFields[] = { "size", "type", "complexity" };

    mxArray *mxData = mxCreateStructMatrix(1,1,3,dataFields);

    {
      mxArray *mxSize = mxCreateDoubleMatrix(1,0,mxREAL);
      double *pr = mxGetPr(mxSize);
      mxSetField(mxData,0,"size",mxSize);
    }

    {
      const char *typeFields[] = { "base", "fixpt", "isFixedPointType" };

      mxArray *mxType = mxCreateStructMatrix(1,1,sizeof(typeFields)/sizeof
        (typeFields[0]),typeFields);
      mxSetField(mxType,0,"base",mxCreateDoubleScalar(10));
      mxSetField(mxType,0,"fixpt",mxCreateDoubleMatrix(0,0,mxREAL));
      mxSetField(mxType,0,"isFixedPointType",mxCreateDoubleScalar(0));
      mxSetField(mxData,0,"type",mxType);
    }

    mxSetField(mxData,0,"complexity",mxCreateDoubleScalar(0));
    mxSetField(mxAutoinheritanceInfo,0,"outputs",mxData);
  }

  {
    mxSetField(mxAutoinheritanceInfo,0,"locals",mxCreateDoubleMatrix(0,0,mxREAL));
  }

  {
    mxArray* mxPostCodegenInfo = sf_c6_slidemodecontrol_get_post_codegen_info();
    mxSetField(mxAutoinheritanceInfo,0,"postCodegenInfo",mxPostCodegenInfo);
  }

  return(mxAutoinheritanceInfo);
}

mxArray *sf_c6_slidemodecontrol_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c6_slidemodecontrol_jit_fallback_info(void)
{
  const char *infoFields[] = { "fallbackType", "fallbackReason",
    "hiddenFallbackType", "hiddenFallbackReason", "incompatibleSymbol" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 5, infoFields);
  mxArray *fallbackType = mxCreateString("pre");
  mxArray *fallbackReason = mxCreateString("hasBreakpoints");
  mxArray *hiddenFallbackType = mxCreateString("none");
  mxArray *hiddenFallbackReason = mxCreateString("");
  mxArray *incompatibleSymbol = mxCreateString("");
  mxSetField(mxInfo, 0, infoFields[0], fallbackType);
  mxSetField(mxInfo, 0, infoFields[1], fallbackReason);
  mxSetField(mxInfo, 0, infoFields[2], hiddenFallbackType);
  mxSetField(mxInfo, 0, infoFields[3], hiddenFallbackReason);
  mxSetField(mxInfo, 0, infoFields[4], incompatibleSymbol);
  return mxInfo;
}

mxArray *sf_c6_slidemodecontrol_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

mxArray* sf_c6_slidemodecontrol_get_post_codegen_info(void)
{
  const char* fieldNames[] = { "exportedFunctionsUsedByThisChart",
    "exportedFunctionsChecksum" };

  mwSize dims[2] = { 1, 1 };

  mxArray* mxPostCodegenInfo = mxCreateStructArray(2, dims, sizeof(fieldNames)/
    sizeof(fieldNames[0]), fieldNames);

  {
    mxArray* mxExportedFunctionsChecksum = mxCreateString("");
    mwSize exp_dims[2] = { 0, 1 };

    mxArray* mxExportedFunctionsUsedByThisChart = mxCreateCellArray(2, exp_dims);
    mxSetField(mxPostCodegenInfo, 0, "exportedFunctionsUsedByThisChart",
               mxExportedFunctionsUsedByThisChart);
    mxSetField(mxPostCodegenInfo, 0, "exportedFunctionsChecksum",
               mxExportedFunctionsChecksum);
  }

  return mxPostCodegenInfo;
}

static const mxArray *sf_get_sim_state_info_c6_slidemodecontrol(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  const char *infoEncStr[] = {
    "100 S1x2'type','srcId','name','auxInfo'{{M[1],M[5],T\"alpha\",},{M[8],M[0],T\"is_active_c6_slidemodecontrol\",}}"
  };

  mxArray *mxVarInfo = sf_mex_decode_encoded_mx_struct_array(infoEncStr, 2, 10);
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c6_slidemodecontrol_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static void chart_debug_initialization(SimStruct *S, unsigned int
  fullDebuggerInitialization)
{
  if (!sim_mode_is_rtw_gen(S)) {
    SFc6_slidemodecontrolInstanceStruct *chartInstance =
      (SFc6_slidemodecontrolInstanceStruct *)sf_get_chart_instance_ptr(S);
    if (ssIsFirstInitCond(S) && fullDebuggerInitialization==1) {
      /* do this only if simulation is starting */
      {
        unsigned int chartAlreadyPresent;
        chartAlreadyPresent = sf_debug_initialize_chart
          (sfGlobalDebugInstanceStruct,
           _slidemodecontrolMachineNumber_,
           6,
           1,
           1,
           0,
           6,
           0,
           0,
           0,
           0,
           0,
           &chartInstance->chartNumber,
           &chartInstance->instanceNumber,
           (void *)S);

        /* Each instance must initialize its own list of scripts */
        init_script_number_translation(_slidemodecontrolMachineNumber_,
          chartInstance->chartNumber,chartInstance->instanceNumber);
        if (chartAlreadyPresent==0) {
          /* this is the first instance */
          sf_debug_set_chart_disable_implicit_casting
            (sfGlobalDebugInstanceStruct,_slidemodecontrolMachineNumber_,
             chartInstance->chartNumber,1);
          sf_debug_set_chart_event_thresholds(sfGlobalDebugInstanceStruct,
            _slidemodecontrolMachineNumber_,
            chartInstance->chartNumber,
            0,
            0,
            0);
          _SFD_SET_DATA_PROPS(0,1,1,0,"V");
          _SFD_SET_DATA_PROPS(1,1,1,0,"r");
          _SFD_SET_DATA_PROPS(2,1,1,0,"theta");
          _SFD_SET_DATA_PROPS(3,1,1,0,"Vdotref");
          _SFD_SET_DATA_PROPS(4,1,1,0,"Vref");
          _SFD_SET_DATA_PROPS(5,2,0,1,"alpha");
          _SFD_STATE_INFO(0,0,2);
          _SFD_CH_SUBSTATE_COUNT(0);
          _SFD_CH_SUBSTATE_DECOMP(0);
        }

        _SFD_CV_INIT_CHART(0,0,0,0);

        {
          _SFD_CV_INIT_STATE(0,0,0,0,0,0,NULL,NULL);
        }

        _SFD_CV_INIT_TRANS(0,0,NULL,NULL,0,NULL);

        /* Initialization of MATLAB Function Model Coverage */
        _SFD_CV_INIT_EML(0,1,1,0,1,0,0,0,0,0,0,0);
        _SFD_CV_INIT_EML_FCN(0,0,"eML_blk_kernel",0,-1,600);
        _SFD_CV_INIT_EML_IF(0,1,0,289,307,324,354);
        _SFD_CV_INIT_EML_RELATIONAL(0,1,0,292,306,-1,3);
        _SFD_SET_DATA_COMPILED_PROPS(0,SF_DOUBLE,0,NULL,0,0,0,0.0,1.0,0,0,
          (MexFcnForType)c6_sf_marshallOut,(MexInFcnForType)NULL);
        _SFD_SET_DATA_COMPILED_PROPS(1,SF_DOUBLE,0,NULL,0,0,0,0.0,1.0,0,0,
          (MexFcnForType)c6_sf_marshallOut,(MexInFcnForType)NULL);
        _SFD_SET_DATA_COMPILED_PROPS(2,SF_DOUBLE,0,NULL,0,0,0,0.0,1.0,0,0,
          (MexFcnForType)c6_sf_marshallOut,(MexInFcnForType)NULL);
        _SFD_SET_DATA_COMPILED_PROPS(3,SF_DOUBLE,0,NULL,0,0,0,0.0,1.0,0,0,
          (MexFcnForType)c6_sf_marshallOut,(MexInFcnForType)NULL);
        _SFD_SET_DATA_COMPILED_PROPS(4,SF_DOUBLE,0,NULL,0,0,0,0.0,1.0,0,0,
          (MexFcnForType)c6_sf_marshallOut,(MexInFcnForType)NULL);
        _SFD_SET_DATA_COMPILED_PROPS(5,SF_DOUBLE,0,NULL,0,0,0,0.0,1.0,0,0,
          (MexFcnForType)c6_sf_marshallOut,(MexInFcnForType)c6_sf_marshallIn);
      }
    } else {
      sf_debug_reset_current_state_configuration(sfGlobalDebugInstanceStruct,
        _slidemodecontrolMachineNumber_,chartInstance->chartNumber,
        chartInstance->instanceNumber);
    }
  }
}

static void chart_debug_initialize_data_addresses(SimStruct *S)
{
  if (!sim_mode_is_rtw_gen(S)) {
    SFc6_slidemodecontrolInstanceStruct *chartInstance =
      (SFc6_slidemodecontrolInstanceStruct *)sf_get_chart_instance_ptr(S);
    if (ssIsFirstInitCond(S)) {
      /* do this only if simulation is starting and after we know the addresses of all data */
      {
        _SFD_SET_DATA_VALUE_PTR(0U, (void *)chartInstance->c6_V);
        _SFD_SET_DATA_VALUE_PTR(1U, (void *)chartInstance->c6_r);
        _SFD_SET_DATA_VALUE_PTR(2U, (void *)chartInstance->c6_theta);
        _SFD_SET_DATA_VALUE_PTR(5U, (void *)chartInstance->c6_alpha);
        _SFD_SET_DATA_VALUE_PTR(3U, (void *)chartInstance->c6_Vdotref);
        _SFD_SET_DATA_VALUE_PTR(4U, (void *)chartInstance->c6_Vref);
      }
    }
  }
}

static const char* sf_get_instance_specialization(void)
{
  return "sSLFM5Lyvbxi9jyP31IUvnF";
}

static void sf_opaque_initialize_c6_slidemodecontrol(void *chartInstanceVar)
{
  chart_debug_initialization(((SFc6_slidemodecontrolInstanceStruct*)
    chartInstanceVar)->S,0);
  initialize_params_c6_slidemodecontrol((SFc6_slidemodecontrolInstanceStruct*)
    chartInstanceVar);
  initialize_c6_slidemodecontrol((SFc6_slidemodecontrolInstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_enable_c6_slidemodecontrol(void *chartInstanceVar)
{
  enable_c6_slidemodecontrol((SFc6_slidemodecontrolInstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_disable_c6_slidemodecontrol(void *chartInstanceVar)
{
  disable_c6_slidemodecontrol((SFc6_slidemodecontrolInstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_gateway_c6_slidemodecontrol(void *chartInstanceVar)
{
  sf_gateway_c6_slidemodecontrol((SFc6_slidemodecontrolInstanceStruct*)
    chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c6_slidemodecontrol(SimStruct* S)
{
  return get_sim_state_c6_slidemodecontrol((SFc6_slidemodecontrolInstanceStruct *)
    sf_get_chart_instance_ptr(S));     /* raw sim ctx */
}

static void sf_opaque_set_sim_state_c6_slidemodecontrol(SimStruct* S, const
  mxArray *st)
{
  set_sim_state_c6_slidemodecontrol((SFc6_slidemodecontrolInstanceStruct*)
    sf_get_chart_instance_ptr(S), st);
}

static void sf_opaque_terminate_c6_slidemodecontrol(void *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc6_slidemodecontrolInstanceStruct*) chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_slidemodecontrol_optimization_info();
    }

    finalize_c6_slidemodecontrol((SFc6_slidemodecontrolInstanceStruct*)
      chartInstanceVar);
    utFree(chartInstanceVar);
    if (ssGetUserData(S)!= NULL) {
      sf_free_ChartRunTimeInfo(S);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc6_slidemodecontrol((SFc6_slidemodecontrolInstanceStruct*)
    chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c6_slidemodecontrol(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  if (sf_machine_global_initializer_called()) {
    initialize_params_c6_slidemodecontrol((SFc6_slidemodecontrolInstanceStruct*)
      sf_get_chart_instance_ptr(S));
  }
}

static void mdlSetWorkWidths_c6_slidemodecontrol(SimStruct *S)
{
  /* Set overwritable ports for inplace optimization */
  ssSetInputPortDirectFeedThrough(S, 0, 1);
  ssSetInputPortDirectFeedThrough(S, 1, 1);
  ssSetInputPortDirectFeedThrough(S, 2, 1);
  ssSetInputPortDirectFeedThrough(S, 3, 1);
  ssSetInputPortDirectFeedThrough(S, 4, 1);
  ssSetStatesModifiedOnlyInUpdate(S, 1);
  ssSetBlockIsPurelyCombinatorial_wrapper(S, 1);
  ssMdlUpdateIsEmpty(S, 1);
  if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
    mxArray *infoStruct = load_slidemodecontrol_optimization_info
      (sim_mode_is_rtw_gen(S), sim_mode_is_modelref_sim(S), sim_mode_is_external
       (S));
    int_T chartIsInlinable =
      (int_T)sf_is_chart_inlinable(sf_get_instance_specialization(),infoStruct,6);
    ssSetStateflowIsInlinable(S,chartIsInlinable);
    ssSetRTWCG(S,1);
    ssSetEnableFcnIsTrivial(S,1);
    ssSetDisableFcnIsTrivial(S,1);
    ssSetNotMultipleInlinable(S,sf_rtw_info_uint_prop
      (sf_get_instance_specialization(),infoStruct,6,
       "gatewayCannotBeInlinedMultipleTimes"));
    sf_set_chart_accesses_machine_info(S, sf_get_instance_specialization(),
      infoStruct, 6);
    sf_update_buildInfo(S, sf_get_instance_specialization(),infoStruct,6);
    if (chartIsInlinable) {
      ssSetInputPortOptimOpts(S, 0, SS_REUSABLE_AND_LOCAL);
      ssSetInputPortOptimOpts(S, 1, SS_REUSABLE_AND_LOCAL);
      ssSetInputPortOptimOpts(S, 2, SS_REUSABLE_AND_LOCAL);
      ssSetInputPortOptimOpts(S, 3, SS_REUSABLE_AND_LOCAL);
      ssSetInputPortOptimOpts(S, 4, SS_REUSABLE_AND_LOCAL);
      sf_mark_chart_expressionable_inputs(S,sf_get_instance_specialization(),
        infoStruct,6,5);
      sf_mark_chart_reusable_outputs(S,sf_get_instance_specialization(),
        infoStruct,6,1);
    }

    {
      unsigned int outPortIdx;
      for (outPortIdx=1; outPortIdx<=1; ++outPortIdx) {
        ssSetOutputPortOptimizeInIR(S, outPortIdx, 1U);
      }
    }

    {
      unsigned int inPortIdx;
      for (inPortIdx=0; inPortIdx < 5; ++inPortIdx) {
        ssSetInputPortOptimizeInIR(S, inPortIdx, 1U);
      }
    }

    sf_set_rtw_dwork_info(S,sf_get_instance_specialization(),infoStruct,6);
    sf_register_codegen_names_for_scoped_functions_defined_by_chart(S);
    ssSetHasSubFunctions(S,!(chartIsInlinable));
  } else {
  }

  ssSetOptions(S,ssGetOptions(S)|SS_OPTION_WORKS_WITH_CODE_REUSE);
  ssSetChecksum0(S,(3584149935U));
  ssSetChecksum1(S,(2959936458U));
  ssSetChecksum2(S,(1542112401U));
  ssSetChecksum3(S,(1974585645U));
  ssSetmdlDerivatives(S, NULL);
  ssSetExplicitFCSSCtrl(S,1);
  ssSetStateSemanticsClassicAndSynchronous(S, true);
  ssSupportsMultipleExecInstances(S,1);
}

static void mdlRTW_c6_slidemodecontrol(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlStart_c6_slidemodecontrol(SimStruct *S)
{
  SFc6_slidemodecontrolInstanceStruct *chartInstance;
  chartInstance = (SFc6_slidemodecontrolInstanceStruct *)utMalloc(sizeof
    (SFc6_slidemodecontrolInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc6_slidemodecontrolInstanceStruct));
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c6_slidemodecontrol;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c6_slidemodecontrol;
  chartInstance->chartInfo.terminateChart =
    sf_opaque_terminate_c6_slidemodecontrol;
  chartInstance->chartInfo.enableChart = sf_opaque_enable_c6_slidemodecontrol;
  chartInstance->chartInfo.disableChart = sf_opaque_disable_c6_slidemodecontrol;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c6_slidemodecontrol;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c6_slidemodecontrol;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c6_slidemodecontrol;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c6_slidemodecontrol;
  chartInstance->chartInfo.mdlStart = mdlStart_c6_slidemodecontrol;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c6_slidemodecontrol;
  chartInstance->chartInfo.callGetHoverDataForMsg = NULL;
  chartInstance->chartInfo.extModeExec = NULL;
  chartInstance->chartInfo.restoreLastMajorStepConfiguration = NULL;
  chartInstance->chartInfo.restoreBeforeLastMajorStepConfiguration = NULL;
  chartInstance->chartInfo.storeCurrentConfiguration = NULL;
  chartInstance->chartInfo.callAtomicSubchartUserFcn = NULL;
  chartInstance->chartInfo.callAtomicSubchartAutoFcn = NULL;
  chartInstance->chartInfo.debugInstance = sfGlobalDebugInstanceStruct;
  chartInstance->S = S;
  sf_init_ChartRunTimeInfo(S, &(chartInstance->chartInfo), false, 0);
  init_dsm_address_info(chartInstance);
  init_simulink_io_address(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  chart_debug_initialization(S,1);
  mdl_start_c6_slidemodecontrol(chartInstance);
}

void c6_slidemodecontrol_method_dispatcher(SimStruct *S, int_T method, void
  *data)
{
  switch (method) {
   case SS_CALL_MDL_START:
    mdlStart_c6_slidemodecontrol(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c6_slidemodecontrol(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c6_slidemodecontrol(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c6_slidemodecontrol_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
