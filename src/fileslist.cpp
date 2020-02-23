#include "fileslist.h"

#include <QStandardPaths>
#include <QDebug>
#include <QStringList>

static QString PATH = QStandardPaths::writableLocation(QStandardPaths::DesktopLocation);

FilesList::FilesList(QObject *parent): QAbstractListModel(parent)
{
    updateData(PATH);
}

int FilesList::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid()) {
        return 0;
    }
    return m_data.size();
}

QVariant FilesList::data(const QModelIndex &index, int Role) const
{
    if (!index.isValid()) {
        return QVariant();
    }

    switch (Role) {
    case Name:
        return m_data[index.row()].m_name;
    case Path:
        return m_data[index.row()].m_path;
    case Flag:
        return m_data[index.row()].m_flag;
    default:
        return QVariant();
    }

}

QHash<int, QByteArray> FilesList::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[Name] = "name";
    roles[Path] = "path";
    roles[Flag] = "flag";
    return roles;
}

void FilesList::updateData(QString Address)
{
    if (Address == "") {
    }
    else {
    beginResetModel ();
    QDir way(Address);
    QStringList filters;
    filters << "*.*"<<"*";

    m_data.clear();

    QList<QFileInfo>list = way.entryInfoList (filters, QDir::AllEntries | QDir::NoDotAndDotDot);
    for(auto iter: list) {
        if( iter.completeSuffix()=="") {
            m_data.append(Data(iter.baseName(), iter.filePath(),"<папка>"));
        }
        else{
            m_data.append(Data(iter.baseName(), iter.filePath(),iter.completeSuffix()));
        }
    }


    setOldPath(Nowpath());

    setNowpath(Address);

    endResetModel ();
    }
}

QString FilesList::oldPath() const
{
    return m_oldPath;
}

QString FilesList::Nowpath() const
{
    return m_nowpath;
}

void FilesList::setOldPath(QString oldPath)
{
    if (m_oldPath == oldPath)
        return;

    m_oldPath = oldPath;
    emit oldPathChanged(m_oldPath);
}

void FilesList::setNowpath(QString nowpath)
{
    if (m_nowpath == nowpath)
        return;

    m_nowpath = nowpath;
    emit NowpathChanged(m_nowpath);
}

