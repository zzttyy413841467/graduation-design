/* Include files */

#include "slidemodecontrol_sfun.h"
#include "c7_slidemodecontrol.h"
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
static const char * c7_debug_family_names[45] = { "beta", "eta", "phi", "lambda",
  "F_f", "m", "S", "rho0", "g0", "Re", "mu", "hs", "rho", "q", "g", "cd2", "cd1",
  "cd0", "cl2", "cl1", "cl0", "Cl", "Cd", "L", "D", "b_2", "f_2", "hdot", "F",
  "k_2", "s", "sat", "hdoubledot", "sdot", "kkk", "nargin", "nargout", "alpha",
  "V", "r", "theta", "href", "hdotref", "hdoubledotref", "cbank" };

/* Function Declarations */
static void initialize_c7_slidemodecontrol(SFc7_slidemodecontrolInstanceStruct
  *chartInstance);
static void initialize_params_c7_slidemodecontrol
  (SFc7_slidemodecontrolInstanceStruct *chartInstance);
static void enable_c7_slidemodecontrol(SFc7_slidemodecontrolInstanceStruct
  *chartInstance);
static void disable_c7_slidemodecontrol(SFc7_slidemodecontrolInstanceStruct
  *chartInstance);
static void c7_update_debugger_state_c7_slidemodecontrol
  (SFc7_slidemodecontrolInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c7_slidemodecontrol
  (SFc7_slidemodecontrolInstanceStruct *chartInstance);
static void set_sim_state_c7_slidemodecontrol
  (SFc7_slidemodecontrolInstanceStruct *chartInstance, const mxArray *c7_st);
static void finalize_c7_slidemodecontrol(SFc7_slidemodecontrolInstanceStruct
  *chartInstance);
static void sf_gateway_c7_slidemodecontrol(SFc7_slidemodecontrolInstanceStruct
  *chartInstance);
static void mdl_start_c7_slidemodecontrol(SFc7_slidemodecontrolInstanceStruct
  *chartInstance);
static void c7_chartstep_c7_slidemodecontrol(SFc7_slidemodecontrolInstanceStruct
  *chartInstance);
static void initSimStructsc7_slidemodecontrol
  (SFc7_slidemodecontrolInstanceStruct *chartInstance);
static void init_script_number_translation(uint32_T c7_machineNumber, uint32_T
  c7_chartNumber, uint32_T c7_instanceNumber);
static const mxArray *c7_sf_marshallOut(void *chartInstanceVoid, void *c7_inData);
static real_T c7_emlrt_marshallIn(SFc7_slidemodecontrolInstanceStruct
  *chartInstance, const mxArray *c7_b_cbank, const char_T *c7_identifier);
static real_T c7_b_emlrt_marshallIn(SFc7_slidemodecontrolInstanceStruct
  *chartInstance, const mxArray *c7_u, const emlrtMsgIdentifier *c7_parentId);
static void c7_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c7_mxArrayInData, const char_T *c7_varName, void *c7_outData);
static const mxArray *c7_b_sf_marshallOut(void *chartInstanceVoid, void
  *c7_inData);
static int32_T c7_c_emlrt_marshallIn(SFc7_slidemodecontrolInstanceStruct
  *chartInstance, const mxArray *c7_u, const emlrtMsgIdentifier *c7_parentId);
static void c7_b_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c7_mxArrayInData, const char_T *c7_varName, void *c7_outData);
static uint8_T c7_d_emlrt_marshallIn(SFc7_slidemodecontrolInstanceStruct
  *chartInstance, const mxArray *c7_b_is_active_c7_slidemodecontrol, const
  char_T *c7_identifier);
static uint8_T c7_e_emlrt_marshallIn(SFc7_slidemodecontrolInstanceStruct
  *chartInstance, const mxArray *c7_u, const emlrtMsgIdentifier *c7_parentId);
static void init_dsm_address_info(SFc7_slidemodecontrolInstanceStruct
  *chartInstance);
