/* 
 * File:   Model.h
 * Author: trungthanh
 *
 * Created on February 01, 2018, 6:16 PM
 */

#ifndef _MODELDATA_H
#define _MODELDATA_H

#include <vector>
#include "{{THRIFT_FILE_NAME}}_types.h"

namespace model {

    
    class ModelData {
    public:
        
        {{MODELDATA_TYPE_THRIFT}} data;
        
        ModelData(void) {
            
        }

        void assignTo({{MODELDATA_TYPE_THRIFT}}& value) const {
            value = data;
        }

        void assignFrom(const {{MODELDATA_TYPE_THRIFT}}& value) {
            this->data = value;
        }


    };

}

#endif 
