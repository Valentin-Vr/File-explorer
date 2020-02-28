#ifndef EXECUTIONFILE_H
#define EXECUTIONFILE_H
#include <QObject>

class ExecutionFile : public QObject
{
    Q_OBJECT
public:
    ExecutionFile(QObject *parent = nullptr);
    Q_INVOKABLE void openFile(QString path,QString flag);

private:
 QString m_fale;
};

#endif // EXECUTIONFILE_H