static void init_simulink_io_address(SFc7_slidemodecontrolInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c7_slidemodecontrol(SFc7_slidemodecontrolInstanceStruct
  *chartInstance)
{
  if (sf_is_first_init_cond(chartInstance->S)) {
    initSimStructsc7_slidemodecontrol(chartInstance);
    chart_debug_initialize_data_addresses(chartInstance->S);
  }

  chartInstance->c7_sfEvent = CALL_EVENT;
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c7_is_active_c7_slidemodecontrol = 0U;
}

static void initialize_params_c7_slidemodecontrol
  (SFc7_slidemodecontrolInstanceStruct *chartInstance)
{
  (void)chartInstance;
}

static void enable_c7_slidemodecontrol(SFc7_slidemodecontrolInstanceStruct
  *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c7_slidemodecontrol(SFc7_slidemodecontrolInstanceStruct
  *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c7_update_debugger_state_c7_slidemodecontrol
  (SFc7_slidemodecontrolInstanceStruct *chartInstance)
{
  (void)chartInstance;
}

static const mxArray *get_sim_state_c7_slidemodecontrol
  (SFc7_slidemodecontrolInstanceStruct *chartInstance)
{
  const mxArray *c7_st;
  const mxArray *c7_y = NULL;
  real_T c7_hoistedGlobal;
  const mxArray *c7_b_y = NULL;
  uint8_T c7_b_hoistedGlobal;
  const mxArray *c7_c_y = NULL;
  c7_st = NULL;
  c7_st = NULL;
  c7_y = NULL;
  sf_mex_assign(&c7_y, sf_mex_createcellmatrix(2, 1), false);
  c7_hoistedGlobal = *chartInstance->c7_cbank;
  c7_b_y = NULL;
  sf_mex_assign(&c7_b_y, sf_mex_create("y", &c7_hoistedGlobal, 0, 0U, 0U, 0U, 0),
                false);
  sf_mex_setcell(c7_y, 0, c7_b_y);
  c7_b_hoistedGlobal = chartInstance->c7_is_active_c7_slidemodecontrol;
  c7_c_y = NULL;
  sf_mex_assign(&c7_c_y, sf_mex_create("y", &c7_b_hoistedGlobal, 3, 0U, 0U, 0U,
    0), false);
  sf_mex_setcell(c7_y, 1, c7_c_y);
  sf_mex_assign(&c7_st, c7_y, false);
  return c7_st;
}

static void set_sim_state_c7_slidemodecontrol
  (SFc7_slidemodecontrolInstanceStruct *chartInstance, const mxArray *c7_st)
{
  const mxArray *c7_u;
  chartInstance->c7_doneDoubleBufferReInit = true;
  c7_u = sf_mex_dup(c7_st);
  *chartInstance->c7_cbank = c7_emlrt_marshallIn(chartInstance, sf_mex_dup
    (sf_mex_getcell(c7_u, 0)), "cbank");
  chartInstance->c7_is_active_c7_slidemodecontrol = c7_d_emlrt_marshallIn
    (chartInstance, sf_mex_dup(sf_mex_getcell(c7_u, 1)),
     "is_active_c7_slidemodecontrol");
  sf_mex_destroy(&c7_u);
  c7_update_debugger_state_c7_slidemodecontrol(chartInstance);
  sf_mex_destroy(&c7_st);
}

static void finalize_c7_slidemodecontrol(SFc7_slidemodecontrolInstanceStruct
  *chartInstance)
{
  (void)chartInstance;
}

static void sf_gateway_c7_slidemodecontrol(SFc7_slidemodecontrolInstanceStruct
  *chartInstance)
{
  _SFD_SYMBOL_SCOPE_PUSH(0U, 0U);
  _sfTime_ = sf_get_time(chartInstance->S);
  _SFD_CC_CALL(CHART_ENTER_SFUNCTION_TAG, 5U, chartInstance->c7_sfEvent);
  _SFD_DATA_RANGE_CHECK(*chartInstance->c7_hdoubledotref, 6U);
  _SFD_DATA_RANGE_CHECK(*chartInstance->c7_hdotref, 5U);
  _SFD_DATA_RANGE_CHECK(*chartInstance->c7_href, 4U);
  _SFD_DATA_RANGE_CHECK(*chartInstance->c7_theta, 3U);
  _SFD_DATA_RANGE_CHECK(*chartInstance->c7_r, 2U);
  _SFD_DATA_RANGE_CHECK(*chartInstance->c7_V, 1U);
  _SFD_DATA_RANGE_CHECK(*chartInstance->c7_alpha, 0U);
  chartInstance->c7_sfEvent = CALL_EVENT;
  c7_chartstep_c7_slidemodecontrol(chartInstance);
  _SFD_SYMBOL_SCOPE_POP();
  _SFD_CHECK_FOR_STATE_INCONSISTENCY(_slidemodecontrolMachineNumber_,
    chartInstance->chartNumber, chartInstance->instanceNumber);
  _SFD_DATA_RANGE_CHECK(*chartInstance->c7_cbank, 7U);
}

static void mdl_start_c7_slidemodecontrol(SFc7_slidemodecontrolInstanceStruct
  *chartInstance)
{
  sim_mode_is_external(chartInstance->S);
}

static void c7_chartstep_c7_slidemodecontrol(SFc7_slidemodecontrolInstanceStruct
  *chartInstance)
{
  real_T c7_b_alpha;
  real_T c7_b_V;
  real_T c7_b_r;
  real_T c7_b_theta;
  real_T c7_b_href;
  real_T c7_b_hdotref;
  real_T c7_b_hdoubledotref;
  uint32_T c7_debug_family_var_map[45];
  real_T c7_beta;
  real_T c7_eta;
  real_T c7_phi;
  real_T c7_lambda;
  real_T c7_F_f;
  real_T c7_m;
  real_T c7_S;
  real_T c7_rho0;
  real_T c7_g0;
  real_T c7_Re;
  real_T c7_mu;
  real_T c7_hs;
  real_T c7_rho;
  real_T c7_q;
  real_T c7_g;
  real_T c7_cd2;
  real_T c7_cd1;
  real_T c7_cd0;
  real_T c7_cl2;
  real_T c7_cl1;
  real_T c7_cl0;
  real_T c7_Cl;
  real_T c7_Cd;
  real_T c7_L;
  real_T c7_D;
  real_T c7_b_2;
  real_T c7_f_2;
  real_T c7_hdot;
  real_T c7_F;
  real_T c7_k_2;
  real_T c7_s;
  real_T c7_sat;
  real_T c7_hdoubledot;
  real_T c7_sdot;
  real_T c7_kkk;
  real_T c7_nargin = 7.0;
  real_T c7_nargout = 1.0;
  real_T c7_b_cbank;
  real_T c7_x;
  real_T c7_a;
  real_T c7_b_a;
  real_T c7_b_x;
  real_T c7_c_x;
  real_T c7_c_a;
  real_T c7_A;
  real_T c7_d_x;
  real_T c7_b_A;
  real_T c7_e_x;
  real_T c7_d_a;
  real_T c7_f_x;
  real_T c7_g_x;
  real_T c7_B;
  real_T c7_h_x;
  real_T c7_c_A;
  real_T c7_i_x;
  real_T c7_j_x;
  real_T c7_k_x;
  real_T c7_d_A;
  real_T c7_b_B;
  real_T c7_e_A;
  real_T c7_c_B;
  real_T c7_f_A;
  real_T c7_g_A;
  real_T c7_d_B;
  real_T c7_e_B;
  real_T c7_l_x;
  real_T c7_m_x;
  real_T c7_f_B;
  real_T c7_n_x;
  real_T c7_o_x;
  _SFD_CC_CALL(CHART_ENTER_DURING_FUNCTION_TAG, 5U, chartInstance->c7_sfEvent);
  c7_b_alpha = *chartInstance->c7_alpha;
  c7_b_V = *chartInstance->c7_V;
  c7_b_r = *chartInstance->c7_r;
  c7_b_theta = *chartInstance->c7_theta;
  c7_b_href = *chartInstance->c7_href;
  c7_b_hdotref = *chartInstance->c7_hdotref;
  c7_b_hdoubledotref = *chartInstance->c7_hdoubledotref;
  _SFD_SYMBOL_SCOPE_PUSH_EML(0U, 45U, 45U, c7_debug_family_names,
    c7_debug_family_var_map);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_beta, 0U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_eta, 1U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_phi, 2U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_lambda, 3U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_F_f, 4U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML(&c7_m, 5U, c7_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_S, 6U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_rho0, 7U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML(&c7_g0, 8U, c7_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML(&c7_Re, 9U, c7_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML(&c7_mu, 10U, c7_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML(&c7_hs, 11U, c7_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_rho, 12U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_q, 13U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_g, 14U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_cd2, 15U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_cd1, 16U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_cd0, 17U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_cl2, 18U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_cl1, 19U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_cl0, 20U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_Cl, 21U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_Cd, 22U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_L, 23U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_D, 24U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_b_2, 25U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_f_2, 26U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_hdot, 27U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_F, 28U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_k_2, 29U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_s, 30U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_sat, 31U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_hdoubledot, 32U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_sdot, 33U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_kkk, 34U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_nargin, 35U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_nargout, 36U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML(&c7_b_alpha, 37U, c7_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML(&c7_b_V, 38U, c7_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML(&c7_b_r, 39U, c7_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML(&c7_b_theta, 40U, c7_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML(&c7_b_href, 41U, c7_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML(&c7_b_hdotref, 42U, c7_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML(&c7_b_hdoubledotref, 43U, c7_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c7_b_cbank, 44U, c7_sf_marshallOut,
    c7_sf_marshallIn);
  CV_EML_FCN(0, 0);
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 2);
  c7_beta = 1.5;
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 3);
  c7_eta = 500.0;
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 4);
  c7_phi = 0.01 * c7_b_href;
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 5);
  c7_lambda = 20.0;
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 6);
  c7_F_f = 0.5;
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 8);
  c7_m = 498.95;
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 9);
  c7_S = 0.113;
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 10);
  c7_rho0 = 1.225;
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 11);
  c7_g0 = 9.81;
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 12);
  c7_Re = 6.371393E+6;
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 13);
  c7_mu = 3.9823350434000469E+14;
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 14);
  c7_hs = 7320.0;
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 15);
  c7_x = -(c7_b_r - c7_Re);
  c7_rho = c7_rho0 * muDoubleScalarExp(c7_x / 7320.0);
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 16);
  c7_a = c7_b_V;
  c7_q = 0.5 * c7_rho * (c7_a * c7_a);
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 17);
  c7_b_a = c7_b_r;
  c7_g = 3.9823350434000469E+14 / (c7_b_a * c7_b_a);
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 18);
  c7_cd2 = -0.00015055882352941176;
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 19);
  c7_cd1 = 6.3827157599999991;
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 20);
  c7_cd0 = -0.03795;
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 21);
  c7_cl2 = 4.9999999999999996E-6;
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 22);
  c7_cl1 = 4.247076;
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 23);
  c7_cl0 = -0.998;
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 24);
  c7_b_x = c7_cl2 * c7_b_V;
  c7_Cl = (muDoubleScalarExp(c7_b_x) + c7_cl1 * c7_b_alpha) + c7_cl0;
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 25);
  c7_c_x = c7_cd2 * c7_b_V;
  c7_c_a = c7_b_alpha;
  c7_Cd = (muDoubleScalarExp(c7_c_x) + c7_cd1 * (c7_c_a * c7_c_a)) + c7_cd0;
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 26);
  c7_L = c7_q * c7_Cl * c7_S;
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 27);
  c7_D = c7_q * c7_Cd * c7_S;
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 29);
  c7_A = c7_L;
  c7_d_x = c7_b_theta;
  c7_b_2 = c7_A / 498.95 * muDoubleScalarCos(c7_d_x);
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 30);
  c7_b_A = c7_D;
  c7_e_x = c7_b_theta;
  c7_d_a = c7_b_V;
  c7_f_x = c7_b_theta;
  c7_g_x = muDoubleScalarCos(c7_f_x);
  c7_B = c7_b_r;
  c7_f_2 = (-c7_g - c7_b_A / 498.95 * muDoubleScalarSin(c7_e_x)) + c7_d_a *
    c7_d_a * (c7_g_x * c7_g_x) / c7_B;
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 31);
  c7_h_x = c7_b_theta;
  c7_hdot = c7_b_V * muDoubleScalarSin(c7_h_x);
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 33);
  c7_c_A = -c7_D;
  c7_i_x = c7_b_theta;
  c7_j_x = c7_c_A / 498.95 * c7_F_f * muDoubleScalarSin(c7_i_x);
  c7_F = muDoubleScalarAbs(c7_j_x);
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 36);
  c7_k_x = (c7_b_hdoubledotref - c7_f_2) - c7_lambda * (c7_hdot - c7_b_hdotref);
  c7_k_2 = c7_beta * (c7_eta + c7_F) + (c7_beta - 1.0) * muDoubleScalarAbs
    (c7_k_x);
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 37);
  c7_s = (c7_hdot - c7_b_hdotref) + c7_lambda * ((c7_b_r - c7_Re) - c7_b_href);
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 39);
  c7_d_A = c7_s;
  c7_b_B = c7_phi;
  c7_e_A = c7_s;
  c7_c_B = c7_phi;
  if (CV_EML_IF(0, 1, 0, CV_RELATIONAL_EVAL(4U, 0U, 0, muDoubleScalarAbs(c7_d_A /
         c7_b_B), 1.0, -1, 3U, muDoubleScalarAbs(c7_e_A / c7_c_B) <= 1.0))) {
    _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 40);
    c7_g_A = c7_s;
    c7_e_B = c7_phi;
    c7_sat = c7_g_A / c7_e_B;
  } else {
    _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 42);
    c7_f_A = c7_s;
    c7_d_B = c7_phi;
    c7_sat = c7_f_A / c7_d_B;
    c7_l_x = c7_sat;
    c7_sat = c7_l_x;
    c7_m_x = c7_sat;
    c7_sat = c7_m_x;
    c7_n_x = c7_sat;
    c7_sat = c7_n_x;
    c7_sat = muDoubleScalarSign(c7_sat);
  }

  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 44);
  c7_f_B = c7_b_2;
  c7_b_cbank = 1.0 / c7_f_B * (((c7_b_hdoubledotref - c7_f_2) - c7_lambda *
    (c7_hdot - c7_b_hdotref)) - c7_k_2 * c7_sat);
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 45);
  c7_hdoubledot = c7_f_2 + c7_b_2 * c7_b_cbank;
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 46);
  c7_sdot = (c7_hdoubledot - c7_b_hdoubledotref) + c7_lambda * (c7_hdot -
    c7_b_hdotref);
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, 47);
  c7_o_x = c7_s;
  c7_kkk = c7_s * c7_sdot + c7_eta * muDoubleScalarAbs(c7_o_x);
  _SFD_EML_CALL(0U, chartInstance->c7_sfEvent, -47);
  _SFD_SYMBOL_SCOPE_POP();
  *chartInstance->c7_cbank = c7_b_cbank;
  _SFD_CC_CALL(EXIT_OUT_OF_FUNCTION_TAG, 5U, chartInstance->c7_sfEvent);
}

