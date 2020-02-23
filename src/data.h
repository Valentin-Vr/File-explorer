#ifndef DATA_H
#define DATA_H

#include <QString>

struct Data {
    Data(const QString &name, const QString &path, const QString &flag) {
        m_name = name;
        m_path = path;
        m_flag = flag;
    }
    //,const QString &size)
    QString m_name;
    QString m_path;
    QString m_flag;
};



#endif // DATA_H
