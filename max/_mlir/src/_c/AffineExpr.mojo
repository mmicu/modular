# ===----------------------------------------------------------------------=== #
# Copyright (c) 2025, Modular Inc. All rights reserved.
#
# Licensed under the Apache License v2.0 with LLVM Exceptions:
# https://llvm.org/LICENSE.txt
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ===----------------------------------------------------------------------=== #
#
# GENERATED FILE, DO NOT EDIT!
#
# Last generated by joe at 2024-09-19 16:25:26.784039 with command
# ```
#   ./utils/mojo/bindings-scripts/mlir/generate_mlir_mojo_bindings.sh
# ```
#
# ===----------------------------------------------------------------------=== #


from io.write import _WriteBufferStack

from .AffineMap import MlirAffineMap
from .ffi import MLIR_func
from .IR import *

# ===-- mlir-c/AffineExpr.h - C API for MLIR Affine Expressions ---*- C -*-===//
#
#  Part of the LLVM Project, under the Apache License v2.0 with LLVM
#  Exceptions.
#  See https://llvm.org/LICENSE.txt for license information.
#  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
#
# ===----------------------------------------------------------------------===//


# ===----------------------------------------------------------------------===//
#  Opaque type declarations.
#
#  Types are exposed to C bindings as structs containing opaque pointers. They
#  are not supposed to be inspected from C. This allows the underlying
#  representation to change without affecting the API users. The use of structs
#  instead of typedefs enables some type safety as structs are not implicitly
#  convertible to each other.
#
#  Instances of these types may or may not own the underlying object. The
#  ownership semantics is defined by how an instance of the type was obtained.
# ===----------------------------------------------------------------------===//


@register_passable("trivial")
struct MlirAffineExpr:
    var ptr: OpaquePointer


fn mlirAffineExprGetContext(affine_expr: MlirAffineExpr) -> MlirContext:
    """Gets the context that owns the affine expression."""
    return MLIR_func["mlirAffineExprGetContext", MlirContext](affine_expr)


fn mlirAffineExprEqual(lhs: MlirAffineExpr, rhs: MlirAffineExpr) -> Bool:
    """Returns `true` if the two affine expressions are equal."""
    return MLIR_func["mlirAffineExprEqual", Bool](lhs, rhs)


# FIXME(codegen): static function mlirAffineExprIsNull


fn mlirAffineExprPrint[W: Writer](mut writer: W, affine_expr: MlirAffineExpr):
    """Prints an affine expression by sending chunks of the string representation
    and forwarding `userData to `callback`. Note that the callback may be called
    several times with consecutive chunks of the string."""
    var buffer = _WriteBufferStack(writer)
    MLIR_func["mlirAffineExprPrint", NoneType._mlir_type](
        affine_expr,
        write_buffered_callback[W],
        UnsafePointer(to=buffer),
    )
    buffer.flush()


fn mlirAffineExprDump(affine_expr: MlirAffineExpr) -> None:
    """Prints the affine expression to the standard error stream."""
    return MLIR_func["mlirAffineExprDump", NoneType._mlir_type](affine_expr)


fn mlirAffineExprIsSymbolicOrConstant(affine_expr: MlirAffineExpr) -> Bool:
    """Checks whether the given affine expression is made out of only symbols and
    constants."""
    return MLIR_func["mlirAffineExprIsSymbolicOrConstant", Bool](affine_expr)


fn mlirAffineExprIsPureAffine(affine_expr: MlirAffineExpr) -> Bool:
    """Checks whether the given affine expression is a pure affine expression, i.e.
    mul, floordiv, ceildic, and mod is only allowed w.r.t constants."""
    return MLIR_func["mlirAffineExprIsPureAffine", Bool](affine_expr)


fn mlirAffineExprGetLargestKnownDivisor(affine_expr: MlirAffineExpr) -> Int64:
    """Returns the greatest known integral divisor of this affine expression. The
    result is always positive."""
    return MLIR_func["mlirAffineExprGetLargestKnownDivisor", Int64](affine_expr)