static void initSimStructsc7_slidemodecontrol
  (SFc7_slidemodecontrolInstanceStruct *chartInstance)
{
  (void)chartInstance;
}

static void init_script_number_translation(uint32_T c7_machineNumber, uint32_T
  c7_chartNumber, uint32_T c7_instanceNumber)
{
  (void)(c7_machineNumber);
  (void)(c7_chartNumber);
  (void)(c7_instanceNumber);
}

static const mxArray *c7_sf_marshallOut(void *chartInstanceVoid, void *c7_inData)
{
  const mxArray *c7_mxArrayOutData;
  real_T c7_u;
  const mxArray *c7_y = NULL;
  SFc7_slidemodecontrolInstanceStruct *chartInstance;
  chartInstance = (SFc7_slidemodecontrolInstanceStruct *)chartInstanceVoid;
  c7_mxArrayOutData = NULL;
  c7_mxArrayOutData = NULL;
  c7_u = *(real_T *)c7_inData;
  c7_y = NULL;
  sf_mex_assign(&c7_y, sf_mex_create("y", &c7_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_assign(&c7_mxArrayOutData, c7_y, false);
  return c7_mxArrayOutData;
}

static real_T c7_emlrt_marshallIn(SFc7_slidemodecontrolInstanceStruct
  *chartInstance, const mxArray *c7_b_cbank, const char_T *c7_identifier)
{
  real_T c7_y;
  emlrtMsgIdentifier c7_thisId;
  c7_thisId.fIdentifier = (const char *)c7_identifier;
  c7_thisId.fParent = NULL;
  c7_thisId.bParentIsCell = false;
  c7_y = c7_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c7_b_cbank), &c7_thisId);
  sf_mex_destroy(&c7_b_cbank);
  return c7_y;
}

