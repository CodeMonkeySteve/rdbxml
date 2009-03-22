%module dbxml

%apply int {u_int32_t};

%include "db-minimal.i"

%alias XmlManager::createQueryContext "create_query_context";

%alias XmlContainer::getManager "manager";

%alias XmlDocument::getContentAsString "to_s";
%alias XmlDocument::getName "name";
%alias XmlDocument::setName "name=";
%alias XmlDocument::getContent "content";
%alias XmlDocument::setContent "content=";

%alias XmlQueryContext::getNamespace "namespace";
%alias XmlQueryContext::setNamespace "namespace=";
%alias XmlQueryContext::getDefaultCollection "collection";
%alias XmlQueryContext::setDefaultCollection "collection=";

%alias XmlValue::asString "to_s";
%alias XmlValue::asNumber "to_f";
%alias XmlValue::asDocument "to_doc";

%exceptionclass DbException;
class DbException;

%exceptionclass XmlException;
%alias XmlException::what "to_s";
%alias XmlException::getExceptionCode "err";

class XmlException : public std::exception {
public:
  enum ExceptionCode {
    INTERNAL_ERROR,  ///< An internal error occured.
    CONTAINER_OPEN,  ///< The container is open.
    CONTAINER_CLOSED,  ///< The container is closed.
    NULL_POINTER,     ///< null pointer exception
    INDEXER_PARSER_ERROR,  ///< XML Indexer could not parse a document.
    DATABASE_ERROR,  ///< Berkeley DB reported a database problem.
    QUERY_PARSER_ERROR,  ///< The query parser was unable to parse the expression.
    UNUSED1_ERROR,  ///< Unused
    QUERY_EVALUATION_ERROR,  ///< The query evaluator was unable to execute the expression.
    UNUSED2_ERROR,  ///< Unused
    LAZY_EVALUATION,  ///< XmlResults is lazily evaluated.
    DOCUMENT_NOT_FOUND,  ///< The specified document could not be found
    CONTAINER_EXISTS,  ///< The container already exists.
    UNKNOWN_INDEX,  ///< The indexing strategy name is unknown.
    INVALID_VALUE, ///< An invalid parameter was passed.
    VERSION_MISMATCH, ///< The container version and the dbxml library version are not compatible.
    EVENT_ERROR, ///< Error using the event reader
    CONTAINER_NOT_FOUND, ///< The specified container could not be found
    TRANSACTION_ERROR, ///< An XmlTransaction has already been committed or aborted
    UNIQUE_ERROR, ///< A uniqueness constraint has been violated
    NO_MEMORY_ERROR, ///< Unable to allocate memory
    OPERATION_TIMEOUT, ///< An operation timed out
    OPERATION_INTERRUPTED ///< An operation was explicitly interrupted
  };

  explicit XmlException(const DbException &e, const char *file = 0, int line = 0);
  XmlException(const XmlException &);
  virtual ~XmlException() throw();
  virtual const char *what() const throw();

  ExceptionCode getExceptionCode() const;
  int getDbErrno() const;
};

%exception {
  try {
    $action
  } catch ( DbException &ex ) {
    %raise( SWIG_NewPointerObj(new DbException(ex), SWIGTYPE_p_DbException, SWIG_POINTER_OWN),
            "BDB Exception", SWIGTYPE_p_DbException );
  } catch ( XmlException &ex ) {
    %raise( SWIG_NewPointerObj(new XmlException(ex), SWIGTYPE_p_XmlException, SWIG_POINTER_OWN),
            "BDB XXML Exception", SWIGTYPE_p_XmlException );
  }
}

