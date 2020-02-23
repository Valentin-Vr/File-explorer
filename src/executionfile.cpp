#include "executionfile.h"

ExecutionFile::ExecutionFile(QObject *parent): QObject (parent)
{

}

void ExecutionFile::openFile(QString path, QString flag)
{
    m_fale=path+flag;
}