fn mlirAffineExprIsMultipleOf(
    affine_expr: MlirAffineExpr, factor: Int64
) -> Bool:
    """Checks whether the given affine expression is a multiple of 'factor'."""
    return MLIR_func["mlirAffineExprIsMultipleOf", Bool](affine_expr, factor)


fn mlirAffineExprIsFunctionOfDim(
    affine_expr: MlirAffineExpr, position: Int
) -> Bool:
    """Checks whether the given affine expression involves AffineDimExpr
    'position'."""
    return MLIR_func["mlirAffineExprIsFunctionOfDim", Bool](
        affine_expr, position
    )


fn mlirAffineExprCompose(
    affine_expr: MlirAffineExpr, affine_map: MlirAffineMap
) -> MlirAffineExpr:
    """Composes the given map with the given expression."""
    return MLIR_func["mlirAffineExprCompose", MlirAffineExpr](
        affine_expr, affine_map
    )


# ===----------------------------------------------------------------------===//
#  Affine Dimension Expression.
# ===----------------------------------------------------------------------===//


fn mlirAffineExprIsADim(affine_expr: MlirAffineExpr) -> Bool:
    """Checks whether the given affine expression is a dimension expression."""
    return MLIR_func["mlirAffineExprIsADim", Bool](affine_expr)


fn mlirAffineDimExprGet(ctx: MlirContext, position: Int) -> MlirAffineExpr:
    """Creates an affine dimension expression with 'position' in the context."""
    return MLIR_func["mlirAffineDimExprGet", MlirAffineExpr](ctx, position)


fn mlirAffineDimExprGetPosition(affine_expr: MlirAffineExpr) -> Int:
    """Returns the position of the given affine dimension expression."""
    return MLIR_func["mlirAffineDimExprGetPosition", Int](affine_expr)


# ===----------------------------------------------------------------------===//
#  Affine Symbol Expression.
# ===----------------------------------------------------------------------===//


fn mlirAffineExprIsASymbol(affine_expr: MlirAffineExpr) -> Bool:
    """Checks whether the given affine expression is a symbol expression."""
    return MLIR_func["mlirAffineExprIsASymbol", Bool](affine_expr)


fn mlirAffineSymbolExprGet(ctx: MlirContext, position: Int) -> MlirAffineExpr:
    """Creates an affine symbol expression with 'position' in the context."""
    return MLIR_func["mlirAffineSymbolExprGet", MlirAffineExpr](ctx, position)


fn mlirAffineSymbolExprGetPosition(affine_expr: MlirAffineExpr) -> Int:
    """Returns the position of the given affine symbol expression."""
    return MLIR_func["mlirAffineSymbolExprGetPosition", Int](affine_expr)


# ===----------------------------------------------------------------------===//
#  Affine Constant Expression.
# ===----------------------------------------------------------------------===//


fn mlirAffineExprIsAConstant(affine_expr: MlirAffineExpr) -> Bool:
    """Checks whether the given affine expression is a constant expression."""
    return MLIR_func["mlirAffineExprIsAConstant", Bool](affine_expr)


fn mlirAffineConstantExprGet(
    ctx: MlirContext, constant: Int64
) -> MlirAffineExpr:
    """Creates an affine constant expression with 'constant' in the context."""
    return MLIR_func["mlirAffineConstantExprGet", MlirAffineExpr](ctx, constant)


fn mlirAffineConstantExprGetValue(affine_expr: MlirAffineExpr) -> Int64:
    """Returns the value of the given affine constant expression."""
    return MLIR_func["mlirAffineConstantExprGetValue", Int64](affine_expr)


# ===----------------------------------------------------------------------===//
#  Affine Add Expression.
# ===----------------------------------------------------------------------===//


fn mlirAffineExprIsAAdd(affine_expr: MlirAffineExpr) -> Bool:
    """Checks whether the given affine expression is an add expression."""
    return MLIR_func["mlirAffineExprIsAAdd", Bool](affine_expr)


