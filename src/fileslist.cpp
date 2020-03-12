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

void FilesList::updateData(QString Path)
{



    setCurrentPath(Path);
    QDir way(currentPath());
    m_data.clear();

    QList<QFileInfo>list = way.entryInfoList (QDir::AllEntries | QDir::NoDotAndDotDot);
    for(auto iter: list) {
        if( iter.completeSuffix()=="") {
            m_data.append(Data(iter.baseName(), iter.filePath(),"<папка>"));
        }
        else{
            m_data.append(Data(iter.baseName(), iter.filePath(),iter.completeSuffix()));
        }
    }
    beginResetModel();
    endResetModel ();

}

void FilesList::goHome()
{
    updateData(QStandardPaths::writableLocation(QStandardPaths::DesktopLocation));
}

void FilesList::goBack()
{
    QDir way(m_currentPath);
    way.cdUp();
    updateData(way.path());
}

QString FilesList::currentPath() const
{
    return m_currentPath;
}

void FilesList::setCurrentPath(QString currentPath)
{
    if (m_currentPath == currentPath)
        return;

    m_currentPath = currentPath;
    emit currentPathChanged(m_currentPath);
}


