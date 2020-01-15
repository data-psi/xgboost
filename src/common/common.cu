/*!
 * Copyright 2018 XGBoost contributors
 */
#include "common.h"

namespace xgboost {
namespace common {

int AllVisibleGPUs() {
  int n_visgpus = 0;
  try {
    // When compiled with CUDA but running on CPU only device,
    // cudaGetDeviceCount will fail.
    cudaGetDeviceCount(&n_visgpus);
  } catch(const dmlc::Error &except) {
    return 0;
  } catch(const std::exception& e) {
    return 0;
  } catch(const std::string& e) {
    return 0;
  } catch(...) {
    return 0;
  }
  return n_visgpus;
}

}  // namespace common
}  // namespace xgboost
