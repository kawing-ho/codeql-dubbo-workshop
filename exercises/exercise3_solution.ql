/**
 * @kind path-problem
 */
import java
import semmle.code.java.dataflow.TaintTracking

class DubboCodecDecodeBodyMethod extends Method {
  DubboCodecDecodeBodyMethod() {
      this.getName() = "decodeBody" and
      this.getDeclaringType().hasQualifiedName("org.apache.dubbo.rpc.protocol.dubbo", "DubboCodec")
  }
}

class ObjectInputReadMethod extends Method {
  ObjectInputReadMethod() {
      this.getName().matches("read%") and
      this.getDeclaringType()
          .getASourceSupertype*()
          .hasQualifiedName("org.apache.dubbo.common.serialize", "ObjectInput")
  }
}

class SerializationDeserializeMethod extends Method {
  SerializationDeserializeMethod() {
      this.getName() = "deserialize" and
      this.getDeclaringType().hasQualifiedName("org.apache.dubbo.common.serialize", "Serialization")
  }
}

module InsecureConfig implements DataFlow::ConfigSig {

  predicate isSource(DataFlow::Node source) {
    exists(DubboCodecDecodeBodyMethod m |
      m.getParameter([1,2]) = source.asParameter()
     )
  }

  predicate isSink(DataFlow::Node sink) {
    exists(MethodCall ma |
      ma.getMethod() instanceof ObjectInputReadMethod and
      ma.getQualifier() = sink.asExpr()
    )
  }

  predicate isAdditionalFlowStep(DataFlow::Node n1, DataFlow::Node n2) {
    exists(MethodCall ma |
      ma.getMethod() instanceof SerializationDeserializeMethod and
      ma.getArgument(1) = n1.asExpr() and
      ma = n2.asExpr()
    )
  }
}

module InsecureFlow = TaintTracking::Global<InsecureConfig>;
import InsecureFlow::PathGraph

from InsecureFlow::PathNode source, InsecureFlow::PathNode sink 
where InsecureFlow::flowPath(source, sink)
select sink, source, sink, "unsafe deserialization"