fn mlirAffineAddExprGet(
    lhs: MlirAffineExpr, rhs: MlirAffineExpr
) -> MlirAffineExpr:
    """Creates an affine add expression with 'lhs' and 'rhs'."""
    return MLIR_func["mlirAffineAddExprGet", MlirAffineExpr](lhs, rhs)


# ===----------------------------------------------------------------------===//
#  Affine Mul Expression.
# ===----------------------------------------------------------------------===//


fn mlirAffineExprIsAMul(affine_expr: MlirAffineExpr) -> Bool:
    """Checks whether the given affine expression is an mul expression."""
    return MLIR_func["mlirAffineExprIsAMul", Bool](affine_expr)


fn mlirAffineMulExprGet(
    lhs: MlirAffineExpr, rhs: MlirAffineExpr
) -> MlirAffineExpr:
    """Creates an affine mul expression with 'lhs' and 'rhs'."""
    return MLIR_func["mlirAffineMulExprGet", MlirAffineExpr](lhs, rhs)


# ===----------------------------------------------------------------------===//
#  Affine Mod Expression.
# ===----------------------------------------------------------------------===//


fn mlirAffineExprIsAMod(affine_expr: MlirAffineExpr) -> Bool:
    """Checks whether the given affine expression is an mod expression."""
    return MLIR_func["mlirAffineExprIsAMod", Bool](affine_expr)


fn mlirAffineModExprGet(
    lhs: MlirAffineExpr, rhs: MlirAffineExpr
) -> MlirAffineExpr:
    """Creates an affine mod expression with 'lhs' and 'rhs'."""
    return MLIR_func["mlirAffineModExprGet", MlirAffineExpr](lhs, rhs)


# ===----------------------------------------------------------------------===//
#  Affine FloorDiv Expression.
# ===----------------------------------------------------------------------===//


fn mlirAffineExprIsAFloorDiv(affine_expr: MlirAffineExpr) -> Bool:
    """Checks whether the given affine expression is an floordiv expression."""
    return MLIR_func["mlirAffineExprIsAFloorDiv", Bool](affine_expr)


fn mlirAffineFloorDivExprGet(
    lhs: MlirAffineExpr, rhs: MlirAffineExpr
) -> MlirAffineExpr:
    """Creates an affine floordiv expression with 'lhs' and 'rhs'."""
    return MLIR_func["mlirAffineFloorDivExprGet", MlirAffineExpr](lhs, rhs)


# ===----------------------------------------------------------------------===//
#  Affine CeilDiv Expression.
# ===----------------------------------------------------------------------===//


fn mlirAffineExprIsACeilDiv(affine_expr: MlirAffineExpr) -> Bool:
    """Checks whether the given affine expression is an ceildiv expression."""
    return MLIR_func["mlirAffineExprIsACeilDiv", Bool](affine_expr)


fn mlirAffineCeilDivExprGet(
    lhs: MlirAffineExpr, rhs: MlirAffineExpr
) -> MlirAffineExpr:
    """Creates an affine ceildiv expression with 'lhs' and 'rhs'."""
    return MLIR_func["mlirAffineCeilDivExprGet", MlirAffineExpr](lhs, rhs)


# ===----------------------------------------------------------------------===//
#  Affine Binary Operation Expression.
# ===----------------------------------------------------------------------===//


fn mlirAffineExprIsABinary(affine_expr: MlirAffineExpr) -> Bool:
    """Checks whether the given affine expression is binary."""
    return MLIR_func["mlirAffineExprIsABinary", Bool](affine_expr)


fn mlirAffineBinaryOpExprGetLHS(affine_expr: MlirAffineExpr) -> MlirAffineExpr:
    """Returns the left hand side affine expression of the given affine binary
    operation expression."""
    return MLIR_func["mlirAffineBinaryOpExprGetLHS", MlirAffineExpr](
        affine_expr
    )


fn mlirAffineBinaryOpExprGetRHS(affine_expr: MlirAffineExpr) -> MlirAffineExpr:
    """Returns the right hand side affine expression of the given affine binary
    operation expression."""
    return MLIR_func["mlirAffineBinaryOpExprGetRHS", MlirAffineExpr](
        affine_expr
    )
