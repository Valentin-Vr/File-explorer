#ifndef FILESLIST_H
#define FILESLIST_H
#include "data.h"
#include <QAbstractListModel>
#include <QDir>


class FilesList : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(QString nowpath READ Nowpath WRITE setNowpath NOTIFY NowpathChanged)
    Q_PROPERTY(QString oldPath READ oldPath WRITE setOldPath NOTIFY oldPathChanged)
public:
    enum Roles {
        Name,
        Path,
        Flag
    };

    FilesList(QObject *parent = nullptr);

    int rowCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int Role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE void updateData(QString Address);




    QString oldPath() const;

    QString Nowpath() const;

public slots:


    void setOldPath(QString oldPath);

    void setNowpath(QString nowpath);

signals:


    void oldPathChanged(QString oldPath);

    void NowpathChanged(QString nowpath);

private:
    QList<Data>m_data;

    QString m_oldPath;
    QString m_nowpath;
};

#endif // FILESLIST_H
