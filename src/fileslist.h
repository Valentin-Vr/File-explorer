#ifndef FILESLIST_H
#define FILESLIST_H
#include "data.h"
#include <QAbstractListModel>
#include <QDir>


class FilesList : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(QString currentPath READ currentPath NOTIFY currentPathChanged)
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

    Q_INVOKABLE void updateData(QString Path);

    Q_INVOKABLE void goHome();
//    Q_INVOKABLE void goToDir(const QString &path);
    Q_INVOKABLE void goBack();

    QString currentPath() const;

    void setCurrentPath(QString currentPath);

signals:
    void currentPathChanged(QString currentPath);

private:
    QList<Data>m_data;

    QString m_currentPath;
};

#endif // FILESLIST_H
