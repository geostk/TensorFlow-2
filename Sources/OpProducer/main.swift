/* Copyright 2017 The Octadero Authors. All Rights Reserved.
Created by Volodymyr Pavliukevych on 2017.

Licensed under the GPL License, Version 3.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.gnu.org/licenses/gpl-3.0.txt

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

import CTensorFlow
import Foundation
import CAPI
import Proto

let producer = SourceCodeProducer()


do {
	let opList = try CAPI.opList()
	print("Found \(opList.op.count) operations.")
	try producer.process(operations: opList.op.flatMap{ MutableTensorflow_OpDef(op: $0)})
	try producer.write(in: "/tmp/OpWrapper.swift")
} catch {
	print(error)
}