static real_T c7_b_emlrt_marshallIn(SFc7_slidemodecontrolInstanceStruct
  *chartInstance, const mxArray *c7_u, const emlrtMsgIdentifier *c7_parentId)
{
  real_T c7_y;
  real_T c7_d0;
  (void)chartInstance;
  sf_mex_import(c7_parentId, sf_mex_dup(c7_u), &c7_d0, 1, 0, 0U, 0, 0U, 0);
  c7_y = c7_d0;
  sf_mex_destroy(&c7_u);
  return c7_y;
}

static void c7_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c7_mxArrayInData, const char_T *c7_varName, void *c7_outData)
{
  const mxArray *c7_b_cbank;
  emlrtMsgIdentifier c7_thisId;
  real_T c7_y;
  SFc7_slidemodecontrolInstanceStruct *chartInstance;
  chartInstance = (SFc7_slidemodecontrolInstanceStruct *)chartInstanceVoid;
  c7_b_cbank = sf_mex_dup(c7_mxArrayInData);
  c7_thisId.fIdentifier = (const char *)c7_varName;
  c7_thisId.fParent = NULL;
  c7_thisId.bParentIsCell = false;
  c7_y = c7_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c7_b_cbank), &c7_thisId);
  sf_mex_destroy(&c7_b_cbank);
  *(real_T *)c7_outData = c7_y;
  sf_mex_destroy(&c7_mxArrayInData);
}

const mxArray *sf_c7_slidemodecontrol_get_eml_resolved_functions_info(void)
{
  const mxArray *c7_nameCaptureInfo = NULL;
  c7_nameCaptureInfo = NULL;
  sf_mex_assign(&c7_nameCaptureInfo, sf_mex_create("nameCaptureInfo", NULL, 0,
    0U, 1U, 0U, 2, 0, 1), false);
  return c7_nameCaptureInfo;
}

static const mxArray *c7_b_sf_marshallOut(void *chartInstanceVoid, void
  *c7_inData)
{
  const mxArray *c7_mxArrayOutData;
  int32_T c7_u;
  const mxArray *c7_y = NULL;
  SFc7_slidemodecontrolInstanceStruct *chartInstance;
  chartInstance = (SFc7_slidemodecontrolInstanceStruct *)chartInstanceVoid;
  c7_mxArrayOutData = NULL;
  c7_mxArrayOutData = NULL;
  c7_u = *(int32_T *)c7_inData;
  c7_y = NULL;
  sf_mex_assign(&c7_y, sf_mex_create("y", &c7_u, 6, 0U, 0U, 0U, 0), false);
  sf_mex_assign(&c7_mxArrayOutData, c7_y, false);
  return c7_mxArrayOutData;
}

static int32_T c7_c_emlrt_marshallIn(SFc7_slidemodecontrolInstanceStruct
  *chartInstance, const mxArray *c7_u, const emlrtMsgIdentifier *c7_parentId)
{
  int32_T c7_y;
  int32_T c7_i0;
  (void)chartInstance;
  sf_mex_import(c7_parentId, sf_mex_dup(c7_u), &c7_i0, 1, 6, 0U, 0, 0U, 0);
  c7_y = c7_i0;
  sf_mex_destroy(&c7_u);
  return c7_y;
}

static void c7_b_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c7_mxArrayInData, const char_T *c7_varName, void *c7_outData)
{
  const mxArray *c7_b_sfEvent;
  emlrtMsgIdentifier c7_thisId;
  int32_T c7_y;
  SFc7_slidemodecontrolInstanceStruct *chartInstance;
  chartInstance = (SFc7_slidemodecontrolInstanceStruct *)chartInstanceVoid;
  c7_b_sfEvent = sf_mex_dup(c7_mxArrayInData);
  c7_thisId.fIdentifier = (const char *)c7_varName;
  c7_thisId.fParent = NULL;
  c7_thisId.bParentIsCell = false;
  c7_y = c7_c_emlrt_marshallIn(chartInstance, sf_mex_dup(c7_b_sfEvent),
    &c7_thisId);
  sf_mex_destroy(&c7_b_sfEvent);
  *(int32_T *)c7_outData = c7_y;
  sf_mex_destroy(&c7_mxArrayInData);
}

static uint8_T c7_d_emlrt_marshallIn(SFc7_slidemodecontrolInstanceStruct
  *chartInstance, const mxArray *c7_b_is_active_c7_slidemodecontrol, const
  char_T *c7_identifier)
{
  uint8_T c7_y;
  emlrtMsgIdentifier c7_thisId;
  c7_thisId.fIdentifier = (const char *)c7_identifier;
  c7_thisId.fParent = NULL;
  c7_thisId.bParentIsCell = false;
  c7_y = c7_e_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c7_b_is_active_c7_slidemodecontrol), &c7_thisId);
  sf_mex_destroy(&c7_b_is_active_c7_slidemodecontrol);
  return c7_y;
}

static uint8_T c7_e_emlrt_marshallIn(SFc7_slidemodecontrolInstanceStruct
  *chartInstance, const mxArray *c7_u, const emlrtMsgIdentifier *c7_parentId)
{
  uint8_T c7_y;
  uint8_T c7_u0;
  (void)chartInstance;
  sf_mex_import(c7_parentId, sf_mex_dup(c7_u), &c7_u0, 1, 3, 0U, 0, 0U, 0);
  c7_y = c7_u0;
  sf_mex_destroy(&c7_u);
  return c7_y;
}

static void init_dsm_address_info(SFc7_slidemodecontrolInstanceStruct
  *chartInstance)
{
  (void)chartInstance;
}

static void init_simulink_io_address(SFc7_slidemodecontrolInstanceStruct
  *chartInstance)
{
  chartInstance->c7_fEmlrtCtx = (void *)sfrtGetEmlrtCtx(chartInstance->S);
  chartInstance->c7_alpha = (real_T *)ssGetInputPortSignal_wrapper
    (chartInstance->S, 0);
  chartInstance->c7_V = (real_T *)ssGetInputPortSignal_wrapper(chartInstance->S,
    1);
  chartInstance->c7_r = (real_T *)ssGetInputPortSignal_wrapper(chartInstance->S,
    2);
  chartInstance->c7_theta = (real_T *)ssGetInputPortSignal_wrapper
    (chartInstance->S, 3);
  chartInstance->c7_cbank = (real_T *)ssGetOutputPortSignal_wrapper
    (chartInstance->S, 1);
  chartInstance->c7_href = (real_T *)ssGetInputPortSignal_wrapper
    (chartInstance->S, 4);
  chartInstance->c7_hdotref = (real_T *)ssGetInputPortSignal_wrapper
    (chartInstance->S, 5);
  chartInstance->c7_hdoubledotref = (real_T *)ssGetInputPortSignal_wrapper
    (chartInstance->S, 6);
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

void sf_c7_slidemodecontrol_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(3772606633U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(226818080U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(1929454239U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(252949119U);
}

mxArray* sf_c7_slidemodecontrol_get_post_codegen_info(void);
mxArray *sf_c7_slidemodecontrol_get_autoinheritance_info(void)
{
  const char *autoinheritanceFields[] = { "checksum", "inputs", "parameters",
    "outputs", "locals", "postCodegenInfo" };

  mxArray *mxAutoinheritanceInfo = mxCreateStructMatrix(1, 1, sizeof
    (autoinheritanceFields)/sizeof(autoinheritanceFields[0]),
    autoinheritanceFields);

  {
    mxArray *mxChecksum = mxCreateString("3pVpeYImdXNrqdBqD7OReG");
    mxSetField(mxAutoinheritanceInfo,0,"checksum",mxChecksum);
  }

  {
    const char *dataFields[] = { "size", "type", "complexity" };

    mxArray *mxData = mxCreateStructMatrix(1,7,3,dataFields);

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

    {
      mxArray *mxSize = mxCreateDoubleMatrix(1,0,mxREAL);
      double *pr = mxGetPr(mxSize);
      mxSetField(mxData,5,"size",mxSize);
    }

    {
      const char *typeFields[] = { "base", "fixpt", "isFixedPointType" };

      mxArray *mxType = mxCreateStructMatrix(1,1,sizeof(typeFields)/sizeof
        (typeFields[0]),typeFields);
      mxSetField(mxType,0,"base",mxCreateDoubleScalar(10));
      mxSetField(mxType,0,"fixpt",mxCreateDoubleMatrix(0,0,mxREAL));
      mxSetField(mxType,0,"isFixedPointType",mxCreateDoubleScalar(0));
      mxSetField(mxData,5,"type",mxType);
    }

    mxSetField(mxData,5,"complexity",mxCreateDoubleScalar(0));

    {
      mxArray *mxSize = mxCreateDoubleMatrix(1,0,mxREAL);
      double *pr = mxGetPr(mxSize);
      mxSetField(mxData,6,"size",mxSize);
    }

    {
      const char *typeFields[] = { "base", "fixpt", "isFixedPointType" };

      mxArray *mxType = mxCreateStructMatrix(1,1,sizeof(typeFields)/sizeof
        (typeFields[0]),typeFields);
      mxSetField(mxType,0,"base",mxCreateDoubleScalar(10));
      mxSetField(mxType,0,"fixpt",mxCreateDoubleMatrix(0,0,mxREAL));
      mxSetField(mxType,0,"isFixedPointType",mxCreateDoubleScalar(0));
      mxSetField(mxData,6,"type",mxType);
    }

    mxSetField(mxData,6,"complexity",mxCreateDoubleScalar(0));
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
    mxArray* mxPostCodegenInfo = sf_c7_slidemodecontrol_get_post_codegen_info();
    mxSetField(mxAutoinheritanceInfo,0,"postCodegenInfo",mxPostCodegenInfo);
  }

  return(mxAutoinheritanceInfo);
}

mxArray *sf_c7_slidemodecontrol_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c7_slidemodecontrol_jit_fallback_info(void)
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

mxArray *sf_c7_slidemodecontrol_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

mxArray* sf_c7_slidemodecontrol_get_post_codegen_info(void)
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

static const mxArray *sf_get_sim_state_info_c7_slidemodecontrol(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  const char *infoEncStr[] = {
    "100 S1x2'type','srcId','name','auxInfo'{{M[1],M[5],T\"cbank\",},{M[8],M[0],T\"is_active_c7_slidemodecontrol\",}}"
  };

  mxArray *mxVarInfo = sf_mex_decode_encoded_mx_struct_array(infoEncStr, 2, 10);
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c7_slidemodecontrol_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static void chart_debug_initialization(SimStruct *S, unsigned int
  fullDebuggerInitialization)
{
  if (!sim_mode_is_rtw_gen(S)) {
    SFc7_slidemodecontrolInstanceStruct *chartInstance =
      (SFc7_slidemodecontrolInstanceStruct *)sf_get_chart_instance_ptr(S);
    if (ssIsFirstInitCond(S) && fullDebuggerInitialization==1) {
      /* do this only if simulation is starting */
      {
        unsigned int chartAlreadyPresent;
        chartAlreadyPresent = sf_debug_initialize_chart
          (sfGlobalDebugInstanceStruct,
           _slidemodecontrolMachineNumber_,
           7,
           1,
           1,
           0,
           8,
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
          _SFD_SET_DATA_PROPS(0,1,1,0,"alpha");
          _SFD_SET_DATA_PROPS(1,1,1,0,"V");
          _SFD_SET_DATA_PROPS(2,1,1,0,"r");
          _SFD_SET_DATA_PROPS(3,1,1,0,"theta");
          _SFD_SET_DATA_PROPS(4,1,1,0,"href");
          _SFD_SET_DATA_PROPS(5,1,1,0,"hdotref");
          _SFD_SET_DATA_PROPS(6,1,1,0,"hdoubledotref");
          _SFD_SET_DATA_PROPS(7,2,0,1,"cbank");
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
        _SFD_CV_INIT_EML_FCN(0,0,"eML_blk_kernel",0,-1,908);
        _SFD_CV_INIT_EML_IF(0,1,0,677,694,710,739);
        _SFD_CV_INIT_EML_RELATIONAL(0,1,0,680,693,-1,3);
        _SFD_SET_DATA_COMPILED_PROPS(0,SF_DOUBLE,0,NULL,0,0,0,0.0,1.0,0,0,
          (MexFcnForType)c7_sf_marshallOut,(MexInFcnForType)NULL);
        _SFD_SET_DATA_COMPILED_PROPS(1,SF_DOUBLE,0,NULL,0,0,0,0.0,1.0,0,0,
          (MexFcnForType)c7_sf_marshallOut,(MexInFcnForType)NULL);
        _SFD_SET_DATA_COMPILED_PROPS(2,SF_DOUBLE,0,NULL,0,0,0,0.0,1.0,0,0,
          (MexFcnForType)c7_sf_marshallOut,(MexInFcnForType)NULL);
        _SFD_SET_DATA_COMPILED_PROPS(3,SF_DOUBLE,0,NULL,0,0,0,0.0,1.0,0,0,
          (MexFcnForType)c7_sf_marshallOut,(MexInFcnForType)NULL);
        _SFD_SET_DATA_COMPILED_PROPS(4,SF_DOUBLE,0,NULL,0,0,0,0.0,1.0,0,0,
          (MexFcnForType)c7_sf_marshallOut,(MexInFcnForType)NULL);
        _SFD_SET_DATA_COMPILED_PROPS(5,SF_DOUBLE,0,NULL,0,0,0,0.0,1.0,0,0,
          (MexFcnForType)c7_sf_marshallOut,(MexInFcnForType)NULL);
        _SFD_SET_DATA_COMPILED_PROPS(6,SF_DOUBLE,0,NULL,0,0,0,0.0,1.0,0,0,
          (MexFcnForType)c7_sf_marshallOut,(MexInFcnForType)NULL);
        _SFD_SET_DATA_COMPILED_PROPS(7,SF_DOUBLE,0,NULL,0,0,0,0.0,1.0,0,0,
          (MexFcnForType)c7_sf_marshallOut,(MexInFcnForType)c7_sf_marshallIn);
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
    SFc7_slidemodecontrolInstanceStruct *chartInstance =
      (SFc7_slidemodecontrolInstanceStruct *)sf_get_chart_instance_ptr(S);
    if (ssIsFirstInitCond(S)) {
      /* do this only if simulation is starting and after we know the addresses of all data */
      {
        _SFD_SET_DATA_VALUE_PTR(0U, (void *)chartInstance->c7_alpha);
        _SFD_SET_DATA_VALUE_PTR(1U, (void *)chartInstance->c7_V);
        _SFD_SET_DATA_VALUE_PTR(2U, (void *)chartInstance->c7_r);
        _SFD_SET_DATA_VALUE_PTR(3U, (void *)chartInstance->c7_theta);
        _SFD_SET_DATA_VALUE_PTR(7U, (void *)chartInstance->c7_cbank);
        _SFD_SET_DATA_VALUE_PTR(4U, (void *)chartInstance->c7_href);
        _SFD_SET_DATA_VALUE_PTR(5U, (void *)chartInstance->c7_hdotref);
        _SFD_SET_DATA_VALUE_PTR(6U, (void *)chartInstance->c7_hdoubledotref);
      }
    }
  }
}

static const char* sf_get_instance_specialization(void)
{
  return "sCJc5o7g9ASo6DpeOhUytVF";
}

static void sf_opaque_initialize_c7_slidemodecontrol(void *chartInstanceVar)
{
  chart_debug_initialization(((SFc7_slidemodecontrolInstanceStruct*)
    chartInstanceVar)->S,0);
  initialize_params_c7_slidemodecontrol((SFc7_slidemodecontrolInstanceStruct*)
    chartInstanceVar);
  initialize_c7_slidemodecontrol((SFc7_slidemodecontrolInstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_enable_c7_slidemodecontrol(void *chartInstanceVar)
{
  enable_c7_slidemodecontrol((SFc7_slidemodecontrolInstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_disable_c7_slidemodecontrol(void *chartInstanceVar)
{
  disable_c7_slidemodecontrol((SFc7_slidemodecontrolInstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_gateway_c7_slidemodecontrol(void *chartInstanceVar)
{
  sf_gateway_c7_slidemodecontrol((SFc7_slidemodecontrolInstanceStruct*)
    chartInstanceVar);
}

static const mxArray* sf_opaque_get_sim_state_c7_slidemodecontrol(SimStruct* S)
{
  return get_sim_state_c7_slidemodecontrol((SFc7_slidemodecontrolInstanceStruct *)
    sf_get_chart_instance_ptr(S));     /* raw sim ctx */
}

static void sf_opaque_set_sim_state_c7_slidemodecontrol(SimStruct* S, const
  mxArray *st)
{
  set_sim_state_c7_slidemodecontrol((SFc7_slidemodecontrolInstanceStruct*)
    sf_get_chart_instance_ptr(S), st);
}

static void sf_opaque_terminate_c7_slidemodecontrol(void *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc7_slidemodecontrolInstanceStruct*) chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_slidemodecontrol_optimization_info();
    }

    finalize_c7_slidemodecontrol((SFc7_slidemodecontrolInstanceStruct*)
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
  initSimStructsc7_slidemodecontrol((SFc7_slidemodecontrolInstanceStruct*)
    chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c7_slidemodecontrol(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  if (sf_machine_global_initializer_called()) {
    initialize_params_c7_slidemodecontrol((SFc7_slidemodecontrolInstanceStruct*)
      sf_get_chart_instance_ptr(S));
  }
}

static void mdlSetWorkWidths_c7_slidemodecontrol(SimStruct *S)
{
  /* Set overwritable ports for inplace optimization */
  ssSetInputPortDirectFeedThrough(S, 0, 1);
  ssSetInputPortDirectFeedThrough(S, 1, 1);
  ssSetInputPortDirectFeedThrough(S, 2, 1);
  ssSetInputPortDirectFeedThrough(S, 3, 1);
  ssSetInputPortDirectFeedThrough(S, 4, 1);
  ssSetInputPortDirectFeedThrough(S, 5, 1);
  ssSetInputPortDirectFeedThrough(S, 6, 1);
  ssSetStatesModifiedOnlyInUpdate(S, 1);
  ssSetBlockIsPurelyCombinatorial_wrapper(S, 1);
  ssMdlUpdateIsEmpty(S, 1);
  if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
    mxArray *infoStruct = load_slidemodecontrol_optimization_info
      (sim_mode_is_rtw_gen(S), sim_mode_is_modelref_sim(S), sim_mode_is_external
       (S));
    int_T chartIsInlinable =
      (int_T)sf_is_chart_inlinable(sf_get_instance_specialization(),infoStruct,7);
    ssSetStateflowIsInlinable(S,chartIsInlinable);
    ssSetRTWCG(S,1);
    ssSetEnableFcnIsTrivial(S,1);
    ssSetDisableFcnIsTrivial(S,1);
    ssSetNotMultipleInlinable(S,sf_rtw_info_uint_prop
      (sf_get_instance_specialization(),infoStruct,7,
       "gatewayCannotBeInlinedMultipleTimes"));
    sf_set_chart_accesses_machine_info(S, sf_get_instance_specialization(),
      infoStruct, 7);
    sf_update_buildInfo(S, sf_get_instance_specialization(),infoStruct,7);
    if (chartIsInlinable) {
      ssSetInputPortOptimOpts(S, 0, SS_REUSABLE_AND_LOCAL);
      ssSetInputPortOptimOpts(S, 1, SS_REUSABLE_AND_LOCAL);
      ssSetInputPortOptimOpts(S, 2, SS_REUSABLE_AND_LOCAL);
      ssSetInputPortOptimOpts(S, 3, SS_REUSABLE_AND_LOCAL);
      ssSetInputPortOptimOpts(S, 4, SS_REUSABLE_AND_LOCAL);
      ssSetInputPortOptimOpts(S, 5, SS_REUSABLE_AND_LOCAL);
      ssSetInputPortOptimOpts(S, 6, SS_REUSABLE_AND_LOCAL);
      sf_mark_chart_expressionable_inputs(S,sf_get_instance_specialization(),
        infoStruct,7,7);
      sf_mark_chart_reusable_outputs(S,sf_get_instance_specialization(),
        infoStruct,7,1);
    }

    {
      unsigned int outPortIdx;
      for (outPortIdx=1; outPortIdx<=1; ++outPortIdx) {
        ssSetOutputPortOptimizeInIR(S, outPortIdx, 1U);
      }
    }

    {
      unsigned int inPortIdx;
      for (inPortIdx=0; inPortIdx < 7; ++inPortIdx) {
        ssSetInputPortOptimizeInIR(S, inPortIdx, 1U);
      }
    }

    sf_set_rtw_dwork_info(S,sf_get_instance_specialization(),infoStruct,7);
    sf_register_codegen_names_for_scoped_functions_defined_by_chart(S);
    ssSetHasSubFunctions(S,!(chartIsInlinable));
  } else {
  }

  ssSetOptions(S,ssGetOptions(S)|SS_OPTION_WORKS_WITH_CODE_REUSE);
  ssSetChecksum0(S,(816505193U));
  ssSetChecksum1(S,(3864427940U));
  ssSetChecksum2(S,(2436776078U));
  ssSetChecksum3(S,(62667184U));
  ssSetmdlDerivatives(S, NULL);
  ssSetExplicitFCSSCtrl(S,1);
  ssSetStateSemanticsClassicAndSynchronous(S, true);
  ssSupportsMultipleExecInstances(S,1);
}

static void mdlRTW_c7_slidemodecontrol(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlStart_c7_slidemodecontrol(SimStruct *S)
{
  SFc7_slidemodecontrolInstanceStruct *chartInstance;
  chartInstance = (SFc7_slidemodecontrolInstanceStruct *)utMalloc(sizeof
    (SFc7_slidemodecontrolInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  memset(chartInstance, 0, sizeof(SFc7_slidemodecontrolInstanceStruct));
  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c7_slidemodecontrol;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c7_slidemodecontrol;
  chartInstance->chartInfo.terminateChart =
    sf_opaque_terminate_c7_slidemodecontrol;
  chartInstance->chartInfo.enableChart = sf_opaque_enable_c7_slidemodecontrol;
  chartInstance->chartInfo.disableChart = sf_opaque_disable_c7_slidemodecontrol;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c7_slidemodecontrol;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c7_slidemodecontrol;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c7_slidemodecontrol;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c7_slidemodecontrol;
  chartInstance->chartInfo.mdlStart = mdlStart_c7_slidemodecontrol;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c7_slidemodecontrol;
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
  mdl_start_c7_slidemodecontrol(chartInstance);
}

void c7_slidemodecontrol_method_dispatcher(SimStruct *S, int_T method, void
  *data)
{
  switch (method) {
   case SS_CALL_MDL_START:
    mdlStart_c7_slidemodecontrol(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c7_slidemodecontrol(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c7_slidemodecontrol(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c7_slidemodecontrol_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}
